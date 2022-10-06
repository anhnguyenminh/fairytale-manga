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

                <router-link class="btn btn-success" :to="{path: '/admin/authors/add-new'}" role="button">Create
                  author
                </router-link>
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
                    <tr v-for="author in Authors.authors" :key="author.id">
                      <td class="col-1">{{ author.id }}</td>
                      <td class="col-4">{{ author.name }}</td>
                      <td class="col-4">{{ author.description }}</td>
                      <td class="col-3 actions">
                        <router-link :to="{path:`/admin/authors/update/${author.id}`}">
                          <button class="btn btn-info">Edit</button>
                        </router-link>
                        <a href="#">
                          <button class="btn btn-danger" @click="deleteData(author.id)">Delete</button>
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
import axios from "@/plugins/axios";

const {mapActions} = createNamespacedHelpers("authors");


export default {
  name: "AuthorsView",
  data() {
    return {};
  },
  methods: {
    ...mapActions([
      'getAuthorsData'
    ]),
    deleteData(id) {
      //need to check if author dont compose any story
      //check if admin create typo author
      if (confirm('Are you sure you want to delete this author? ' +
          '(All stories of this author if existed will be delete either)')) {
        // Delete it!
        axios.delete(`http://localhost:3000/api/v1/admins/authors/${id}`)
            .then(response => {
              console.log();
              this.getAuthorsData();
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
    Authors() {
      console.log(this.$store.state.authors)
      console.log(this.$store.state.token)
      return this.$store.state.authors
    }
  },
  async mounted() {
    await this.getAuthorsData();
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