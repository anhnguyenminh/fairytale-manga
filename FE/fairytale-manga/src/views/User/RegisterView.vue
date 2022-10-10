<template>
  <div class="register-view">
    <register></register>
    <register-default></register-default>
  </div>
</template>

<script>
// @ is an alias to /src
import Register from '@/components/Client/Register.vue'
import Register2 from '@/components/Client/Register2.vue'

export default {
  name: "RegisterView",
  components: {
    "register-default": Register,
    "register": Register2
  },
};
</script>
