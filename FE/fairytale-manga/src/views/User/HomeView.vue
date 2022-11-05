<template>
  <div class="home">
    <Home></Home>
  </div>
</template>

<script>
// @ is an alias to /src
import Home from '@/components/Client/Home.vue'

export default {
  name: 'HomeView',
  components: {
    'Home': Home
  }
}
</script>
