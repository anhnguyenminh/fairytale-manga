<script setup lang="ts">
import type { ReaderStory } from '@/types/reader'
import placeholder from '@/assets/images/cover-placeholder.svg'
import { useFallbackImage } from '@/utils/dom'

defineProps<{ stories: ReaderStory[] }>()
</script>

<template>
  <ul class="ul-content-pho-bien grid list-none grid-cols-2 gap-3 p-0 m-0 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6">
    <li v-for="story in stories" :key="story.id" class="comic-hover !m-0 !w-full min-w-0">
      <div class="image-comic-tab">
        <router-link :to="{ path: `/story/${story.id}` }" class="load-preview">
          <img :src="story.image_url || placeholder" :alt="story.name" @error="useFallbackImage($event, placeholder)" />
        </router-link>
        <span class="time-comic-tab flex justify-around">
          <span>{{ (story.chapter ?? story.last_chap)?.time }}</span>
          <span class="flex items-center">
            <i class="fa fa-eye" aria-hidden="true"></i>
            <span class="story-view">{{ story.views }}</span>
          </span>
        </span>
      </div>
      <router-link :to="{ path: `/story/${story.id}` }">
        <h3 class="title-comic-tab">{{ story.name }}</h3>
      </router-link>
      <span class="chapter-comic-tab">
        <a href="https://qmanga3.net/tu-ac-nu-toi-tro-thanh-mot-nguoi-me/chapter-14_698848.html">
          Chapter {{ (story.chapter ?? story.last_chap)?.name }}
        </a>
      </span>
    </li>
  </ul>
</template>

<style scoped>
@import url(@/assets/css/home.css);
</style>
