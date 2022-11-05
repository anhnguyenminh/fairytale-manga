<template>
  <div>
    <header>
      <div class="container-fluid top-container">
        <div class="container">
          <nav class="navbar navbar-expand-lg navbar-light my-menu">
            <div class="container-fluid p-0">
              <router-link :to="{ path:'/' }" tag="a" class="navbar-brand">
                <img src="@/assets/images/logo-while.png"/>
              </router-link>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                      aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse row" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 col-8">
                  <li class="nav-item">
                    <router-link :to="{path: '/categories/trending-stories'}" tag="a" class="nav-link active" aria-current="page">NỔI BẬT</router-link>
                  </li>
                  <li class="nav-item">
                    <router-link tag="a" class="nav-link" :to="{path:'/categories/recommended-stories/'}">ĐỀ CỬ</router-link>
                  </li>

                  <li class="nav-item dropdown category-pc">
                    <a class="nav-link dropdown-toggle" href="javascript:void(0);"
                       id="navbarDropdown" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                      THỂ LOẠI
                    </a>
                    <ul class="dropdown-menu columns" aria-labelledby="navbarDropdown">
                      <li><a class="dropdown-item" href="#">Comedy</a></li>
                      <li><a class="dropdown-item" href="#">Historical</a></li>
                      <li><a class="dropdown-item" href="#">Mystery</a></li>
                      <li><a class="dropdown-item" href="#">Romance</a></li>
                      <li><a class="dropdown-item" href="#">Fantasy</a></li>
                      <li><a class="dropdown-item" href="#">One Shot</a></li>
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Adventure</a></li>
                      <li><a class="dropdown-item" href="#">Horror</a></li>
                      <li><a class="dropdown-item" href="#">Supernature</a></li>
                      <li><a class="dropdown-item" href="#">School Life</a></li>
                      <li><a class="dropdown-item" href="#">Spychological</a></li>
                      <li><a class="dropdown-item" href="#">Webtoon</a></li>
                      <li><a class="dropdown-item" href="#">Harem</a></li>
                      <li><a class="dropdown-item" href="#">Comics</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">ĐANG THEO DÕI</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link " href="#" tabindex="-1">TÌM TRUYỆN</a>
                  </li>
                </ul>
                <div class="d-flex wrapped-right-side-nav col-4">
                  <div
                      style="display: flex; align-items: center; justify-content: center; background-color: white; border-radius: 1.075rem;">
                    <i class="fas fa-search"></i>
                    <input class="form-control" type="search" placeholder="Search..."
                           aria-label="Search">
                  </div>
                  <div class="d-flex right-side-nav">
                    <div>
                      <a href="/"><i class="fas fa-venus-mars"></i></a>
                    </div>

                    <div>
                      <router-link :to="{ name: 'LoginView' }" tag="a"><i class="fas fa-user"></i></router-link>
                    </div>
                    <div>
                      <a href="/"><i class="fas fa-bell"></i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </div>

    </header>
  </div>


</template>
<script>
import axios from "@/plugins/user_axios";
export default {
  name: "Menu",
  data() {
    return {};
  },
  method: {},
  created() {
    let self = this;
    axios.get('readers/stories/' + this.$route.params.chap + '/show_chapter')
        .then(function (response) {
          // handle success
          console.log(response.data)
          self.chapter = response.data
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  }

}
</script>

<style scoped>
@import url(@/assets/css/menu.css);
</style>