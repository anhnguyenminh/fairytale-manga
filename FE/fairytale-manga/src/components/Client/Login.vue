<script setup lang="ts">
import { computed, onMounted, shallowRef } from 'vue'
import { useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
import axios from 'axios'
import { readerApi } from '@/api/client'
import { useAuthStore } from '@/stores/auth'
import { usePreferencesStore } from '@/stores/preferences'
import { GENDER_THEMES } from '@/constants/gender'

const router = useRouter()
const auth = useAuthStore()
const preferences = usePreferencesStore()
const loginImage = computed(() => GENDER_THEMES[preferences.gender ?? 'male'].loginImage)

const error = shallowRef('')
const email = shallowRef('')
const password = shallowRef('')
const loading = shallowRef(false)

const EMAIL_RE = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/

onMounted(() => {
  if (auth.readerToken) router.push('/')
})

function emailValidation(): boolean {
  if (!email.value) {
    error.value = 'Email can not be empty!!!'
    return false
  }
  if (EMAIL_RE.test(email.value)) {
    error.value = ''
    return true
  }
  error.value = 'You have entered an invalid email address!'
  return false
}

function passwordValidation(): boolean {
  if (password.value.length < 8) {
    error.value = 'Password can not be empty and must be rather than 8 characters!!!'
    return false
  }
  error.value = ''
  return true
}

async function userAuthenticate() {
  loading.value = true
  try {
    const response = await readerApi.post<{ token: string }>('readers/sessions', {
      email: email.value,
      password: password.value,
    })
    if (response.status === 200) {
      auth.setReaderToken(response.data.token)
      router.push({ path: '/' })
    }
  } catch (err) {
    const validation = axios.isAxiosError(err) ? err.response?.data?.validation : undefined
    message.error(validation ?? 'Đăng nhập thất bại')
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <div>
    <section class="vh-100">
      <div class="container mx-auto wrapped-container">
        <div class="wrapped-card">
          <div class="card">
            <div class="grid grid-cols-1 md:grid-cols-12">
              <div class="hidden md:block md:col-span-5">
                <img
                  :src="loginImage"
                  alt="login form" class="card-image" />
              </div>
              <div class="md:col-span-7 flex items-center">
                <div class="card-body w-full">
                  <a-form layout="vertical" @finish="userAuthenticate">
                    <div class="fairytale-wrapper">
                      <span>Fairytale Manga</span>
                    </div>
                    <h5>Đăng nhập tài khoản của bạn</h5>
                    <a-form-item label="Email">
                      <a-input v-model:value="email" type="email" size="large" placeholder="Nhập vào địa chỉ email"
                               @keyup="emailValidation" />
                    </a-form-item>
                    <a-form-item label="Mật khẩu">
                      <a-input-password v-model:value="password" size="large" placeholder="Nhập vào mật khẩu"
                                        @keyup="passwordValidation" />
                    </a-form-item>
                    <div class="form-btn">
                      <a-button type="primary" html-type="submit" size="large" block :loading="loading">Đăng nhập</a-button>
                    </div>
                    <p class="mb-4 pb-lg-2 suggest">Chưa có tài khoản?
                      <router-link :to="{ name: 'RegisterView' }">Đăng kí tại đây</router-link>
                    </p>
                    <span class="error-msg">{{ error }}</span>
                  </a-form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
@import url(@/assets/css/login.css);

.container {
  height: 100%;
}

.wrapped-card .card {
  overflow: hidden;
  width: 100%;
  max-width: 64rem;
}

.card-image {
  object-fit: cover;
  border-radius: 0;
}

.card-body {
  padding: 2rem;
}

.form-btn {
  margin-bottom: 1.5rem;
}
</style>
