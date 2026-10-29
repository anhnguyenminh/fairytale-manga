<script setup lang="ts">
import { onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { useStoriesStore } from '@/stores/stories'

const store = useStoriesStore()
const { stories, currentPage, totalPages, totalCount, pageSize } = storeToRefs(store)
const { goToPage } = store

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id', width: '8%' },
  { title: 'Title', dataIndex: 'name', key: 'name', width: '35%' },
  { title: 'Author', dataIndex: 'author_name', key: 'author_name', width: '25%' },
  { title: 'Status', dataIndex: 'status', key: 'status', width: '15%' },
  { title: 'Actions', key: 'actions', align: 'right' as const },
]


onMounted(() => store.fetchPage())
</script>

<template>
  <div class="p-4">
    <a-card>
      <template #title>
        <span class="uppercase font-bold">Stories</span>
      </template>
      <template #extra>
        <router-link to="/admin/stories/add-new">
          <a-button type="primary">New story</a-button>
        </router-link>
      </template>
      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="stories" row-key="id" :pagination="false" bordered>
        <template #bodyCell="{ column, record }">
          <template v-if="column.key === 'status'">{{ record.status }}</template>
          <template v-else-if="column.key === 'actions'">
            <router-link :to="`/admin/stories/update/${record.id}`">
              <a-button type="primary" ghost>Details</a-button>
            </router-link>
          </template>
        </template>
      </a-table>
      <div v-if="totalPages > 1" class="flex justify-center mt-4">
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
