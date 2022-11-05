<template>
  <div class="collection">
  <div class="container collection-container">
    <div class="collection-header">
      <h1>Mystery</h1>
      <div class="collection-description">
        Made in Japan, our soda-lime glassware is lightweight, scratch-resistant, and durable enough for everyday
        use—and complements any table setting without stealing the show.
      </div>
    </div>
    <div class="form-search-cate d-flex justify-content-between">
      <div class="d-flex justify-content-center align-items-center">
        <h2>Trạng thái: </h2>
        <div>
          <b-dropdown
              split
              split-variant="outline-info"
              variant="info"
              text="Trạng thái"
              class="m-2 btn-sort">
            <b-dropdown-item>Tất cả</b-dropdown-item>
            <b-dropdown-item>Đã hoàn thành</b-dropdown-item>
            <b-dropdown-item>Chưa hoàn thành</b-dropdown-item>
          </b-dropdown>
        </div>
      </div>
      <div class="d-flex justify-content-center align-items-center">
        <h2>Sắp xếp: </h2>
        <div>
          <b-dropdown
              split
              split-variant="outline-info"
              variant="info"
              text="Sắp xếp theo"
              class="m-2 btn-sort">
            <b-dropdown-item>Mới nhất</b-dropdown-item>
            <b-dropdown-item>Cũ nhất</b-dropdown-item>
          </b-dropdown>
        </div>
      </div>
    </div>
    <div class="content-tab">
      <ul class="row ul-content-pho-bien">
        <li class="comic-hover" v-for="story in stories">
          <div class="image-comic-tab">
            <router-link :to="{path: `/story/${story.id}`}" class="load-preview">
              <img :src="story.image_url">
            </router-link>
            <span class="time-comic-tab d-flex justify-content-around ">
                  <span>{{ story.chapter.time }}</span>
                  <span class="d-flex align-items-center ">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <span class="story-view">{{ story.views }}</span>
                  </span>
                </span>
          </div>
          <router-link :to="{path: `/${story.id}`}">
            <h3 class="title-comic-tab">{{ story.name }}</h3>
          </router-link>
          <span class="chapter-comic-tab">
                <a href="https://qmanga3.net/tu-ac-nu-toi-tro-thanh-mot-nguoi-me/chapter-14_698848.html">Chapter {{
                    story.chapter.name
                  }}</a>
              </span>
        </li>
      </ul>
    </div>

  </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      stories: []
    }
  },
  mounted() {
    let self = this;
    axios.get('http://localhost:3000/api/v1/readers/stories/')
        .then(function (response) {
          // handle success
          console.log(response.data)
          self.stories = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }
}
</script>
<style scoped>
@import url(@/assets/css/collection.css);
@import url(@/assets/css/home.css);
</style>