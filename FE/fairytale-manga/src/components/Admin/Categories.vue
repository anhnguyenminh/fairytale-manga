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
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Categories</h5>
                <router-link class="btn btn-success" :to="{ path: '/admin/categories/add-new' }" role="button">Create
                  category
                </router-link>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-4">Title</th>
                      <th class="col-4">Description</th>
                      <th class="col-3 col-last">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="category in Categories.categories" :key="category.id">
                      <td class="col-1">{{ category.id }}</td>
                      <td class="col-4">{{ category.name }}</td>
                      <td class="col-4">{{ category.description }}</td>
                      <td class="col-3 actions">
                        <router-link :to="{path:`/admin/categories/update/${category.id}`}">
                          <button class="btn btn-info">Edit</button>
                        </router-link>
                        <a href="#">
                          <button class="btn btn-danger" @click="deleteData(category.id)">Delete</button>
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
import {createNamespacedHelpers} from "vuex";

const {mapActions} = createNamespacedHelpers("categories");

import axios from "@/plugins/axios";

export default {
  name: "Categories",
  data() {
    return {};
  },
  methods: {
    ...mapActions([
      'getCategoryData'
    ]),
    //delete data

    deleteData(id) {
      if (confirm('Are you sure you want to delete this category?')) {
        // Delete it!
        axios.delete(`http://localhost:3000/api/v1/admins/categories/${id}`)
            .then(response => {
              console.log();
              this.getCategoryData();
            })
            .catch(function (error) {
              console.log(error.response)
            })
        console.log('Thing was deleted.');
      } else {
        // Do nothing!
        console.log('Thing was not deleted.');
      }
    }
  },
  computed: {
    Categories() {
      // console.log(this.$store.state.categories)
      // console.log(this.$store.state.token)
      return this.$store.state.categories
    }
  },
  mounted() {
    this.getCategoryData();
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