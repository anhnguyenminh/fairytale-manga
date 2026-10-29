<script setup lang="ts">
import placeholder from '@/assets/images/cover-placeholder.svg'
import { onMounted, shallowRef } from 'vue'
import { useRoute } from 'vue-router'
import { readerApi } from '@/api/client'
import Comment from '@/components/Client/Comment.vue'
import type { StoryDetails } from '@/types/reader'

const route = useRoute()
const detailsStories = shallowRef<StoryDetails>({})

onMounted(async () => {
  try {
    detailsStories.value = (await readerApi.get<StoryDetails>(`readers/stories/${route.params.details}`)).data
  } catch (err) {
    console.error(err)
  }
})
</script>

<template>
  <div class="single-story-details">
    <div class="container mx-auto">
      <div class="wrapped-story-detail grid grid-cols-1 sm:grid-cols-4 gap-4">
        <div class="sm:col-span-1">
          <div class="image-comic-detail">
            <a href="https://qmanga3.net/chuyen-tinh-phap-su.html" :title="detailsStories.name">
              <img :src="detailsStories.image_url || placeholder" :alt="detailsStories.name" />
            </a>
          </div>
        </div>
        <div class="sm:col-span-3">
          <h1 class="title-comic-detail">{{ detailsStories.name }}</h1>
          <span class="desc-comic-detail">
            <p>{{ detailsStories.description }}</p>
            <hr style="border: 1px dashed #f1f1f1" />
          </span>
          <div class="manga-info">
            <ul class="list-info">
              <li class="othername info-row">
                <p class="name"><i class="fa fa-plus"></i> <span>Tên khác</span></p>
                <p class="other-name">{{ detailsStories.name }}</p>
              </li>
              <li class="author info-row">
                <p class="name"><i class="fa fa-user"></i> <span>Tác giả</span></p>
                <p>{{ detailsStories.author_name }}</p>
              </li>
              <li class="status info-row">
                <p class="name"><i class="fa fa-rss"></i> <span>Tình trạng</span></p>
                <p>{{ detailsStories.status }}</p>
              </li>
              <li class="kind info-row">
                <p class="name"><i class="fa fa-tags"></i> <span>Thể loại</span></p>
                <p>
                  <router-link
                    v-for="(collection, i) in detailsStories.category"
                    :key="i"
                    :to="{ path: '/categories/' + route.params.collection }"
                    class="collection"
                  >
                    {{ collection.name }}
                  </router-link>
                </p>
              </li>
              <li class="info-row">
                <p class="name"><i class="fa fa-eye"></i> <span>Lượt xem</span></p>
                <p>{{ detailsStories.views }}</p>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="list-chapter-detail-comic">
        <div class="move-to-chap">
          <div class="a-btn-move flex">
            <router-link
              v-if="detailsStories.first_chap"
              :to="{ path: `/story/${route.params.details}/chapter/${detailsStories.first_chap.id}` }"
              class="btn-move-to-chap"
            >
              <span>Chương đầu</span>
              <span>Chapter {{ detailsStories.first_chap.name }}</span>
            </router-link>
            <router-link
              v-if="detailsStories.last_chap"
              :to="{ path: `/story/${route.params.details}/chapter/${detailsStories.last_chap.id}` }"
              class="btn-move-to-chap"
            >
              <span>Chương mới nhất</span>
              <span>Chapter {{ detailsStories.last_chap.name }}</span>
            </router-link>
          </div>
        </div>
        <h2 class="uppercase">Danh sách chương</h2>
        <div class="ul-wrapper">
          <ul class="ul-list-chapter-detail-comic">
            <li v-for="chapter in detailsStories.chapter" :key="chapter.id">
              <router-link :to="{ path: `/story/${route.params.details}/chapter/${chapter.id}` }">
                <h3>Chapter {{ chapter.name }}</h3>
              </router-link>
              <span>{{ chapter.time }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <Comment />
  </div>
</template>

<style scoped>
@import url(@/assets/css/story-details.css);

.container {
  padding: 0;
  background-color: #252525;
}

.info-row {
  display: grid;
  grid-template-columns: 25% 75%;
}
</style>
