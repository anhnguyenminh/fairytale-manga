<template>
  <div class="home">
    <home></home>
  </div>
</template>

<script>
// @ is an alias to /src
import Home from '@/components/Home.vue'

export default {
  name: 'HomeView',
  components: {
    'home': Home
  }
}
</script>
