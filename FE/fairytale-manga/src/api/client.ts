import axios, { type AxiosInstance } from 'axios'
import { useAuthStore } from '@/stores/auth'

const baseURL = import.meta.env.VITE_API_URL ?? 'http://localhost:3000/api/v1/'

function createClient(tokenOf: () => string): AxiosInstance {
  const client = axios.create({ baseURL, timeout: 3000 })
  client.interceptors.request.use((config) => {
    config.headers.set('Authorization', `Bearer ${tokenOf()}`)
    return config
  })
  return client
}

/** Client for the admin area (uses the admin token). */
export const adminApi = createClient(() => useAuthStore().adminToken)

/** Client for readers (uses the reader token). */
export const readerApi = createClient(() => useAuthStore().readerToken)
