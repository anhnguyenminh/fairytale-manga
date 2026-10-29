<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { useStoriesStore } from '@/stores/stories'

const store = useStoriesStore()
const { stories, meta, currentPage } = storeToRefs(store)

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id', width: '8%' },
  { title: 'Title', dataIndex: 'name', key: 'name', width: '35%' },
  { title: 'Author', dataIndex: 'author_name', key: 'author_name', width: '25%' },
  { title: 'Status', dataIndex: 'status', key: 'status', width: '15%' },
  { title: 'Actions', key: 'actions', align: 'right' as const },
]

const pages = computed(() => Number(meta.value.pages ?? 1))
const pageSize = computed(() => Number(meta.value.perpage ?? 20))
const total = computed(() => Number(meta.value.total ?? 0))

function onPageChange(page: number) {
  store.setCurrentPage(page)
  store.fetchPage()
}

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
      <div v-if="pages > 1" class="flex justify-center mt-4">
        <a-pagination
          :current="currentPage"
          :total="total"
          :page-size="pageSize"
          :show-size-changer="false"
          @change="onPageChange"
        />
      </div>
    </a-card>
  </div>
</template>
