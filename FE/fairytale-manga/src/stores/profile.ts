import { defineStore } from 'pinia'
import { ref } from 'vue'
import { adminApi, readerApi } from '@/api/client'

export const useProfileStore = defineStore('profile', () => {
  const admin = ref<Record<string, unknown>>({})
  const reader = ref<Record<string, unknown>>({})

  async function fetchAdmin() {
    try {
      admin.value = (await adminApi.get('admins/admins/show_current_admin/')).data
    } catch (err) {
      console.error(err)
    }
  }

  async function fetchReader() {
    try {
      reader.value = (await readerApi.get('readers/show_current_readers/')).data
    } catch (err) {
      console.error(err)
    }
  }

  return { admin, reader, fetchAdmin, fetchReader }
})
