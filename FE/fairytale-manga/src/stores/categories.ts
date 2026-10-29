import { defineStore } from 'pinia'
import { ref } from 'vue'
import type { Category, SelectOption } from '@/types/models'
import { adminApi } from '@/api/client'
import { usePaginatedList } from './usePaginatedList'

export const useCategoriesStore = defineStore('categories', () => {
  const { items: categories, ...rest } = usePaginatedList<Category>('admins/categories', 'categories')
  const options = ref<SelectOption[]>([])

  async function fetchOptions() {
    try {
      const { data } = await adminApi.get<Category[]>('admins/stories/get_categories')
      options.value = data.map((c) => ({ value: c.id, label: c.name }))
    } catch (err) {
      console.error(err)
    }
  }

  return { categories, options, fetchOptions, ...rest }
})
