<script setup lang="ts">
import { computed } from 'vue'
import { usePreferencesStore } from '@/stores/preferences'
import { GENDER_THEMES, type Gender } from '@/constants/gender'

const preferences = usePreferencesStore()
const open = computed(() => preferences.gender === null)

const options: { value: Gender; icon: string; hint: string }[] = [
  { value: 'male', icon: 'fa-mars', hint: 'Giao diện tối, truyện hành động & phiêu lưu' },
  { value: 'female', icon: 'fa-venus', hint: 'Giao diện hồng trắng, truyện lãng mạn & otome' },
]
</script>

<template>
  <a-modal :open="open" :footer="null" :closable="false" :mask-closable="false" :keyboard="false" centered>
    <h2 class="mb-1 text-center text-2xl font-semibold">Chào mừng đến Fairytale Manga</h2>
    <p class="mb-5 text-center text-gray-500">Bạn là? Chúng tôi sẽ chọn giao diện và truyện hợp với bạn.</p>
    <div class="grid grid-cols-2 gap-4">
      <button
        v-for="opt in options"
        :key="opt.value"
        type="button"
        class="gender-card"
        :class="`gender-card--${opt.value}`"
        @click="preferences.setGender(opt.value)"
      >
        <i class="fas text-3xl" :class="opt.icon"></i>
        <span class="mt-2 text-lg font-semibold">{{ GENDER_THEMES[opt.value].label }}</span>
        <span class="mt-1 text-xs opacity-80">{{ opt.hint }}</span>
      </button>
    </div>
  </a-modal>
</template>

<style scoped>
.gender-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 1.5rem 1rem;
  border: 0;
  border-radius: 12px;
  cursor: pointer;
  transition: transform 0.15s;
}
.gender-card:hover {
  transform: translateY(-3px);
}
.gender-card--male {
  background: linear-gradient(160deg, #14151c, #2b2d42);
  color: #fff;
}
.gender-card--female {
  background: linear-gradient(160deg, #ffdde1, #ee9ca7);
  color: #7a2a45;
}
</style>
