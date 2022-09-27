<template>
  <div>
    <div class="wrapper">
      <div class="content-wrapper d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->

          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          <div class="container-fluid">
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3" style="display: flex; justify-content: space-between; align-items: center;">
                <h6 class="m-0 font-weight-bold text-primary text-uppercase">Categories</h6>
                <a class="btn btn-success" href="register.html" role="button">Create category</a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-lg-2">STT</th>
                      <th class="col-lg-6">Category</th>
                      <th class="col-lg-4">Action</th>
                    </tr>
                    </thead>
                    <!-- admin account data -->
                    <tbody id="admAccData">
                    <tr>
                      <td class="col-lg-2">1</td>
                      <td class="col-lg-6">Comedy</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td class="col-lg-2">2</td>
                      <td class="col-lg-6">Historical</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td class="col-lg-2">3</td>
                      <td class="col-lg-6">Mystery</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td class="col-lg-2">4</td>
                      <td class="col-lg-6">Romance</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td class="col-lg-2">5</td>
                      <td class="col-lg-6">Fantasy</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    <tr>
                      <td class="col-lg-2">6</td>
                      <td class="col-lg-6">Action</td>
                      <td class="col-lg-4">
                        <a href="">
                          <button>Edit</button>
                        </a>
                        <a href="">
                          <button>Delete</button>
                        </a>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->


      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "Categories",
  data() {
    return {};
  },
  method: {}
}

</script>
<style scoped>

</style>