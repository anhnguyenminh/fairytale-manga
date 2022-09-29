<template>
  <nav class="navbar navbar-expand navbar-light bg-dark topbar mb-4 static-top shadow search-navbar">
    <!-- Topbar Search -->
    <b-input-group class="search-box">
      <b-form-input></b-form-input>
      <b-input-group-append>
        <b-button variant="light"><i class="fas fa-search fa-sm"></i></b-button>
      </b-input-group-append>
    </b-input-group>
  </nav>
</template>
<script>

</script>
<style>
nav.search-navbar {
  justify-content: flex-end !important;
}

.search-box {
  width: 30%;
  margin: 0.5rem;
}
</style>