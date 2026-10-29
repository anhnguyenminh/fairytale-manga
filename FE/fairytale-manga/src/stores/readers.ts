import { defineStore } from 'pinia'
import type { Reader } from '@/types/models'
import { usePaginatedList } from './usePaginatedList'

export const useReadersStore = defineStore('readers', () => {
  const { items: readers, ...rest } = usePaginatedList<Reader>('admins/readers', 'readers')
  return { readers, ...rest }
})
