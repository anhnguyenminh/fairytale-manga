import { defineStore } from 'pinia'
import { shallowRef } from 'vue'

const ADMIN_KEY = 'auth-admin'
const READER_KEY = 'auth-reader'

/**
 * Admin token storage for "Remember me": the token lives in localStorage when remembered
 * (survives closing the browser) or in sessionStorage otherwise (gone with the tab).
 * Reads check both, so a reload finds the token wherever it was saved.
 */
let rememberAdmin = true

const adminStorage = {
  getItem(key: string) {
    const local = localStorage.getItem(key)
    if (local !== null) return local
    rememberAdmin = false
    return sessionStorage.getItem(key)
  },
  setItem(key: string, value: string) {
    const [target, other] = rememberAdmin ? [localStorage, sessionStorage] : [sessionStorage, localStorage]
    target.setItem(key, value)
    other.removeItem(key)
  },
}

export const useAuthStore = defineStore(
  'auth',
  () => {
    const adminToken = shallowRef('')
    const readerToken = shallowRef('')

    function setAdminToken(token: string, remember = true) {
      rememberAdmin = remember
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
  {
    persist: [
      { key: ADMIN_KEY, pick: ['adminToken'], storage: adminStorage },
      { key: READER_KEY, pick: ['readerToken'] },
    ],
  },
)
