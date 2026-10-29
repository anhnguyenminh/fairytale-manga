<script setup lang="ts">
import { onMounted, shallowRef } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { readerApi } from '@/api/client'
import Comment from '@/components/Client/Comment.vue'
import type { ReaderChapter } from '@/types/reader'

const route = useRoute()
const router = useRouter()

const chapter = shallowRef<ReaderChapter>({})
const selected = shallowRef<string | undefined>(undefined)
// Placeholder list kept from the original (chapter list is not wired to the API yet).
const options = [{ value: 'list', label: 'Danh sách chương' }]

function scrollToTop() {
  window.scrollTo(0, 0)
}

onMounted(async () => {
  try {
    const chap = String(route.params.chap)
    chapter.value = (await readerApi.get<ReaderChapter>(`readers/stories/${chap}/show_chapter`)).data
  } catch (err) {
    console.error(err)
  }
})
</script>

<template>
  <div class="container-fluid manga-read">
    <h1 class="container mx-auto title-manga-read">Chapter {{ chapter.name }}</h1>
    <div class="container mx-auto control-manga-read flex flex-wrap justify-around gap-2">
      <a-button class="btn-pre" @click="router.go(-1)">
        <i class="far fa-arrow-circle-left"></i> Chương trước
      </a-button>
      <div class="center-control-manga-read flex flex-wrap justify-center gap-2">
        <a-button class="btn-read">Quay lại</a-button>
        <a-select v-model:value="selected" :options="options" placeholder="Danh sách chương" style="min-width: 160px" />
      </div>
      <a-button class="btn-nex">Chương sau <i class="far fa-arrow-circle-right"></i></a-button>
    </div>
    <div class="area-show-content" style="margin: 1.5rem 0">
      <div v-for="(image, i) in chapter.images_url" :key="i" class="image-chapter">
        <img :src="image" class="max-w-full h-auto" />
      </div>
    </div>
    <div class="container mx-auto control-manga-read flex flex-wrap justify-around gap-2">
      <a-button class="btn-pre" @click="router.go(-1)">
        <i class="far fa-arrow-circle-left"></i> Chương trước
      </a-button>
      <div class="center-control-manga-read flex flex-wrap justify-center gap-2">
        <a-button class="btn-read">Quay lại</a-button>
        <a-select v-model:value="selected" :options="options" placeholder="Danh sách chương" style="min-width: 160px" />
      </div>
      <a-button class="btn-nex">Chương sau <i class="far fa-arrow-circle-right"></i></a-button>
    </div>
    <div class="wrapped-comment container-fluid mt-3">
      <Comment class="comment-chapter" />
    </div>
    <div class="arrow-to-top" @click="scrollToTop">
      <button><i class="fas fa-long-arrow-up"></i></button>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/css/chapter.css);
</style>
