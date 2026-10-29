<script setup lang="ts">
import { onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { message, Modal } from 'ant-design-vue'
import { adminApi } from '@/api/client'
import { useGiftsStore } from '@/stores/gifts'

const store = useGiftsStore()
const { gifts, currentPage, totalPages, totalCount, pageSize } = storeToRefs(store)
const { goToPage } = store

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id' },
  { title: 'Name', dataIndex: 'name', key: 'name' },
  { title: 'Image', dataIndex: 'image_url', key: 'image' },
  { title: 'Score', dataIndex: 'score', key: 'score' },
  { title: 'Stock', dataIndex: 'stock', key: 'stock' },
  { title: 'Actions', key: 'actions', align: 'right' as const, fixed: 'right' as const },
]


function confirmDeleteGift(id: number) {
  Modal.confirm({
    title: 'Are you sure you want to delete this item? (If readers have changed this item, action cannot be completed)',
    async onOk() {
      try {
        await adminApi.delete(`admins/gifts/${id}`)
        await store.fetchPage()
      } catch (error) {
        console.error(error)
        message.error('Cannot delete this gift')
      }
    },
  })
}

onMounted(() => store.fetchPage())
</script>

<template>
  <div class="p-4">
    <a-card>
      <template #title>GIFTS</template>
      <template #extra>
        <router-link :to="{ path: '/admin/gifts/add-new' }">
          <a-button type="primary">Add new gift</a-button>
        </router-link>
      </template>
      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="gifts" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'image'">
            <img :src="record.image_url" class="mx-auto max-w-[200px]" alt="" />
          </template>
          <template v-else-if="column.key === 'actions'">
            <div class="flex items-center justify-end gap-2">
              <router-link :to="{ path: `/admin/gifts/update/${record.id}` }">
                <a-button type="primary">Edit</a-button>
              </router-link>
              <a-button danger type="primary" @click="confirmDeleteGift(record.id)">Delete</a-button>
            </div>
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
