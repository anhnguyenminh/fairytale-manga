<script setup lang="ts">
import { onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { Modal, message } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import { useCategoriesStore } from '@/stores/categories'
import { TARGET_GENDER_OPTIONS } from '@/constants/gender'

const store = useCategoriesStore()
const { categories, currentPage, totalPages, totalCount, pageSize } = storeToRefs(store)
const { goToPage } = store

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id', width: '8%' },
  { title: 'Title', dataIndex: 'name', key: 'name', width: '30%' },
  { title: 'Description', dataIndex: 'description', key: 'description' },
  { title: 'Gợi ý cho', key: 'target_gender', width: 140 },
  { title: 'Actions', key: 'actions', align: 'right' as const, fixed: 'right' as const, width: 200 },
]


function confirmDeleteCategory(id: number) {
  Modal.confirm({
    title: 'Are you sure you want to delete this category?',
    async onOk() {
      try {
        await adminApi.delete(`admins/categories/${id}`)
        await store.fetchPage()
      } catch (err) {
        console.error(err)
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
        <span class="font-bold uppercase text-[#4e73df]">Categories</span>
      </template>
      <template #extra>
        <router-link :to="{ path: '/admin/categories/add-new' }">
          <a-button type="primary">Create category</a-button>
        </router-link>
      </template>

      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="categories" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'target_gender'">
            {{ TARGET_GENDER_OPTIONS.find((o) => o.value === (record.target_gender ?? ''))?.label }}
          </template>
          <template v-else-if="column.key === 'actions'">
            <router-link :to="{ path: `/admin/categories/update/${record.id}` }">
              <a-button type="primary" class="mx-1">Edit</a-button>
            </router-link>
            <a-button danger class="mx-1" @click="confirmDeleteCategory(record.id)">Delete</a-button>
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
