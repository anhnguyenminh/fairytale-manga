<script setup lang="ts">
import { onMounted, shallowRef } from 'vue'
import { readerApi } from '@/api/client'
import StoryGrid from '@/components/Client/StoryGrid.vue'
import type { ReaderStory } from '@/types/reader'

const stories = shallowRef<ReaderStory[]>([])

const statusItems = [
  { key: 'all', label: 'Tất cả' },
  { key: 'done', label: 'Đã hoàn thành' },
  { key: 'ongoing', label: 'Chưa hoàn thành' },
]
const sortItems = [
  { key: 'newest', label: 'Mới nhất' },
  { key: 'oldest', label: 'Cũ nhất' },
]

onMounted(async () => {
  try {
    stories.value = (await readerApi.get<ReaderStory[]>('readers/stories/')).data
  } catch (err) {
    console.error(err)
  }
})
</script>

<template>
  <div class="collection">
    <div class="container mx-auto collection-container">
      <div class="collection-header">
        <h1>Mystery</h1>
        <div class="collection-description">
          Made in Japan, our soda-lime glassware is lightweight, scratch-resistant, and durable enough for everyday
          use—and complements any table setting without stealing the show.
        </div>
      </div>
      <div class="form-search-cate flex justify-between">
        <div class="flex justify-center items-center gap-2">
          <h2>Trạng thái: </h2>
          <a-dropdown>
            <a-button class="btn-sort">Trạng thái</a-button>
            <template #overlay>
              <a-menu>
                <a-menu-item v-for="item in statusItems" :key="item.key">{{ item.label }}</a-menu-item>
              </a-menu>
            </template>
          </a-dropdown>
        </div>
        <div class="flex justify-center items-center gap-2">
          <h2>Sắp xếp: </h2>
          <a-dropdown>
            <a-button class="btn-sort">Sắp xếp theo</a-button>
            <template #overlay>
              <a-menu>
                <a-menu-item v-for="item in sortItems" :key="item.key">{{ item.label }}</a-menu-item>
              </a-menu>
            </template>
          </a-dropdown>
        </div>
      </div>
      <div class="content-tab">
        <StoryGrid :stories="stories" />
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/css/collection.css);
@import url(@/assets/css/home.css);
</style>
