<template>
  <div class="login-view">
    <register></register>
    <register-default></register-default>
  </div>
</template>

<script>
// @ is an alias to /src
import Login from "@/components/Login.vue";
import Register from "@/components/Register.vue";
import Login2 from "@/components/Login2.vue";
import Register2 from "@/components/Register2.vue";

export default {
  name: "LoginView",
  components: {
    "login-default": Login,
    "register-default": Register,
    login: Login2,
    register: Register2,
  },
};
</script>
