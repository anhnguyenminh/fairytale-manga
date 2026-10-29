<script setup lang="ts">
import { shallowRef } from 'vue'
import logo from '@/assets/images/logo-while.png'

// Static category list (same as the original menu; not backed by an API).
const categories = [
  'Comedy', 'Historical', 'Mystery', 'Romance', 'Fantasy', 'One Shot', 'Action', 'Adventure',
  'Horror', 'Supernature', 'School Life', 'Spychological', 'Webtoon', 'Harem', 'Comics',
]

const mobileOpen = shallowRef(false)
</script>

<template>
  <div>
    <header>
      <div class="top-container">
        <div class="container mx-auto">
          <nav class="my-menu flex flex-wrap items-center justify-between">
            <router-link :to="{ path: '/' }" class="navbar-brand">
              <img :src="logo" alt="Fairytale Manga" />
            </router-link>
            <button
              class="navbar-toggler lg:hidden"
              type="button"
              aria-label="Toggle navigation"
              @click="mobileOpen = !mobileOpen"
            >
              <i class="fas fa-bars"></i>
            </button>
            <div
              class="w-full lg:flex lg:w-auto lg:flex-1 lg:items-center lg:justify-between"
              :class="mobileOpen ? 'block' : 'hidden'"
            >
              <ul class="navbar-nav flex flex-col lg:flex-row list-none p-0 m-0 gap-4 items-start lg:items-center">
                <li class="nav-item">
                  <router-link :to="{ path: '/categories/trending-stories' }" class="nav-link active">NỔI BẬT</router-link>
                </li>
                <li class="nav-item">
                  <router-link :to="{ path: '/categories/recommended-stories/' }" class="nav-link">ĐỀ CỬ</router-link>
                </li>
                <li class="nav-item category-pc">
                  <a-dropdown>
                    <a class="nav-link" href="javascript:void(0);">THỂ LOẠI <i class="fas fa-caret-down"></i></a>
                    <template #overlay>
                      <a-menu class="columns">
                        <a-menu-item v-for="name in categories" :key="name">{{ name }}</a-menu-item>
                      </a-menu>
                    </template>
                  </a-dropdown>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">ĐANG THEO DÕI</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" tabindex="-1">TÌM TRUYỆN</a>
                </li>
              </ul>
              <div class="wrapped-right-side-nav flex items-center justify-center gap-3">
                <div class="search-box">
                  <i class="fas fa-search"></i>
                  <a-input class="search-input" type="search" placeholder="Search..." aria-label="Search" :bordered="false" />
                </div>
                <div class="right-side-nav flex">
                  <div><a href="/"><i class="fas fa-venus-mars"></i></a></div>
                  <div><router-link :to="{ name: 'LoginView' }"><i class="fas fa-user"></i></router-link></div>
                  <div><a href="/"><i class="fas fa-bell"></i></a></div>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </div>
    </header>
  </div>
</template>

<style scoped>
.top-container {
  background: linear-gradient(167deg, #000000, #434343);
}

.my-menu {
  padding: 8px 0;
}

.navbar-brand {
  margin-right: 0;
}

.navbar-brand img {
  width: 90%;
  height: 100%;
  padding: 2%;
}

.navbar-toggler {
  background: #fff;
  border: none;
  padding: 4px 10px;
  border-radius: 4px;
}

.nav-link {
  color: white !important;
  font-family: 'Alegreya SC', serif;
}

a:hover {
  color: #f1c40f !important;
}

.my-menu .active {
  color: #f1c40f !important;
}

.right-side-nav a {
  font-size: 1.25rem;
  color: white;
}

.right-side-nav div {
  padding: 0 10px;
}

.search-box {
  display: flex;
  align-items: center;
  background-color: white;
  border-radius: 1.075rem;
  padding-left: 0.75rem;
}

.search-input {
  background: none;
}
</style>

<style>
.columns.ant-dropdown-menu {
  column-count: 3;
  background: #000;
  max-width: 800px;
}

.columns .ant-dropdown-menu-item {
  color: #f8f9fa;
}

.columns .ant-dropdown-menu-item:hover {
  background-color: #222 !important;
}
</style>
