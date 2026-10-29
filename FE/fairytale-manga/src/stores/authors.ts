import { defineStore } from 'pinia'
import { ref } from 'vue'
import type { Author, SelectOption } from '@/types/models'
import { adminApi } from '@/api/client'
import { usePaginatedList } from './usePaginatedList'

export const useAuthorsStore = defineStore('authors', () => {
  const { items: authors, ...rest } = usePaginatedList<Author>('admins/authors', 'authors')
  const options = ref<SelectOption[]>([])

  async function fetchOptions() {
    try {
      const { data } = await adminApi.get<Author[]>('admins/stories/get_authors')
      options.value = data.map((a) => ({ value: a.id, label: a.name }))
    } catch (err) {
      console.error(err)
    }
  }

  return { authors, options, fetchOptions, ...rest }
})
