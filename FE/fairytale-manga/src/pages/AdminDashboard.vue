<template>
  <div id="dashboard-admin">
    <div class="row" >
      <Sidebar class="col-lg-2 col-md-3 left-sidebar"></Sidebar>
      <div class="col-lg-10 col-md-9 right-content">
        <Searchbar></Searchbar>
        <router-view class="main-content"></router-view>
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
  },
  mounted() {
    checkToken:{
      const token = this.$store.state.token
      if (token.length == 0 || token == null || token == ''){
        this.$router.push({path: "/admin/login"})
      }
    }
  }
}
</script>
<style scoped>
.left-sidebar{
  padding-right: 0!important;
  height: 1200px;
}
.right-content{
  padding-left: 0!important;
}
.main-content{
  height: 1042px
}

</style>
