<script setup lang="ts">
import { isValidEmail } from '@/utils/email'
import { shallowRef } from 'vue'

const email = shallowRef('')
const emailError = shallowRef('')
// Password validation is not implemented yet (same as the original).
const passwordError = shallowRef('')
const rePwdError = shallowRef('')


function emailValidation(): boolean {
  if (!email.value) {
    emailError.value = 'Email can not be empty!!!'
    return false
  }
  if (isValidEmail(email.value)) {
    emailError.value = ''
    return true
  }
  emailError.value = 'You have entered an invalid email address!'
  return false
}
</script>

<template>
  <div>
    <section class="vh-100">
      <div class="container mx-auto">
        <div class="wrapped-card">
          <div class="card">
            <div class="grid grid-cols-1 md:grid-cols-12">
              <div class="hidden md:block md:col-span-5">
                <img
                  src="https://i.pinimg.com/564x/7a/70/22/7a702201100597e8d1f7ee091a94b996.jpg"
                  alt="register form" class="card-image" />
              </div>
              <div class="md:col-span-7 flex items-center">
                <div class="card-body w-full">
                  <a-form layout="vertical">
                    <div class="fairytale-wrapper">
                      <span>Fairytale Manga</span>
                    </div>
                    <h5>Đăng kí tài khoản mới</h5>
                    <a-form-item label="Email">
                      <a-input v-model:value="email" type="email" size="large" placeholder="Nhập vào địa chỉ email"
                               @keyup="emailValidation" />
                      <span class="error-msg">{{ emailError }}</span>
                    </a-form-item>
                    <a-form-item label="Mật khẩu">
                      <a-input-password size="large" placeholder="Nhập vào mật khẩu" />
                      <span class="error-msg">{{ passwordError }}</span>
                    </a-form-item>
                    <a-form-item label="Nhập lại mật khẩu">
                      <a-input-password size="large" placeholder="Nhập lại mật khẩu" />
                      <span class="error-msg">{{ rePwdError }}</span>
                    </a-form-item>
                    <div class="form-btn">
                      <a-button type="primary" size="large" block>Đăng kí</a-button>
                    </div>
                    <p class="suggest">Đã có tài khoản?
                      <router-link :to="{ name: 'LoginView' }">Đăng nhập tại đây</router-link>
                    </p>
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
section {
  background: url('@/assets/images/bg.png') no-repeat top center fixed;
  color: white;
  background-size: cover;
}

.container {
  padding-top: 3rem;
  padding-bottom: 3rem;
  height: 100%;
}

.wrapped-card {
  display: flex;
  justify-content: center;
  height: 100%;
  align-items: center;
}

.card {
  border-radius: 1rem;
  overflow: hidden;
  width: 100%;
  max-width: 64rem;
  background: linear-gradient(120deg, #BF953F, #FCF6BA, #B38728, #FBF5B7, #AA771C);
}

.card-image {
  max-width: 100%;
  height: 100%;
  object-fit: cover;
}

.card-body {
  color: black;
  padding: 2rem;
}

.fairytale-wrapper {
  padding-bottom: 0.25rem;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
}

.fairytale-wrapper span {
  font-weight: 700;
  margin-bottom: 0;
  font-size: calc(1.375rem + 1.5vw);
}

h5 {
  letter-spacing: 1px;
  font-weight: 600;
  padding-bottom: 1rem;
  margin-bottom: 1rem;
}

.form-btn {
  padding-top: 0.25rem;
  margin-bottom: 1.5rem;
}

.suggest {
  color: #393f81;
  font-weight: 500;
}

p a {
  color: #393f81;
}

.error-msg {
  color: firebrick;
  font-weight: 500;
}

* {
  font-family: 'Alegreya', serif;
  color: black;
}
</style>
