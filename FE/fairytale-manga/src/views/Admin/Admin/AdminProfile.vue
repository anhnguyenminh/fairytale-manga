<script setup lang="ts">
import { computed, onBeforeUnmount, reactive, shallowRef, useTemplateRef, watch } from 'vue'
import { message } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import { getApiError } from '@/api/errors'
import { ROLE_LABELS } from '@/constants/admin'
import { firstFile } from '@/utils/dom'
import { useProfileStore } from '@/stores/profile'
import '@/assets/css/admin-profile.css'

const profile = useProfileStore()

const profileForm = reactive({ username: '', full_name: '', phone: '', bio: '' })
const credentials = reactive({ email: '', oldPassword: '', password: '', reEnterPwd: '' })
const savingProfile = shallowRef(false)
const savingCredentials = shallowRef(false)
const avatarInput = useTemplateRef<HTMLInputElement>('avatarInput')
const avatarPreview = shallowRef<string | null>(null)

const roleLabel = computed(() => (profile.admin ? ROLE_LABELS[profile.admin.role] : ''))
const shownAvatar = computed(() => avatarPreview.value ?? profile.adminAvatar)

// Fill the forms from the loaded profile (the router guard has already fetched it).
watch(
  () => profile.admin,
  (admin) => {
    if (!admin) return
    profileForm.username = admin.username ?? ''
    profileForm.full_name = admin.full_name ?? ''
    profileForm.phone = admin.phone ?? ''
    profileForm.bio = admin.bio ?? ''
    credentials.email = admin.email
  },
  { immediate: true },
)

function revokePreview() {
  if (avatarPreview.value) URL.revokeObjectURL(avatarPreview.value)
}

function onAvatarChange(event: Event) {
  revokePreview()
  const file = firstFile(event)
  avatarPreview.value = file ? URL.createObjectURL(file) : null
}

onBeforeUnmount(revokePreview)

async function saveProfile() {
  const formData = new FormData()
  Object.entries(profileForm).forEach(([key, value]) => formData.append(key, value))
  const file = avatarInput.value?.files?.[0]
  if (file) formData.append('image', file)
  savingProfile.value = true
  try {
    await adminApi.put('admins/admins/update_profile', formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    await profile.fetchAdmin()
    revokePreview()
    avatarPreview.value = null
    if (avatarInput.value) avatarInput.value.value = ''
    message.success('Update profile completed!')
  } catch (err) {
    message.error(getApiError(err))
  } finally {
    savingProfile.value = false
  }
}

async function saveCredentials() {
  savingCredentials.value = true
  try {
    await adminApi.put('admins/admins/update_admin', credentials)
    await profile.fetchAdmin()
    credentials.oldPassword = credentials.password = credentials.reEnterPwd = ''
    message.success('Update account completed!')
  } catch (err) {
    message.error(getApiError(err))
  } finally {
    savingCredentials.value = false
  }
}
</script>

<template>
  <div class="mx-auto flex max-w-5xl flex-col px-4">
    <div class="page-title py-4">
      <h3 class="my-0 font-bold text-neutral-800">Overview</h3>
    </div>
    <div class="admin-wrapped-content">
      <a-card class="mb-3">
        <div class="flex flex-wrap sm:flex-nowrap">
          <div class="avt-admin">
            <div class="symbol relative">
              <img class="symbol-avt rounded-md object-cover" :src="shownAvatar" alt="avatar" />
            </div>
          </div>
          <div class="flex flex-col">
            <div class="username-admin mb-2">{{ profile.adminName }}</div>
            <div v-if="profile.admin?.full_name" class="position-admin">{{ profile.admin.full_name }}</div>
            <div class="position-admin">{{ roleLabel }}</div>
            <div class="position-admin">Email: <b>{{ profile.admin?.email }}</b></div>
          </div>
        </div>
      </a-card>
    </div>

    <a-tabs>
      <a-tab-pane key="profile" tab="Hồ sơ">
        <a-form layout="vertical" :model="profileForm" class="rounded-lg bg-[#fafafa] px-4 py-5" @finish="saveProfile">
          <a-form-item label="Ảnh đại diện" extra="Để trống thì dùng ảnh mặc định.">
            <input ref="avatarInput" class="w-full max-w-full" type="file" accept="image/*" @change="onAvatarChange" />
          </a-form-item>
          <a-form-item label="Username" name="username" extra="Hiển thị ở thanh bên. Để trống thì hiện “Admin Control”.">
            <a-input v-model:value="profileForm.username" placeholder="Enter username" />
          </a-form-item>
          <a-form-item label="Họ và tên" name="full_name">
            <a-input v-model:value="profileForm.full_name" placeholder="Enter full name" />
          </a-form-item>
          <a-form-item label="Số điện thoại" name="phone">
            <a-input v-model:value="profileForm.phone" placeholder="Enter phone number" />
          </a-form-item>
          <a-form-item label="Giới thiệu" name="bio">
            <a-textarea v-model:value="profileForm.bio" :auto-size="{ minRows: 3, maxRows: 6 }" placeholder="A few words about you" />
          </a-form-item>
          <a-form-item label="Vai trò">
            <a-input :value="roleLabel" disabled />
          </a-form-item>
          <div class="text-center">
            <a-button type="primary" html-type="submit" :loading="savingProfile">Save profile</a-button>
          </div>
        </a-form>
      </a-tab-pane>

      <a-tab-pane key="security" tab="Tài khoản & mật khẩu">
        <a-form layout="vertical" :model="credentials" class="rounded-lg bg-[#fafafa] px-4 py-5" @finish="saveCredentials">
          <a-form-item label="Email" name="email" :rules="[{ required: true, type: 'email', message: 'Enter a valid email' }]">
            <a-input v-model:value="credentials.email" placeholder="Enter email" />
          </a-form-item>
          <a-form-item label="Mật khẩu hiện tại" name="oldPassword" :rules="[{ required: true, message: 'Enter your current password' }]">
            <a-input-password v-model:value="credentials.oldPassword" autocomplete="off" />
          </a-form-item>
          <a-form-item label="Mật khẩu mới" name="password" extra="Để trống nếu chỉ đổi email.">
            <a-input-password v-model:value="credentials.password" autocomplete="off" />
          </a-form-item>
          <a-form-item label="Nhập lại mật khẩu mới" name="reEnterPwd">
            <a-input-password v-model:value="credentials.reEnterPwd" autocomplete="off" />
          </a-form-item>
          <div class="text-center">
            <a-button type="primary" html-type="submit" :loading="savingCredentials">Save account</a-button>
          </div>
        </a-form>
      </a-tab-pane>
    </a-tabs>
  </div>
</template>
