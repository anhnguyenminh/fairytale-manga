import { defineStore } from 'pinia'
import { computed, ref } from 'vue'
import { adminApi, readerApi } from '@/api/client'
import { DEFAULT_ADMIN_NAME, manageableRoles } from '@/constants/admin'
import defaultAvatar from '@/assets/images/default-avatar.svg'
import type { AdminProfile } from '@/types/models'

export const useProfileStore = defineStore('profile', () => {
  const admin = ref<AdminProfile | null>(null)
  const reader = ref<Record<string, unknown>>({})

  // Falls back to the default name/avatar while a field is empty or the profile hasn't loaded.
  const adminName = computed(() => admin.value?.username?.trim() || DEFAULT_ADMIN_NAME)
  const adminAvatar = computed(() => admin.value?.image_url || defaultAvatar)
  const isOwner = computed(() => admin.value?.role === 'owner')
  // Owners and admins run the site; moderators only get the story tools.
  const isManager = computed(() => isOwner.value || admin.value?.role === 'admin')
  const manageable = computed(() => manageableRoles(admin.value?.role))

  /** Loads the signed-in admin; resolves to false when the request fails (e.g. expired token). */
  async function fetchAdmin(): Promise<boolean> {
    try {
      admin.value = (await adminApi.get<AdminProfile>('admins/admins/show_current_admin/')).data
      return true
    } catch (err) {
      console.error(err)
      return false
    }
  }

  function resetAdmin() {
    admin.value = null
  }

  async function fetchReader() {
    try {
      reader.value = (await readerApi.get('readers/show_current_readers/')).data
    } catch (err) {
      console.error(err)
    }
  }

  return { admin, reader, adminName, adminAvatar, isOwner, isManager, manageable, fetchAdmin, resetAdmin, fetchReader }
})
