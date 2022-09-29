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
                      <th class="col-3 col-last">Actions</th>
                    </tr>
                    </thead>
                    <tbody id="admAccData">
                    <tr v-for="category in Categories.categories" :key="category.id">
                      <td class="col-1">{{ category.id }}</td>
                      <td class="col-4">{{ category.name }}</td>
                      <td class="col-4">{{ category.description }}</td>
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
import {createNamespacedHelpers} from "vuex";
const {mapActions} = createNamespacedHelpers("categories");

export default {
  name: "Categories",
  data() {
    return {};
  },
  methods: {
    ...mapActions([
      'getCategoryData'
    ])
  },
  computed: {
    Categories() {
      console.log(this.$store.state.categories)
      return this.$store.state.categories
    }
  },
  async mounted() {
    await this.getCategoryData();
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