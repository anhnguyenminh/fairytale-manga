<script setup lang="ts">
import { reactive, useTemplateRef } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { message } from 'ant-design-vue'
import { ArrowLeftOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'

const route = useRoute()
const router = useRouter()
const form = reactive({ name: '' })
const imgInput = useTemplateRef<HTMLInputElement>('imgInput')

async function onSubmit() {
  const formData = new FormData()
  formData.append('name', form.name)
  formData.append('story_id', String(route.params.id))
  const files = imgInput.value?.files
  if (files) {
    for (let i = 0; i < files.length; i++) formData.append('images[]', files[i])
  }
  try {
    await adminApi.post('/admins/chapters', formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    message.success('Add new chapter completed!')
    router.push({ path: `/admin/stories/update/${route.params.id}` })
  } catch {
    message.error('Something wrong happened, please check again!')
  }
}
</script>

<template>
  <div class="mx-auto w-3/5 py-4">
    <div class="flex items-center">
      <a-button @click="router.go(-1)">
        <template #icon><ArrowLeftOutlined /></template>
      </a-button>
      <h2 class="mx-5 my-0 text-2xl">New Chapter</h2>
    </div>
    <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
      <a-form layout="vertical" @finish="onSubmit">
        <a-form-item label="Chapter" name="name" :rules="[{ required: true, message: 'Enter chapter number' }]">
          <a-input v-model:value="form.name" type="number" placeholder="Enter chapter number" />
        </a-form-item>
        <a-form-item label="Upload images">
          <input class="w-full max-w-full" ref="imgInput" type="file" multiple accept="image/*" required />
        </a-form-item>
        <div class="text-center">
          <a-button type="primary" html-type="submit">Upload new chapter</a-button>
        </div>
      </a-form>
    </div>
  </div>
</template>
