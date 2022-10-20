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
      <div>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
        <b-img src="https://picsum.photos/1024/400/?image=41" fluid alt="Responsive image"></b-img>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: 'AddNewChapter',
  data() {
    return {

    }
  },
  methods: {}
}
</script>

<style scoped>
</style>