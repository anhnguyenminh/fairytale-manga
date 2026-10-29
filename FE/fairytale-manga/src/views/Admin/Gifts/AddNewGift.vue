<script setup lang="ts">
import { reactive, shallowRef } from 'vue'
import { useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
import { ArrowLeftOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'

const router = useRouter()


const form = reactive({ name: '', score: '', stock: '' })
const file = shallowRef<File | null>(null)
const fileKey = shallowRef(0)

function onFileChange(e: Event) {
  file.value = (e.target as HTMLInputElement).files?.[0] ?? null
}

function goBack() {
  router.push({ path: '/admin/gifts' })
}

function onReset() {
  form.name = ''
  form.score = ''
  form.stock = ''
  file.value = null
  fileKey.value++
}


async function onSubmit() {
  const formData = new FormData()
  formData.append('name', form.name)
  formData.append('score', form.score)
  formData.append('stock', form.stock)
  if (file.value) formData.append('image', file.value)
  try {
    await adminApi.post('/admins/gifts', formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    message.success('Add gift successfully!')
    router.push({ path: '/admin/gifts' })
  } catch {
    message.error('Something wrong happen !')
  }
}
</script>

<template>
  <div class="mx-auto w-3/5">
    <div class="flex items-center">
      <a-button @click="goBack"><template #icon><ArrowLeftOutlined /></template></a-button>
      <h2 class="mx-5 my-0">Create New Gift</h2>
    </div>
    <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
      <a-form layout="vertical" @finish="onSubmit">
        <a-form-item label="Title">
          <a-input v-model:value="form.name" placeholder="Gift name..." required />
        </a-form-item>
        <div class="flex gap-20">
          <a-form-item label="Score to Achieved">
            <a-input v-model:value="form.score" type="number" placeholder="10.000..." required />
          </a-form-item>
          <a-form-item label="Number in Stock">
            <a-input v-model:value="form.stock" type="number" placeholder="1" required />
          </a-form-item>
        </div>
        <a-form-item label="Select image">
          <input class="w-full max-w-full" :key="fileKey" type="file" accept="image/*" required @change="onFileChange" />
        </a-form-item>
        <div class="flex justify-center gap-6">
          <a-button @click="onReset">Reset</a-button>
          <a-button type="primary" html-type="submit">Save</a-button>
        </div>
      </a-form>
    </div>
    <a-card class="mt-3" title="Preview Data">
      <p class="m-0 font-bold">Name: {{ form.name }}</p>
      <p class="m-0 font-bold">Score: {{ form.score }}</p>
      <p class="m-0 font-bold">Stock: {{ form.stock }}</p>
    </a-card>
  </div>
</template>
