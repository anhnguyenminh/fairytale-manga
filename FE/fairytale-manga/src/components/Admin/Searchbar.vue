<script setup lang="ts">
import { MenuOutlined } from '@ant-design/icons-vue'

defineEmits<{ 'toggle-menu': [] }>()
</script>

<template>
  <nav class="mb-4 flex items-center justify-between gap-3 bg-neutral-800 p-2 shadow lg:justify-end">
    <a-button class="lg:!hidden" @click="$emit('toggle-menu')">
      <template #icon><MenuOutlined /></template>
    </a-button>
    <a-input-search class="!w-full sm:!w-[40%] lg:!w-[30%]" placeholder="Search..." />
  </nav>
</template>
