<script setup lang="ts">
import { useRouter } from 'vue-router'
import { reactive, shallowRef } from 'vue'
import { message } from 'ant-design-vue'
import { ArrowLeftOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'
import { getApiError } from '@/api/errors'
import { TARGET_GENDER_OPTIONS } from '@/constants/gender'


const router = useRouter()

const form = reactive({ name: '', description: '', target_gender: '' })
const saving = shallowRef(false)

async function onSubmit() {
  saving.value = true
  try {
    await adminApi.post('admins/categories', form)
    message.success('Add new category completed!')
    router.push({ path: '/admin/categories' })
  } catch (err) {
    message.error(getApiError(err))
  } finally {
    saving.value = false
  }
}

function onReset() {
  form.name = ''
  form.description = ''
  form.target_gender = ''
}

function goBack() {
  router.push({ path: '/admin/categories' })
}
</script>

<template>
  <div class="container mx-auto w-3/5">
    <div class="flex items-center">
      <a-button @click="goBack">
        <template #icon><ArrowLeftOutlined /></template>
      </a-button>
      <h2 class="my-0 mx-5 text-2xl">Create New Category</h2>
    </div>
    <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
      <a-form layout="vertical" :model="form" @finish="onSubmit">
        <a-form-item label="Title" name="name" :rules="[{ required: true, message: 'Please enter a name' }]">
          <a-input v-model:value="form.name" placeholder="Category name..." />
        </a-form-item>

        <a-form-item label="Description" name="description"
          :rules="[{ required: true, message: 'Please enter a description' }]">
          <a-textarea
            v-model:value="form.description"
            placeholder="Enter description for this category"
            :auto-size="{ minRows: 3, maxRows: 6 }"
          />
        </a-form-item>

        <a-form-item label="Gợi ý cho" name="target_gender" extra="Không chọn: hiện cho cả nam và nữ.">
          <a-select v-model:value="form.target_gender" :options="TARGET_GENDER_OPTIONS" />
        </a-form-item>

        <div class="flex justify-center gap-6">
          <a-button @click="onReset">Reset</a-button>
          <a-button type="primary" html-type="submit" :loading="saving">Save</a-button>
        </div>
      </a-form>
    </div>
    <a-card class="mt-3" title="Preview Data">
      <p class="m-0 font-bold">Category: {{ form.name }}</p>
      <p class="m-0 font-bold">Description: {{ form.description }}</p>
      <p class="m-0 font-bold">Gợi ý cho: {{ form.target_gender || 'Cả hai giới' }}</p>
    </a-card>
  </div>
</template>
