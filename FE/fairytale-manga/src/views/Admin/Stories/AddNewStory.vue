<script setup lang="ts">
import { onMounted, reactive, useTemplateRef } from 'vue'
import { useRouter } from 'vue-router'
import { storeToRefs } from 'pinia'
import { message } from 'ant-design-vue'
import { ArrowLeftOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'
import { useCategoriesStore } from '@/stores/categories'
import { useAuthorsStore } from '@/stores/authors'

const router = useRouter()
const categoriesStore = useCategoriesStore()
const authorsStore = useAuthorsStore()
const { options: categoryOptions } = storeToRefs(categoriesStore)
const { options: authorOptions } = storeToRefs(authorsStore)

const statusOptions = [
  { value: false, label: 'On going' },
  { value: true, label: 'Ended' },
]

const form = reactive({
  name: '',
  author_id: undefined as number | undefined,
  description: '',
  end: undefined as boolean | undefined,
  selectedCategory: [] as number[],
})
const imgInput = useTemplateRef<HTMLInputElement>('imgInput')

async function onSubmit() {
  const formData = new FormData()
  formData.append('name', form.name)
  formData.append('author_id', String(form.author_id ?? null))
  formData.append('description', form.description)
  formData.append('end', String(form.end ?? null))
  formData.append('categories_id', JSON.stringify(form.selectedCategory))
  const file = imgInput.value?.files?.[0]
  if (file) formData.append('image', file)
  try {
    await adminApi.post('/admins/stories', formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    message.success('Add new story successfully!')
    router.push({ path: '/admin/stories' })
  } catch (error) {
    console.error(error)
    message.error('Something wrong happened, please check again!')
  }
}

onMounted(() => {
  categoriesStore.fetchOptions()
  authorsStore.fetchOptions()
})
</script>

<template>
  <div class="p-4">
    <div class="flex items-center">
      <router-link to="/admin/stories/">
        <a-button><template #icon><ArrowLeftOutlined /></template></a-button>
      </router-link>
      <h2 class="mx-5 my-0 text-2xl">Add New Story</h2>
    </div>
    <a-form layout="vertical" @finish="onSubmit">
      <div class="flex items-start justify-center gap-5">
        <div class="min-w-[66%]">
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <a-form-item label="Title" name="name" :rules="[{ required: true, message: 'Enter story name' }]">
              <a-input v-model:value="form.name" placeholder="Enter story name..." />
            </a-form-item>
            <a-form-item label="Author">
              <a-select v-model:value="form.author_id" :options="authorOptions" placeholder="Please select an option" />
            </a-form-item>
            <a-form-item label="Category">
              <a-checkbox-group v-model:value="form.selectedCategory" :options="categoryOptions" class="grid grid-cols-3 gap-1" />
            </a-form-item>
            <a-form-item label="Description" name="description" :rules="[{ required: true, message: 'Enter a summary' }]">
              <a-textarea v-model:value="form.description" placeholder="Enter short summary for this story" :auto-size="{ minRows: 3, maxRows: 6 }" />
            </a-form-item>
            <div class="flex items-center justify-center">
              <a-button type="primary" html-type="submit">Add new story</a-button>
            </div>
          </div>
        </div>
        <div class="min-w-[30%]">
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <a-form-item label="Status">
              <a-select v-model:value="form.end" :options="statusOptions" placeholder="Please select an option" />
            </a-form-item>
          </div>
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <h6 class="mb-2 font-semibold">Cover image</h6>
            <input class="w-full max-w-full" ref="imgInput" type="file" accept="image/*" required />
          </div>
        </div>
      </div>
    </a-form>
  </div>
</template>
