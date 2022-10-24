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
              <div class="card-header py-3">
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Readers</h5>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-2">Email</th>
                      <th class="col-2">Username</th>
                      <th class="col-1">Age</th>
                      <th class="col-1">Gender</th>
                      <th class="col-1">Phonenumber</th>
                      <th class="col-2">Address</th>
                      <th class="col-1">Score</th>
                      <th class="col-1">Banned</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr v-for="reader in readers" :key="reader.id">
                      <td class="col-1">{{ reader.id }}</td>
                      <td class="col-2">{{ reader.email }}</td>
                      <td class="col-2">{{ reader.name }}</td>
                      <td class="col-1">{{ reader.age }}</td>
                      <td class="col-1">{{ reader.show_gender }}</td>
                      <td class="col-1">{{ reader.phonenumber }}</td>
                      <td class="col-2">{{ reader.address }}</td>
                      <td class="col-1">{{ reader.score }}</td>
                      <td class="col-1">{{ reader.ban }}</td>

                    </tr>
                    </tbody>
                  </table>
                </div>
                <div class="d-flex justify-content-center">
                  <ul v-if="meta.pages > 1" class="pagination">

                    <li v-if="meta.page > 1" @click="goToPage(meta.page-1)">&laquo;</li>
                    <li v-else class="disabled ">{{ meta.page }}</li>

                    <li
                        v-for="page in meta.pages"
                        :class="{ active: (currentPage == page) }"
                        @click="goToPage(page)"
                    >{{ page }}
                    </li>

                    <li v-if="meta.page < meta.pages"
                        @click="goToPage(meta.page +1)">&raquo;
                    </li>
                    <li v-else class="disabled ">&raquo;
                    </li>
                  </ul>
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

const {mapActions, mapState} = createNamespacedHelpers("readers");

export default {
  name: "ReadersView",
  methods: {
    ...mapActions([
      'getReadersData',
      'setCurrentPage'
    ]),
    goToPage(page) {
      this.setCurrentPage(page);
      this.getReadersData()
    }
  },
  computed: {
    ...mapState([
      'readers',
      'meta',
      'currentPage'
    ])
  },
  mounted() {
    this.getReadersData();
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


.pagination {
  display: inline-block;
}

.pagination li {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination li.active {
  background-color: #6959CD;
  color: white;
  border: 1px solid #6959CD;
}

.pagination li:hover:not(.active) {
  background-color: #ddd;
}

.disabled {
  display: none;
}
</style>