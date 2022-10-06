<template>
  <div class="background-home-part">
    <div class="container">

      <div style="padding-top: 20px">
        <h3>This is Slider part</h3>
        <b-carousel
            id="carousel-fade"
            style="text-shadow: 0px 0px 2px #000"
            fade
            indicators
            img-width="1024"
            img-height="480"
        >
          <b-carousel-slide
              caption="First Slide"
              img-src="https://picsum.photos/1024/480/?image=10"
          ></b-carousel-slide>
          <b-carousel-slide
              caption="Second Slide"
              img-src="https://picsum.photos/1024/480/?image=12"
          ></b-carousel-slide>
          <b-carousel-slide
              caption="Third Slide"
              img-src="https://picsum.photos/1024/480/?image=22"
          ></b-carousel-slide>
        </b-carousel>
      </div>

      <div>
        <h3>Multi upload</h3>
        <b-form-file
            v-model="file1"
            multiple
            :state="Boolean(file1)"

            placeholder="Choose a file or drop it here..."
            drop-placeholder="Drop file here..."
        ></b-form-file>
        Selected files
        <div v-for="file in file1" :key="file.name">
          <div>{{ file.name }}</div>
        </div>
      </div>

      <div>
        <div>
          <p>This is list truyen</p>
          <div>

          </div>

        </div>
        <div>Include xem them btn</div>
      </div>

      <div>
        This is BXH place
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "Home",
  data() {
    return {
      file1: []
    };
  },
  method: {
    onSlideStart(slide) {
      this.sliding = true
    },
    onSlideEnd(slide) {
      this.sliding = false
    }
  }
}

</script>

<style scoped>
* {
  color: white;
}

.background-home-part {
  background: url('http://storage.googleapis.com/cheritz/msg/images/general/bg.png') no-repeat top center fixed;
}

.container {
  background-color: #252525;
}

.banner-puzzle {
  height: 380px;
  overflow: hidden;
}

.banner-puzzle.container {
  width: 1200px;
  margin: 0 auto;
  overflow: hidden;
}

</style>