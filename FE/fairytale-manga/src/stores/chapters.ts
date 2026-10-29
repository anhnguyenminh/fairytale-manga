import { defineStore } from 'pinia'
import { ref } from 'vue'
import type { Chapter } from '@/types/models'
import { adminApi } from '@/api/client'

export const useChaptersStore = defineStore('chapters', () => {
  const chapters = ref<Chapter[]>([])

  async function fetchChapters() {
    try {
      const { data } = await adminApi.get<{ chapters: Chapter[] }>('admins/chapters')
      chapters.value = data.chapters
    } catch (err) {
      console.error(err)
    }
  }

  return { chapters, fetchChapters }
})
