import { defineStore } from 'pinia'
import { shallowRef } from 'vue'

export const useAuthStore = defineStore(
  'auth',
  () => {
    const adminToken = shallowRef('')
    const readerToken = shallowRef('')

    function setAdminToken(token: string) {
      adminToken.value = token
    }
    function setReaderToken(token: string) {
      readerToken.value = token
    }
    function clearTokens() {
      adminToken.value = ''
      readerToken.value = ''
    }

    return { adminToken, readerToken, setAdminToken, setReaderToken, clearTokens }
  },
  { persist: true },
)
