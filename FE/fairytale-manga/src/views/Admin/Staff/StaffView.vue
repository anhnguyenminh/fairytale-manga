<script setup lang="ts">
import { onMounted, reactive, shallowRef } from 'vue'
import { Modal, message } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import { getApiError } from '@/api/errors'
import { ROLE_OPTIONS, type AdminRole } from '@/constants/admin'
import defaultAvatar from '@/assets/images/default-avatar.svg'
import { useProfileStore } from '@/stores/profile'
import { usePaginatedList } from '@/stores/usePaginatedList'
import type { AdminProfile } from '@/types/models'

const profile = useProfileStore()
const { items: staff, currentPage, totalPages, totalCount, pageSize, fetchPage, goToPage } =
  usePaginatedList<AdminProfile>('admins/admins', 'admins')

const columns = [
  { title: '', key: 'avatar', width: 64 },
  { title: 'Username', dataIndex: 'username', key: 'username' },
  { title: 'Email', dataIndex: 'email', key: 'email' },
  { title: 'Vai trò', key: 'role', width: 190 },
  { title: 'Actions', key: 'actions', align: 'right' as const, width: 120 },
]

const modalOpen = shallowRef(false)
const saving = shallowRef(false)
const newAccount = reactive({ email: '', username: '', password: '', role: 'moderator' as AdminRole })

function openCreate() {
  Object.assign(newAccount, { email: '', username: '', password: '', role: 'moderator' })
  modalOpen.value = true
}

async function createAccount() {
  saving.value = true
  try {
    await adminApi.post('admins/admins', newAccount)
    message.success('Đã tạo tài khoản')
    modalOpen.value = false
    await fetchPage()
  } catch (err) {
    message.error(getApiError(err, 'Không tạo được tài khoản'))
  } finally {
    saving.value = false
  }
}

async function changeRole(account: AdminProfile, role: AdminRole) {
  try {
    await adminApi.put(`admins/admins/${account.id}`, { role })
    message.success('Đã đổi vai trò')
  } catch (err) {
    message.error(getApiError(err))
  } finally {
    await fetchPage()
  }
}

function confirmDeleteAccount(account: AdminProfile) {
  Modal.confirm({
    title: `Xóa tài khoản ${account.username || account.email}?`,
    okType: 'danger',
    async onOk() {
      try {
        await adminApi.delete(`admins/admins/${account.id}`)
        await fetchPage()
      } catch (err) {
        message.error(getApiError(err))
      }
    },
  })
}

onMounted(fetchPage)
</script>

<template>
  <div class="p-4">
    <a-card>
      <template #title><span class="font-bold uppercase">Staff</span></template>
      <template #extra><a-button type="primary" @click="openCreate">Thêm tài khoản</a-button></template>
      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="staff" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'avatar'">
            <img class="h-8 w-8 rounded-full object-cover" :src="record.image_url || defaultAvatar" alt="" />
          </template>
          <template v-else-if="column.key === 'role'">
            <a-select
              class="w-full"
              size="small"
              :value="record.role"
              :options="ROLE_OPTIONS"
              :disabled="record.id === profile.admin?.id"
              @change="(value) => changeRole(record as AdminProfile, value as AdminRole)"
            />
          </template>
          <template v-else-if="column.key === 'actions'">
            <a-button danger size="small" :disabled="record.id === profile.admin?.id" @click="confirmDeleteAccount(record as AdminProfile)">
              Delete
            </a-button>
          </template>
        </template>
      </a-table>
      <div v-if="totalPages > 1" class="mt-4 flex justify-center">
        <a-pagination :current="currentPage" :total="totalCount" :page-size="pageSize" :show-size-changer="false" @change="goToPage" />
      </div>
    </a-card>

    <a-modal v-model:open="modalOpen" title="Thêm tài khoản" :confirm-loading="saving" ok-text="Tạo" @ok="createAccount">
      <a-form layout="vertical" :model="newAccount">
        <a-form-item label="Email" name="email"><a-input v-model:value="newAccount.email" /></a-form-item>
        <a-form-item label="Username" name="username"><a-input v-model:value="newAccount.username" /></a-form-item>
        <a-form-item label="Mật khẩu (tối thiểu 8 ký tự)" name="password">
          <a-input-password v-model:value="newAccount.password" autocomplete="new-password" />
        </a-form-item>
        <a-form-item label="Vai trò" name="role"><a-select v-model:value="newAccount.role" :options="ROLE_OPTIONS" /></a-form-item>
      </a-form>
    </a-modal>
  </div>
</template>
