<template>
  <div class="home">
    <navbar-menu></navbar-menu>
    <login></login>
    <register></register>
    <login-default></login-default>
    <register-default></register-default>
    <footer-bottom></footer-bottom>
  </div>
</template>

<script>
// @ is an alias to /src
import Menu from '@/components/Menu.vue'
import Footer from '@/components/Footer.vue'
import Login from '@/components/Login.vue'
import Register from '@/components/Register.vue'
import Login2 from '@/components/Login2.vue'
import Register2 from '@/components/Register2.vue'

export default {
  name: 'LoginView',
  components: {
    'login-default': Login,
    'register-default': Register,
    'login': Login2,
    'register': Register2,
    'navbar-menu': Menu,
    'footer-bottom': Footer
  }
}
</script>