<template>
  <div>
    <nav style="height: 100%;">
      <div class="container"
           style="max-width: 600px; padding: 0; background: #6959CD;color: #fff; left: 0; top: 0;bottom: 0; height: 100%;">
        <div class="navbar-brand">
          <div><img src="https://qmanga3.net/image/logo-while.png" alt="admin-logo"></div>
          <div>Fairytale Manga</div>
        </div>
        <div style="display: flex; flex-direction: column; height: 90%;">
          <div class="menu-item">
            <div>
              <i class="fas fa-books"></i>
            </div>
            <div>Stories</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-th-large"></i>
            </div>
            <div>Categories</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-marker"></i>
            </div>
            <div>Authors</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-book-reader"></i>
            </div>
            <div>Readers</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-comments"></i>
            </div>
            <div>Comment</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-gift"></i>
            </div>
            <div>Gifts</div>
          </div>
          <div class="menu-item">
            <div>
              <i class="fas fa-sign-out-alt"></i>
            </div>
            <div>Logout</div>
          </div>

        </div>
      </div>
    </nav>
  </div>
</template>
<script>

</script>
<style scoped>
.menu-item {
  display: flex;
  padding: 0.65rem 1rem;
}
.menu-item:hover{
  background-color: #F4F6FA;
  color: #6959CD;
}
.menu-item div:first-child{
  /*padding-left: 15px;*/
  justify-content: center;
}
.menu-item div:nth-child(2){
 padding-left: 15px;
}
</style>