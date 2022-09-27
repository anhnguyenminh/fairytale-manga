<template>
  <div class="dashboard">
    <Sidebar></Sidebar>
  </div>
</template>

<script>
// @ is an alias to /src
import Sidebar from "@/components/Sidebar";

export default {
  name: 'DashboardView',
  components: {
    Sidebar
  }
}
</script>
