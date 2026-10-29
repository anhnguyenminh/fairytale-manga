import { defineStore } from 'pinia'
import type { Story } from '@/types/models'
import { usePaginatedList } from './usePaginatedList'

export const useStoriesStore = defineStore('stories', () => {
  const { items: stories, ...rest } = usePaginatedList<Story>('admins/stories', 'stories')
  return { stories, ...rest }
})
