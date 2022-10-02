<template>
  <div>
    <div class="wrapper">
      <div class="content-wrapper d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Begin Page Content -->
          <div class="container-fluid">
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3" style="display: flex; justify-content: space-between; align-items: center;">
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Authors</h5>
                <a class="btn btn-success" href="register.html" role="button">Create author</a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-4">Author</th>
                      <th class="col-4">Description</th>
                      <th class="col-3 col-last">Actions</th>
                    </tr>
                    </thead>
                    <!-- admin account data -->
                    <tbody id="admAccData">
                    <tr v-for="author in authors" :key="author.id">
                      <td class="col-1">{{ author.id}}</td>
                      <td class="col-4">{{ author.name}}</td>
                      <td class="col-4">{{ author.description}}</td>
                      <td class="col-3 actions">
                        <a href="#">
                          <button class="btn btn-info">Edit</button>
                        </a>
                        <a href="#">
                          <button class="btn btn-danger">Delete</button>
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
      authors: [
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
    axios.get('http://localhost:3000/api/v1/admins/authors/')
        .then(function (response) {
          // handle success
          console.log(response);
          console.log('TAC GIA');
          self.authors = response.data;

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

.col-last {
  text-align: right;
  padding-right: 17px;
}

.actions {
  text-align: right;
}

.actions button {
  margin: 0 5px;
}
</style>