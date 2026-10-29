<script setup lang="ts">
import { useRoute, useRouter } from 'vue-router'
import { onMounted, reactive, shallowRef } from 'vue'
import { message } from 'ant-design-vue'
import { ArrowLeftOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'
import { getApiError } from '@/api/errors'
import type { Author } from '@/types/models'

const route = useRoute()
const router = useRouter()
const id = route.params.id

const form = reactive({ name: '', description: '' })
const saving = shallowRef(false)

onMounted(async () => {
  try {
    const { data } = await adminApi.get<Author>(`admins/authors/${id}`)
    form.name = data.name
    form.description = data.description ?? ''
  } catch (err) {
    console.error(err)
  }
})

async function onSubmit() {
  saving.value = true
  try {
    await adminApi.put(`admins/authors/${id}`, form)
    message.success('Update author completed!')
    router.push({ path: '/admin/authors' })
  } catch (err) {
    message.error(getApiError(err))
  } finally {
    saving.value = false
  }
}

function onReset() {
  form.name = ''
  form.description = ''
}

function goBack() {
  router.push({ path: '/admin/authors' })
}
</script>

<template>
  <div class="container mx-auto w-3/5">
    <div class="flex items-center">
      <a-button @click="goBack">
        <template #icon><ArrowLeftOutlined /></template>
      </a-button>
      <h2 class="my-0 mx-5 text-2xl">Update Author</h2>
    </div>
    <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
      <a-form layout="vertical" :model="form" @finish="onSubmit">
        <a-form-item label="Author" name="name" :rules="[{ required: true, message: 'Please enter a name' }]">
          <a-input v-model:value="form.name" placeholder="Author's name..." />
        </a-form-item>

        <a-form-item label="Description" name="description">
          <a-textarea
            v-model:value="form.description"
            placeholder="Short description about the author..."
            :auto-size="{ minRows: 3, maxRows: 6 }"
          />
        </a-form-item>

        <div class="flex justify-center gap-6">
          <a-button @click="onReset">Reset</a-button>
          <a-button type="primary" html-type="submit" :loading="saving">Save</a-button>
        </div>
      </a-form>
    </div>
    <a-card class="mt-3" title="Preview Data">
      <p class="m-0 font-bold">Author's name: {{ form.name }}</p>
      <p class="m-0 font-bold">Description: {{ form.description }}</p>
    </a-card>
  </div>
</template>
