<template>
  <div class="container" style="width: 60%;">
    <!--    button go back page -->
    <div class="d-flex align-items-center ">
      <b-button style="background-color: #f1f1f1" @click="$router.go(-1)">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </b-button>
      <h2 style="margin: 0 1.2rem ;">Chapter </h2>
    </div>
    <!--  main chapter  -->
    <div style="margin: 1.5rem 0 ;">
      <div v-for="image in images_url" :key="image.index">
        <b-img :src="image" fluid></b-img>

      </div>
    </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: 'DetailSingleChapter',
  data() {
    return {
      images_url: []
    }
  },
  methods: {},
  created() {
    let self = this;
    // console.log(this.$route.params.param)
    axios.get('admins/chapters/' + this.$route.params.param)
        .then(function (response) {
          // handle success
          // console.log(response.data.category)
          console.log("AAAAAAAAAAAAAA")
          console.log(response.data.images_url)
          self.images_url = response.data.images_url
          //     .map(item => {
          //   return item.image_url
          // })
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }
}
</script>

<style scoped>
</style>