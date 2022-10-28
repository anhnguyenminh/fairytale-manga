<template>
  <div class="container-fluid manga-read">
    <h1 class="container title-manga-read">Chapter {{ chapter.name }}</h1>
    <div class="container control-manga-read d-flex  justify-content-around">
      <b-button @click="$router.go(-1)" class="btn-pre"><i class="far fa-arrow-circle-left"></i> Chương trước</b-button>
      <div class="center-control-manga-read d-flex">
        <b-button class="btn-read ">Quay lại</b-button>
        <b-form-select v-model="selected" :options="options"></b-form-select>
      </div>
      <b-button class="btn-nex">Chương sau <i class="far fa-arrow-circle-right"></i></b-button>
    </div>
    <!--  main chapter  -->
    <div style="margin: 1.5rem 0; " class="area-show-content">
      <div v-for="image in chapter.images_url" :key="image.index" class="image-chapter">
        <b-img :src="image" fluid></b-img>
      </div>
    </div>
    <!--    end main chapter-->
    <div class="container control-manga-read d-flex  justify-content-around">
      <b-button @click="$router.go(-1)" class="btn-pre"><i class="far fa-arrow-circle-left"></i> Chương trước</b-button>
      <div class="center-control-manga-read d-flex">
        <b-button class="btn-read ">Quay lại</b-button>
        <b-form-select v-model="selected" :options="options"></b-form-select>
      </div>
      <b-button class="btn-nex">Chương sau <i class="far fa-arrow-circle-right"></i></b-button>
    </div>
    <div class="wrapped-comment container-fluid mt-3">
      <Comment class="comment-chapter"></Comment>
    </div>
    <!-- btn scroll to top-->
    <div class="arrow-to-top" @click="scrollToTop">
      <button><i class="fas fa-long-arrow-up"></i></button>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Comment from "@/components/Client/Comment"

export default {
  name: 'Chapter',
  components: {
    Comment
  },
  data() {
    return {
      chapter: [],
      selected: null,
      options: [
        {value: null, text: 'Danh sách chương'},
        {value: 'a', text: 'This is First option'},
        {value: 'b', text: 'Selected Option'},
        {value: {C: '3PO'}, text: 'This is an option with object value'},
        {value: 'd', text: 'This one is disabled', disabled: true}
      ]
    }
  },
  methods: {
    scrollToTop() {
      window.scrollTo(0, 0);
    }
  },
  created() {
    let self = this;
    axios.get('http://localhost:3000/api/v1/readers/stories/' + this.$route.params.chap + '/show_chapter')
        .then(function (response) {
          // handle success
          self.chapter = response.data
          console.log(response.data)
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }
}
</script>

<style scoped>
@import url(@/assets/css/chapter.css);
</style>