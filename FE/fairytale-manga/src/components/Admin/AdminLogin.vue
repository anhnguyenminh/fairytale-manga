<script setup lang="ts">
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
import { isAxiosError } from 'axios'
import { adminApi } from '@/api/client'
import { useAuthStore } from '@/stores/auth'

const router = useRouter()
const auth = useAuthStore()

const admin = reactive({ adminEmail: '', adminPwd: '' })

if (auth.adminToken) router.push('/admin/stories')

async function adminAuthenticate() {
  try {
    const response = await adminApi.post('admins/sessions', {
      email: admin.adminEmail,
      password: admin.adminPwd,
    })
    if (response.status === 200) {
      auth.setAdminToken(response.data.token)
      router.push({ path: '/admin/stories' })
    }
  } catch (error) {
    const validation = isAxiosError(error) ? error.response?.data?.validation : undefined
    message.error(validation ?? 'Login failed, please check again')
  }
}
</script>

<template>
  <section class="flex min-h-screen items-center justify-center bg-[#6959CD] px-4 py-12">
    <div class="w-full max-w-md rounded-2xl bg-white p-10 shadow-lg">
      <h3 class="mb-8 text-center text-2xl">Login</h3>
      <a-form layout="vertical" @finish="adminAuthenticate">
        <a-form-item name="email">
          <a-input v-model:value="admin.adminEmail" type="email" size="large" placeholder="Email" required />
        </a-form-item>
        <a-form-item name="password">
          <a-input-password v-model:value="admin.adminPwd" size="large" placeholder="Password" required />
        </a-form-item>
        <a-form-item>
          <a-checkbox>Remember password</a-checkbox>
        </a-form-item>
        <a-button type="primary" size="large" block html-type="submit">Login</a-button>
      </a-form>
    </div>
  </section>
</template>
