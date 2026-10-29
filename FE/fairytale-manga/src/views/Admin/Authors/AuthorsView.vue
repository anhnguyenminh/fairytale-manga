<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { Modal, message } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import { useAuthorsStore } from '@/stores/authors'

const store = useAuthorsStore()
const { authors, meta, currentPage } = storeToRefs(store)

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id', width: '8%' },
  { title: 'Author', dataIndex: 'name', key: 'name', width: '30%' },
  { title: 'Description', dataIndex: 'description', key: 'description' },
  { title: 'Actions', key: 'actions', align: 'right' as const, width: 200 },
]

const totalPages = computed(() => Number(meta.value.pages ?? 0))
const totalCount = computed(() => Number(meta.value.total ?? 0))
const pageSize = computed(() => Number(meta.value.perpage ?? 20))

function goToPage(page: number) {
  store.setCurrentPage(page)
  store.fetchPage()
}

function deleteData(id: number) {
  Modal.confirm({
    title: 'Are you sure you want to delete this author?',
    async onOk() {
      try {
        await adminApi.delete(`admins/authors/${id}`)
        await store.fetchPage()
      } catch (err) {
        message.error('Delete author failed because author has many story')
      }
    },
  })
}

onMounted(() => store.fetchPage())
</script>

<template>
  <div class="p-4">
    <a-card>
      <template #title>
        <span class="font-bold uppercase text-[#4e73df]">Authors</span>
      </template>
      <template #extra>
        <router-link :to="{ path: '/admin/authors/add-new' }">
          <a-button type="primary">Create author</a-button>
        </router-link>
      </template>

      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="authors" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'actions'">
            <router-link :to="{ path: `/admin/authors/update/${record.id}` }">
              <a-button type="primary" class="mx-1">Edit</a-button>
            </router-link>
            <a-button danger class="mx-1" @click="deleteData(record.id)">Delete</a-button>
          </template>
        </template>
      </a-table>

      <div v-if="totalPages > 1" class="mt-4 flex justify-center">
        <a-pagination
          :current="currentPage"
          :total="totalCount"
          :page-size="pageSize"
          :show-size-changer="false"
          @change="goToPage"
        />
      </div>
    </a-card>
  </div>
</template>
