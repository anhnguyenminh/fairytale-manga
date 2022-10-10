<template>
  <div class="gifts-view">
    <Gifts></Gifts>
  </div>
</template>

<script>
// @ is an alias to /src
import Gifts from "@/components/Admin/Gifts";

export default {
  name: 'GiftsView',
  components: {
    Gifts
  }
}
</script>