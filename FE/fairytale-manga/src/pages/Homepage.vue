<template>
  <div id="homepage-user">
    <Menu></Menu>
    <router-view></router-view>
    <Footer></Footer>

  </div>
</template>

<script>
import Menu from "@/components/Client/Menu";
import Footer from "@/components/Client/Footer";
export default {
  name: 'Homepage',
  components: {
    Footer, Menu,
  }
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Alegreya+SC:wght@700&family=Alegreya:ital,wght@0,400;0,500;0,600;0,700;1,500;1,700&display=swap');

* {
  font-family: 'Alegreya', serif;
}
</style>
