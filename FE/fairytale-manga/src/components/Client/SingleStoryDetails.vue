<template>
  <div class="single-story-details">
    <div class="container">
      <div class="row wrapped-story-detail">
        <!--      left-->
        <div class="col-md-3 col-sm-3">
          <div class="image-comic-detail">
            <a href="https://qmanga3.net/chuyen-tinh-phap-su.html" title="Chuyện Tình Pháp Sư">
              <img :src="detailsStories.image_url"/>
            </a>
          </div>
        </div>
        <!--      right-->
        <div class="col-md-9 col-sm-9">
          <h1 class="title-comic-detail">{{ detailsStories.name }}</h1>
          <span class="desc-comic-detail">
          <p>{{ detailsStories.description }}</p>
<hr style="border: 1px dashed #f1f1f1">
        </span>
          <div class="manga-info">
            <ul class="list-info">
              <li class="othername row">
                <p class="name col-sm-3">
                  <i class="fa fa-plus"></i>
                  <span>Tên khác</span>
                </p>
                <p class="other-name col-sm-9">{{ detailsStories.name }}</p>
              </li>
              <li class="author row">
                <p class="name col-sm-3">
                  <i class="fa fa-user"></i>
                  <span>Tác giả</span>
                </p>
                <p class="col-sm-9">{{ detailsStories.author_name }}</p>
              </li>
              <li class="status row">
                <p class="name col-sm-3">
                  <i class="fa fa-rss"></i>
                  <span>Tình trạng</span>
                </p>
                <p class="col-sm-9">{{ detailsStories.status }}</p>
              </li>
              <li class="kind row">
                <p class="name col-sm-3">
                  <i class="fa fa-tags"></i>
                  <span>Thể loại</span>
                </p>
                <p class="col-sm-9">
                  <router-link tag="a" v-for="collection in detailsStories.category"
                               :to="{path: '/categories/'+ $route.params.collection}" class="collection">
                    {{ collection.name }}
                  </router-link>
                </p>
              </li>
              <li class="row">
                <p class="name col-sm-3">
                  <i class="fa fa-eye"></i>
                  <span>Lượt xem</span>
                </p>
                <p class="col-sm-9">{{ detailsStories.views }}</p>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!--   list chapter   -->
      <div class="list-chapter-detail-comic">
        <div class="move-to-chap">
          <div class="a-btn-move d-flex">
            <router-link :to="{path: `/story/`+ $route.params.details +`/chapter/${detailsStories.first_chap.id}`}" tag="a"
               class="btn-move-to-chap">
              <span>Chương đầu</span>
              <span>Chapter {{ detailsStories.first_chap.name }}</span>
            </router-link>
            <router-link :to="{path: `/story/`+ $route.params.details +`/chapter/${detailsStories.last_chap.id}`}" tag="a"
               class="btn-move-to-chap">
              <span>Chương mới nhất</span>
              <span>Chapter {{ detailsStories.last_chap.name }}</span>
            </router-link>
          </div>

        </div>
        <h2 class="text-uppercase">Danh sách chương</h2>
        <div class="ul-wrapper">
          <ul class="ul-list-chapter-detail-comic">
            <!--          first-->
            <li v-for="chapter in detailsStories.chapter">
              <router-link :to="{path: `/story/`+ $route.params.details +`/chapter/${chapter.id}`}" tag="a"><h3>Chapter
                {{ chapter.name }}</h3></router-link>
              <span>{{ chapter.time }}</span>
            </li>
            <!--          second-->
          </ul>
        </div>
      </div>
    </div>
    <!--   comment part-->
    <Comment></Comment>
  </div>
</template>
<script>
import axios from "axios";
import Comment from "@/components/Client/Comment"
export default {
  name: 'SingleStoryDetails',
  data() {
    return {
      detailsStories: []
    }
  },
  components:{
    Comment
  },
  methods: {},
  created() {
    let self = this;
    axios.get('http://localhost:3000/api/v1/readers/stories/' + this.$route.params.details)
        .then(function (response) {
          // handle success
          console.log(response)
          self.detailsStories = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }
}

</script>

<style scoped>
@import url(@/assets/css/story-details.css);

.container {
  padding: 0;
  background-color: #252525;
}
</style>