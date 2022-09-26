<template>
  <div class="login-view">
    <login></login>
    <login-default></login-default>
  </div>
</template>

<script>
// @ is an alias to /src
import Login from '@/components/Login.vue'
import Login2 from '@/components/Login2.vue'

export default {
  name: 'LoginView',
  components: {
    'login-default': Login,
    'login': Login2
  }
}
</script>