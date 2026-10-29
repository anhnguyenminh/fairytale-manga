<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ArrowLeftOutlined, ArrowUpOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'

const route = useRoute()
const router = useRouter()
const imagesUrl = ref<string[]>([])

function scrollToTop() {
  window.scrollTo(0, 0)
}

onMounted(async () => {
  try {
    const { data } = await adminApi.get<{ images_url: string[] }>(`admins/chapters/${route.params.param}`)
    imagesUrl.value = data.images_url ?? []
  } catch (error) {
    console.error(error)
  }
})
</script>

<template>
  <div class="relative mx-auto w-3/5 py-4">
    <div class="flex items-center">
      <a-button @click="router.go(-1)">
        <template #icon><ArrowLeftOutlined /></template>
      </a-button>
      <h2 class="mx-5 my-0 text-2xl">Chapter</h2>
    </div>
    <div class="my-6">
      <div v-for="(image, index) in imagesUrl" :key="index">
        <img :src="image" class="max-w-full h-auto" alt="" />
      </div>
    </div>
    <div class="sticky bottom-40 z-20 text-right">
      <a-button shape="circle" size="large" @click="scrollToTop">
        <template #icon><ArrowUpOutlined /></template>
      </a-button>
    </div>
  </div>
</template>
