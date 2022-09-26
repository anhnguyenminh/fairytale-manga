<template>
  <div class="admin-login-view">
    <AdminLogin></AdminLogin>
  </div>
</template>

<script>
// @ is an alias to /src
import AdminLogin from '@/components/AdminLogin'

export default {
  name: 'AdminLoginView',
  components: {
   AdminLogin
  }
}
</script>