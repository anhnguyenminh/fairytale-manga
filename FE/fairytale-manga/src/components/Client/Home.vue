<script setup lang="ts">
import { onMounted, shallowRef, watch } from 'vue'
import { readerApi } from '@/api/client'
import StoryGrid from '@/components/Client/StoryGrid.vue'
import HomeRanking from '@/components/Client/HomeRanking.vue'
import type { ReaderStory } from '@/types/reader'
import { usePreferencesStore } from '@/stores/preferences'

const preferences = usePreferencesStore()

const banners = [
  'https://adsmg.fanfox.net/4/2018/12/28/63903f3765294921.jpg',
  'https://adsmg.fanfox.net/4/2019/4/16/9406be4ce25d4879.jpg',
  'https://adsmg.fanfox.net/3/2018/11/22/ff6f97db68c5485e.jpg',
  'https://adsmg.fanfox.net/3/2018/11/26/6fca8776b1f847c6.jpg',
  'https://adsmg.fanfox.net/4/2019/4/16/0f42fca631e04acd.jpg',
]

const stories = shallowRef<ReaderStory[]>([])
const forYouStories = shallowRef<ReaderStory[]>([])
// Fetched like the original, but the ranking block still renders static placeholders.
const topDayStories = shallowRef<ReaderStory[]>([])
const topWeekStories = shallowRef<ReaderStory[]>([])
const topMonthStories = shallowRef<ReaderStory[]>([])

async function fetchStories(path: string): Promise<ReaderStory[]> {
  try {
    return (await readerApi.get<ReaderStory[]>(path)).data
  } catch (err) {
    console.error(err)
    return []
  }
}

// Suggestions follow the visitor's chosen gender; untargeted categories show for both.
watch(
  () => preferences.gender,
  async (gender) => {
    if (gender) forYouStories.value = await fetchStories(`readers/recommends/for_gender?gender=${gender}`)
  },
  { immediate: true },
)

onMounted(async () => {
  ;[stories.value, topDayStories.value, topWeekStories.value, topMonthStories.value] = await Promise.all([
    fetchStories('readers/stories/'),
    fetchStories('readers/hotstories/hot_day'),
    fetchStories('readers/hotstories/hot_week'),
    fetchStories('readers/hotstories/hot_month'),
  ])
})
</script>

<template>
  <div class="background-home-part">
    <div class="container mx-auto">
      <div style="padding-top: 20px">
        <a-carousel autoplay effect="fade" style="text-shadow: 0 0 2px #000">
          <div v-for="src in banners" :key="src">
            <img :src="src" class="banner-img" alt="banner" />
          </div>
        </a-carousel>
      </div>

      <div v-if="forYouStories.length" class="container mx-auto box-pho-bien">
        <div class="row-header-title">
          <h1 class="h1-title uppercase">
            <i class="fas fa-heart" style="color: hotpink"></i> Dành cho bạn
          </h1>
        </div>
        <div class="content-tab">
          <StoryGrid :stories="forYouStories" />
        </div>
      </div>

      <div class="container mx-auto box-pho-bien">
        <div class="row-header-title">
          <h1 class="h1-title uppercase">
            <i class="fas fa-fire" style="color: gold"></i> Nổi bật
          </h1>
        </div>

        <div class="content-tab">
          <StoryGrid :stories="stories" />
          <router-link :to="{ path: '/categories/trending-stories' }" class="more-btn flex items-center">
            <button>Xem thêm <i class="far fa-long-arrow-right"></i></button>
          </router-link>
        </div>
      </div>

      <div class="container mx-auto center-container">
        <HomeRanking />
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/css/home.css);

* {
  color: white;
}

.background-home-part {
  background: url('@/assets/images/bg.png') no-repeat top center fixed;
}

.container {
  background-color: #252525;
}

.banner-img {
  width: 100%;
  height: 480px;
  object-fit: cover;
}
</style>
