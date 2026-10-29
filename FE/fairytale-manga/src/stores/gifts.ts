import { defineStore } from 'pinia'
import type { Gift } from '@/types/models'
import { usePaginatedList } from './usePaginatedList'

export const useGiftsStore = defineStore('gifts', () => {
  const { items: gifts, ...rest } = usePaginatedList<Gift>('admins/gifts', 'gifts')
  return { gifts, ...rest }
})
