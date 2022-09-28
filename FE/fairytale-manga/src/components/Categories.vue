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
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Categories</h5>
                <a class="btn btn-success" href="register.html" role="button">Create category</a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-4">Title</th>
                      <th class="col-4">Description</th>
                      <th class="col-3">Action</th>
                    </tr>
                    </thead>
                    <!-- admin account data -->
                    <tbody id="admAccData">
                    <tr v-for="category in categories">
                      <td class="col-1">{{ category.id}}</td>
                      <td class="col-4">{{ category.name}}</td>
                      <td class="col-4">{{ category.description}}</td>
                      <td class="col-3">
                        <a href="#">
                          <button>Edit</button>
                        </a>
                        <a href="#">
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
import axios from "axios";

export default {
  name: "Categories",
  data() {
    return {
      categories: [
        {
          id: '',
          name:'',
          description:''
        }
      ]
    };
  },
  method: {
  },
  created() {
      let self = this;
      const axios = require('axios').default;
      axios.get('http://localhost:3000/api/v1/admins/categories/')
          .then(function (response) {
            // handle success
            console.log(response);
            console.log('Sieu wa da chay duoc vao day roi ne');
            self.categories = response.data;

          })
          .catch(function (error) {
            // handle error
            console.log(error);
            console.log('Gi ki z ba, sai te le roi !!!')
          })
          .finally(function () {
            // always executed
          });

  }
}

</script>
<style scoped>

</style>