import { defineStore } from 'pinia'
import { computed, shallowRef } from 'vue'
import { GENDER_THEMES, type Gender } from '@/constants/gender'

/** Visitor preferences, kept in the browser so they apply before anyone logs in. */
export const usePreferencesStore = defineStore(
  'preferences',
  () => {
    const gender = shallowRef<Gender | null>(null)
    const theme = computed(() => (gender.value ? GENDER_THEMES[gender.value] : null))

    function setGender(value: Gender | null) {
      gender.value = value
    }

    return { gender, theme, setGender }
  },
  { persist: true },
)
