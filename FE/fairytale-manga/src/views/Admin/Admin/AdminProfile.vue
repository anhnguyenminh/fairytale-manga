<script setup lang="ts">
import { reactive, shallowRef, onMounted } from 'vue'
import { message } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import '@/assets/css/admin-profile.css'

const form = reactive({
  username: '',
  email: '',
  password: '',
  oldPassword: '',
  reEnterPwd: '',
})
const show = shallowRef(false)

function editProfile() {
  show.value = true
}

async function onSubmit() {
  try {
    await adminApi.put('admins/admins/update_admin/', form)
    message.success('Update profile completed!')
    show.value = false
  } catch {
    message.error('Wrong password, please try again !!!')
  }
}

onMounted(async () => {
  try {
    const { data } = await adminApi.get('admins/admins/show_current_admin/')
    form.username = data.username
    form.email = data.email
  } catch (error) {
    console.error(error)
  }
})
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
              <img
                class="symbol-avt"
                src="https://preview.keenthemes.com/metronic8/demo15/assets/media/avatars/300-1.jpg"
                alt="image"
              />
            </div>
          </div>
          <div class="flex flex-1 flex-wrap items-start justify-between">
            <div class="flex flex-col">
              <div class="username-admin mb-2">{{ form.username }}</div>
              <div class="position-admin">Administrator</div>
              <div class="position-admin">Email: <b>{{ form.email }}</b></div>
            </div>
            <a-button size="small" @click="editProfile">Edit</a-button>
          </div>
        </div>
      </a-card>
    </div>

    <div v-if="show" class="my-6 rounded-lg bg-[#fafafa] px-4 py-5">
      <a-form layout="vertical" @finish="onSubmit">
        <a-form-item label="Username">
          <a-input v-model:value="form.username" placeholder="Enter username" required />
        </a-form-item>
        <a-form-item label="Email">
          <a-input v-model:value="form.email" type="email" placeholder="Enter email" required />
        </a-form-item>
        <a-form-item label="Old Password">
          <a-input-password v-model:value="form.oldPassword" placeholder="Please enter old password" autocomplete="off" required />
        </a-form-item>
        <a-form-item label="New Password">
          <a-input-password v-model:value="form.password" placeholder="Please enter new password" autocomplete="off" />
        </a-form-item>
        <a-form-item label="Re-Enter New Password">
          <a-input-password v-model:value="form.reEnterPwd" placeholder="Re-enter new password" autocomplete="off" />
        </a-form-item>
        <div class="text-center">
          <a-button type="primary" html-type="submit">Save profile</a-button>
        </div>
      </a-form>
    </div>
  </div>
</template>
