<template>
  <div class="gifts-view">
    <Gifts></Gifts>
  </div>
</template>

<script>
// @ is an alias to /src
import Gifts from "@/components/Gifts";

export default {
  name: 'GiftsView',
  components: {
    Gifts
  }
}
</script>