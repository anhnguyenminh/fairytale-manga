<template>
  <div class="background-home-part">
    <div class="container">

      <div style="padding-top: 20px">
        <b-carousel
            id="carousel-fade"
            style="text-shadow: 0px 0px 2px #000"
            fade
            indicators
            img-width="1024"
            img-height="480"
        >
          <b-carousel-slide
              img-src="https://adsmg.fanfox.net/4/2018/12/28/63903f3765294921.jpg"
          ></b-carousel-slide>
          <b-carousel-slide

              img-src="https://adsmg.fanfox.net/4/2019/4/16/9406be4ce25d4879.jpg"
          ></b-carousel-slide>
          <b-carousel-slide

              img-src="https://adsmg.fanfox.net/3/2018/11/22/ff6f97db68c5485e.jpg"
          ></b-carousel-slide>
          <b-carousel-slide

              img-src="https://adsmg.fanfox.net/3/2018/11/26/6fca8776b1f847c6.jpg"
          ></b-carousel-slide>
          <b-carousel-slide

              img-src="https://adsmg.fanfox.net/4/2019/4/16/0f42fca631e04acd.jpg"
          ></b-carousel-slide>
        </b-carousel>
      </div>

      <div class="container box-pho-bien">
        <div class="row-header-title">
          <h1 class="h1-title text-uppercase">
            <i class="fas fa-fire" style="color: gold"></i> Nổi bật
          </h1>
        </div>

        <div class="content-tab">
          <ul id="ul-content-pho-bien" class="row">
            <li class="comic-hover" v-for="story in stories">
              <div class="image-comic-tab">
                <router-link :to="{path: `/story/${story.id}`}" class="load-preview">
                  <img :src="story.image_url">
                </router-link>
                <span class="time-comic-tab d-flex justify-content-around ">
                  <span>{{story.chapter.time}}</span>
                  <span class="d-flex align-items-center ">
                    <i class="fa fa-eye" aria-hidden="true"></i>
                    <span class="story-view">{{story.views}}</span>
                  </span>
                </span>
              </div>
              <router-link :to="{path: `/${story.id}`}">
                <h3 class="title-comic-tab">{{ story.name }}</h3>
              </router-link>
              <span class="chapter-comic-tab">
                <a href="https://qmanga3.net/tu-ac-nu-toi-tro-thanh-mot-nguoi-me/chapter-14_698848.html">Chapter {{ story.chapter.name }}</a>
              </span>
            </li>
          </ul>
          <router-link tag="div" :to="{path: '/categories/trending-stories'}" class="more-btn d-flex align-items-center">
            <button>Xem thêm <i class="far fa-long-arrow-right"></i></button>
          </router-link>
        </div>
      </div>
      <!-- top-bxh-->
      <div class="container center-container">
        <div class="top-bxh">
          <h1 class="h1-title h1-title-bxh text-uppercase"><i class="fas fa-star-shooting" style="color: gold"></i> Bảng
            xếp hạng
          </h1>
          <div class="row">
            <div class="col-top-bxh col-md-4 col-sm-12">
              <div class="top-bxh-row-header">
                <div class="top-bxh-row-header-title">
                  <h3 class="text-uppercase">Top ngày</h3>
                </div>
                <!--                top 1-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    1
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--top 2-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    2
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 3-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    3
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 4-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx">
                    4
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 5-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    5
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-top-bxh col-md-4 col-sm-12">
              <div class="top-bxh-row-header">
                <div class="top-bxh-row-header-title">
                  <h3 class="text-uppercase">Top tuần</h3>
                </div>
                <!--                top 1-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    1
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--top 2-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    2
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 3-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    3
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 4-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx">
                    4
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 5-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    5
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-top-bxh col-md-4 col-sm-12">
              <div class="top-bxh-row-header">
                <div class="top-bxh-row-header-title">
                  <h3 class="text-uppercase">Top tháng</h3>
                </div>
                <!--                top 1-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    1
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--top 2-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    2
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 3-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    3
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 4-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx">
                    4
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
                <!--                top 5-->
                <div class="row-top-bxh">
                  <div class="number-top-bhx ">
                    5
                  </div>
                  <div class="comic-image-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <img src="https://st.nettruyenme.com/data/comics/139/tu-ac-nu-toi-tro-thanh-mot-nguoi-me.jpg"
                           alt="">
                    </a>
                  </div>
                  <div class="desc-top-bxh">
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <h5>Đối tác Bán thời gian</h5>
                    </a>
                    <a href="https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html">
                      <p>Chapter 15 &lt;Ngang Raw&gt;</p>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "Home",
  data() {
    return {
      stories: [],
      topDayStories: [],
      topWeekStories: [],
      topMonthStories: []
    }
  },
  methods: {
    onSlideStart(slide) {
      this.sliding = true
    },
    onSlideEnd(slide) {
      this.sliding = false
    }
  }, mounted() {
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
//top ngay
    axios.get('http://localhost:3000/api/v1/readers/hotstories/hot_day')
        .then(function (response) {
          // handle success
          console.log("DAY")
          console.log(response.data)
          self.topDayStories = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    //top tuan
    axios.get('http://localhost:3000/api/v1/readers/hotstories/hot_week')
        .then(function (response) {
          // handle success
          console.log("WEEK")
          console.log(response.data)
          self.topWeekStories = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    //top thang
    axios.get('http://localhost:3000/api/v1/readers/hotstories/hot_month')
        .then(function (response) {
          // handle success
          console.log("MONTH")
          console.log(response.data)
          self.topMonthStories = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }
}

</script>

<style scoped>
@import url(@/assets/css/home.css);
* {
  color: white;
}

.background-home-part {
  background: url('http://storage.googleapis.com/cheritz/msg/images/general/bg.png') no-repeat top center fixed;
}

.container {
  background-color: #252525;
}
</style>