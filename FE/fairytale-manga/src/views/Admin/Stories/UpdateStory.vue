<script setup lang="ts">
import { onMounted, reactive, shallowRef, ref, useTemplateRef } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { storeToRefs } from 'pinia'
import { message, Modal } from 'ant-design-vue'
import { ArrowLeftOutlined, PlusOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'
import { useProfileStore } from '@/stores/profile'
import { PUBLISH_OPTIONS, type PublishStatus } from '@/constants/admin'
import { useCategoriesStore } from '@/stores/categories'
import { useAuthorsStore } from '@/stores/authors'
import type { Chapter } from '@/types/models'

const route = useRoute()
const router = useRouter()
const storyId = String(route.params.id)

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
  images_url: '',
  end: undefined as boolean | undefined,
  publish_status: 'draft' as PublishStatus,
  selectedCategory: [] as number[],
})
const chapters = ref<Chapter[]>([])
const imgInput = useTemplateRef<HTMLInputElement>('imgInput')
const deleting = shallowRef(false)
const profile = useProfileStore()

const chapterColumns = [
  { title: 'ID', dataIndex: 'id', key: 'id', width: '15%' },
  { title: 'Chapter', dataIndex: 'name', key: 'name' },
  { title: 'Actions', key: 'actions', align: 'right' as const },
]

async function fetchStory() {
  try {
    const { data } = await adminApi.get(`admins/stories/${storyId}`)
    form.name = data.name
    form.author_id = data.author_id
    form.description = data.description
    form.end = data.status
    form.publish_status = data.publish_status ?? 'draft'
    form.images_url = data.image_url
    form.selectedCategory = (data.category ?? []).map((item: { id: number }) => item.id)
  } catch (error) {
    console.error(error)
  }
}

async function fetchChapters() {
  try {
    const { data } = await adminApi.get<{ chapters: Chapter[] }>(`admins/stories/${storyId}/show_list_chapters`)
    chapters.value = data.chapters
  } catch (error) {
    console.error(error)
  }
}

async function onSubmit() {
  const formData = new FormData()
  formData.append('name', form.name)
  formData.append('author_id', String(form.author_id ?? null))
  formData.append('description', form.description)
  formData.append('end', String(form.end ?? null))
  formData.append('publish_status', form.publish_status)
  formData.append('categories_id', JSON.stringify(form.selectedCategory))
  const file = imgInput.value?.files?.[0]
  if (file) formData.append('image', file)
  try {
    await adminApi.put(`/admins/stories/${storyId}`, formData, {
      headers: { 'Content-Type': 'multipart/form-data' },
    })
    message.success('Update story successfully!')
    router.push('/admin/stories')
  } catch {
    message.error('Something wrong happened, please check again!')
  }
}

function deleteStory() {
  Modal.confirm({
    title: 'Are you sure you want to delete this story? (All chapters of this story will be delete completely)',
    okType: 'danger',
    async onOk() {
      try {
        await adminApi.delete(`admins/stories/${storyId}`)
        message.success('Delete successfully')
        router.push('/admin/stories/')
      } catch (error) {
        console.error(error)
      }
    },
  })
}

function deleteChapter(id: number) {
  Modal.confirm({
    title: 'Are you sure you want to delete this chapter?',
    okType: 'danger',
    async onOk() {
      deleting.value = true
      try {
        await adminApi.delete(`admins/chapters/${id}`)
        message.success('Delete chapter completed!!')
        await fetchChapters()
      } catch (error) {
        console.error(error)
      } finally {
        deleting.value = false
      }
    },
  })
}

onMounted(() => {
  fetchStory()
  fetchChapters()
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
      <h2 class="mx-5 my-0 text-2xl">Story Detail</h2>
    </div>
    <a-form layout="vertical" :model="form" @finish="onSubmit">
      <div class="flex items-start justify-center gap-5">
        <div class="min-w-[66%]">
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <a-form-item label="Title" name="name" :rules="[{ required: true, message: 'Enter story name' }]">
              <a-input v-model:value="form.name" placeholder="Enter story name..." />
            </a-form-item>
            <a-form-item label="Author">
              <a-select v-model:value="form.author_id" :options="authorOptions" />
            </a-form-item>
            <a-form-item label="Category">
              <a-checkbox-group v-model:value="form.selectedCategory" :options="categoryOptions" class="grid grid-cols-3 gap-1" />
            </a-form-item>
            <a-form-item label="Description" name="description" :rules="[{ required: true, message: 'Enter a summary' }]">
              <a-textarea v-model:value="form.description" placeholder="Enter short summary for this story" :auto-size="{ minRows: 5, maxRows: 8 }" />
            </a-form-item>
          </div>
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <div class="flex items-center justify-center gap-20">
              <a-button v-if="profile.isAdmin" danger @click="deleteStory">Delete this story</a-button>
              <a-button type="primary" html-type="submit">Save story</a-button>
            </div>
          </div>
        </div>
        <div class="min-w-[30%]">
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <a-form-item label="Status">
              <a-select v-model:value="form.end" :options="statusOptions" />
            </a-form-item>
            <a-form-item label="Xuất bản" extra="Nháp: độc giả chưa thấy truyện này." class="mb-0">
              <a-select v-model:value="form.publish_status" :options="PUBLISH_OPTIONS" />
            </a-form-item>
          </div>
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <h6 class="mb-2 font-semibold">Cover image</h6>
            <input class="w-full max-w-full" ref="imgInput" type="file" accept="image/*" />
          </div>
          <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
            <h6 class="mb-2 font-semibold">Preview</h6>
            <div class="flex justify-center">
              <img v-if="form.images_url" :src="form.images_url" class="max-w-full h-auto" alt="Cover preview" />
            </div>
          </div>
        </div>
      </div>
    </a-form>

    <div class="my-6 rounded-lg bg-[#f1f1f1] px-4 py-5">
      <div class="mb-3 flex items-center justify-between">
        <h5 class="m-0 text-lg font-semibold">Chapters</h5>
        <router-link :to="`/admin/stories/${storyId}/new-chapter`">
          <a-button type="primary"><template #icon><PlusOutlined /></template>New chapter</a-button>
        </router-link>
      </div>
      <a-table :scroll="{ x: 'max-content' }" :columns="chapterColumns" :data-source="chapters" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'actions'">
            <div class="flex justify-end gap-2">
              <router-link :to="`/admin/stories/${storyId}/chapter/${record.id}`">
                <a-button type="primary" ghost>Details</a-button>
              </router-link>
              <a-button v-if="profile.isAdmin" danger :loading="deleting" @click="deleteChapter(record.id)">Delete</a-button>
            </div>
          </template>
        </template>
      </a-table>
    </div>
  </div>
</template>
