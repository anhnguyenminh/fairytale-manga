<script setup lang="ts">
import { reactive, shallowRef } from 'vue'
import { useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
import { isAxiosError } from 'axios'
import { adminApi } from '@/api/client'
import { useAuthStore } from '@/stores/auth'
import { useProfileStore } from '@/stores/profile'

const router = useRouter()
const auth = useAuthStore()
const profile = useProfileStore()

const admin = reactive({ email: '', password: '' })
const remember = shallowRef(false)

if (auth.adminToken) router.push('/admin/stories')

async function adminAuthenticate() {
  try {
    const response = await adminApi.post('admins/sessions', {
      email: admin.email,
      password: admin.password,
    })
    if (response.status === 200) {
      profile.resetAdmin()
      auth.setAdminToken(response.data.token, remember.value)
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
      <a-form layout="vertical" :model="admin" @finish="adminAuthenticate">
        <a-form-item name="email">
          <a-input v-model:value="admin.email" type="email" size="large" placeholder="Email" required />
        </a-form-item>
        <a-form-item name="password">
          <a-input-password v-model:value="admin.password" size="large" placeholder="Password" required />
        </a-form-item>
        <a-form-item>
          <a-checkbox v-model:checked="remember">Remember me</a-checkbox>
        </a-form-item>
        <a-button type="primary" size="large" block html-type="submit">Login</a-button>
      </a-form>
    </div>
  </section>
</template>
