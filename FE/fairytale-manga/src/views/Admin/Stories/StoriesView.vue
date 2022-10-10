<template>
  <div class="story-view">
    <Stories></Stories>
  </div>
</template>

<script>
// @ is an alias to /src
import Stories from "@/components/Admin/Stories";

export default {
  name: 'StoriesView',
  components: {
    Stories
  }
}
</script>
