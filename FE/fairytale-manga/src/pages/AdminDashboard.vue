<template>
  <div id="dashboard-admin">
    <div class="row">
      <Sidebar class="col-lg-2 col-md-3 left-sidebar"></Sidebar>
      <div class="col-10 col-md-9 right-content">
        <Searchbar></Searchbar>
        <router-view></router-view>
        <Copyright></Copyright>
      </div>
    </div>


  </div>
</template>

<script>
import Sidebar from "@/components/Sidebar";
import Searchbar from "@/components/Searchbar";
import Copyright from "@/components/Copyright";

export default {
  name: 'AdminDashboard',
  components: {
    Sidebar, Searchbar, Copyright
  }
}
</script>
<style scoped>
.left-sidebar{
  padding-right: 0!important;
}
.right-content{
  padding-left: 0!important;
}

</style>
