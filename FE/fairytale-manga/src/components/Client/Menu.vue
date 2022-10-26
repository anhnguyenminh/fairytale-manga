<template>
  <div>
    <header>
      <div class="container-fuild top-container">
        <div class="container">
          <nav class="navbar navbar-expand-lg navbar-light my-menu">
            <div class="container-fluid" style="padding: 0;">
              <router-link :to="{ path:'/' }" tag="a" class="navbar-brand" href="#"><img src="https://qmanga3.net/image/logo-while.png" style="    width: 90%;
                            height: 100%;
                            padding: 2%;"/></router-link>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                      data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                      aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse row" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 col-8">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">NỔI BẬT</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">ĐỀ CỬ</a>
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
export default {
  name: "Menu",
  data() {
    return {};
  }, method: {}
}
</script>

<style scoped>
.my-menu {
  padding: 8px 0;
}

a:hover {
  color: #f1c40f !important;
}

.my-menu .active {
  color: #f1c40f !important;
}

.nav-link {
  color: white !important;
}

.columns {
  column-count: 3;
  border: 0;
  background: #000;
  max-width: 800px;
  max-height: 800px;
  overflow: hidden;
}

.nav-item a {
  font-family: 'Alegreya SC', serif;
}

.dropdown-item {
  color: #f8f9fa;
}

.dropdown-item:focus,
.dropdown-item:hover {
  background-color: black;
}

.top-container {
  /* background-color: #292929; */
  background: linear-gradient(167deg, #000000, #434343);
}

.navbar-brand {
  margin-right: 0;
}

.right-side-nav a {
  font-size: 1.25rem;
  color: white;
}

.right-side-nav div {
  padding: 0 10px;
}

.wrapped-right-side-nav {
  align-items: center;
  justify-content: center;
  padding-right: 0;
  padding-left: 0;
}

.wrapped-right-side-nav .form-control {
  border: none;
  background: none;

}

.wrapped-right-side-nav .form-control:focus {
  box-shadow: none;
}

.wrapped-right-side-nav i {
  padding-left: 0.75rem;
}

.navbar-toggler {
  background: #fff;
}

#navbarSupportedContent {
  justify-content: space-between;
}
</style>