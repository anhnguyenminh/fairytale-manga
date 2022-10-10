<template>
  <div class="category-view">
  <Categories></Categories>
  </div>
</template>

<script>
// @ is an alias to /src
import Categories from "@/components/Admin/Categories";

export default {
  name: 'CategoriesView',
  components: {
    Categories
  }
}
</script>
