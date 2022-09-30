<template>
  <div>
    <nav class="sidebar-nav">
      <div class="container">
        <!--        <div class="wrapped-navbar">-->
        <div class="navbar-header">
          <div class="app-logo">
            <img src="https://qmanga3.net/image/logo-while.png" alt="app-logo"/>
          </div>
        </div>

        <div class="navbar-avt">
          <div>
            <img src="https://preview.keenthemes.com/metronic8/demo15/assets/media/avatars/300-1.jpg"/>
          </div>
          <div>
            <div class="admin-name">Adam Straub</div>
            <div class="position">Admin</div>
          </div>
        </div>

        <div class="navbar-main-content">
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-books"></i>
            </div>
            <div>Stories</div>
          </div>
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-th-large"></i>
            </div>
            <div>Categories</div>
          </div>
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-marker"></i>
            </div>
            <div>Authors</div>
          </div>
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-book-reader"></i>
            </div>
            <div>Readers</div>
          </div>
          <!--            <div class="menu-item">-->
          <!--              <div class="icon-item">-->
          <!--                <i class="fas fa-comments"></i>-->
          <!--              </div>-->
          <!--              <div>Comment</div>-->
          <!--            </div>-->
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-gift"></i>
            </div>
            <div>Gifts</div>
          </div>
          <div class="menu-item">
            <div class="icon-item">
              <i class="fas fa-sign-out-alt"></i>
            </div>
            <div @click="logout">Logout</div>
          </div>
        </div>
        <!--        </div>-->
        <!--        <div class="navbar-footer" >-->
        <!--          <div class="menu-item">-->
        <!--            <div class="icon-item">-->
        <!--              <i class="fas fa-sign-out-alt"></i>-->
        <!--            </div>-->
        <!--            <div>Logout</div>-->
        <!--          </div>-->
        <!--        </div>-->
      </div>
    </nav>
  </div>
</template>
<script>

export default {
  methods:{
    logout(){
      this.$store.commit("clearToken");
      this.$router.push({path:"/admin/login"});
    }
  }



}
</script>
<style scoped>
.sidebar-nav {
  height: 100%;
}

.sidebar-nav .container {
  padding: 0;
  background: #6959CD;
  color: #fff;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

/*.wrapped-navbar */
.navbar-header {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin-top: 30px;
}

.navbar-avt {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 40px;
}

.navbar-avt img {
  width: 75px;
  height: 75px;
  margin-bottom: 15px;
  border-radius: 6px;
}

.admin-name {
  font-weight: 600;
  font-size: 1.125rem;
}

.position {
  text-align: center;
  color: #f1f1f1;
  font-weight: 500;
}

.navbar-main-content {
  display: flex;
  flex-direction: column;
  height: 90%;
  margin-top: 1.5rem;
}

.menu-item {
  display: flex;
  padding: 0.65rem 1rem;
  font-weight: 700;
  font-size: 1.125rem;
}

.menu-item:hover {
  background-color: #F4F6FA;
  color: #6959CD;
}

.menu-item div:first-child {
  padding-left: 15px;
  justify-content: center;
}

.menu-item div:nth-child(2) {
  padding-left: 15px;
}

/*.navbar-footer{*/
/*  margin-bottom: 0.5rem;*/
/*}*/
</style>