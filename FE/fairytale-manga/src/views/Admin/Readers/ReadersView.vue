<script setup lang="ts">
import { onMounted } from 'vue'
import { storeToRefs } from 'pinia'
import { useReadersStore } from '@/stores/readers'

const store = useReadersStore()
const { readers, currentPage, totalPages, totalCount, pageSize } = storeToRefs(store)
const { goToPage } = store

const columns = [
  { title: 'ID', dataIndex: 'id', key: 'id' },
  { title: 'Email', dataIndex: 'email', key: 'email' },
  { title: 'Username', dataIndex: 'name', key: 'name' },
  { title: 'Age', dataIndex: 'age', key: 'age' },
  { title: 'Gender', dataIndex: 'show_gender', key: 'show_gender' },
  { title: 'Phonenumber', dataIndex: 'phonenumber', key: 'phonenumber' },
  { title: 'Address', dataIndex: 'address', key: 'address' },
  { title: 'Score', dataIndex: 'score', key: 'score' },
  { title: 'Banned', dataIndex: 'ban', key: 'ban', customRender: ({ text }: { text: unknown }) => String(text ?? '') },
]


onMounted(() => store.fetchPage())
</script>

<template>
  <div class="p-4">
    <a-card title="READERS">
      <a-table :scroll="{ x: 'max-content' }" :columns="columns" :data-source="readers" row-key="id" :pagination="false" bordered />
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
