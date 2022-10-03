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
              <div class="card-header py-3" >
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Readers</h5>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-1">Email</th>
                      <th class="col-1">Username</th>
                      <th class="col-1">Age</th>
                      <th class="col-1">Gender</th>
                      <th class="col-1">Phone number</th>
                      <th class="col-2">Address</th>
                      <th class="col-1">Score</th>
                      <th class="col-2 col-last">Actions</th>
                    </tr>
                    </thead>
                    <!-- admin account data -->
                    <tbody>
                    <tr v-for="reader in Readers.readers" :key="reader.id">
                      <td class="col-1">{{ reader.id}}</td>
                      <td class="col-1">{{ reader.email}}</td>
                      <td class="col-1">{{ reader.name}}</td>
                      <td class="col-1">{{ reader.age}}</td>
                      <td class="col-1">{{ reader.gender}}</td>
                      <td class="col-1">{{ reader.phonenumber}}</td>
                      <td class="col-2">{{ reader.address}}</td>
                      <td class="col-1">{{ reader.score}}</td>
                      <td class="col-2 actions">
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
const {mapActions} = createNamespacedHelpers("readers");

export default {
  name: "ReadersView",
  data() {
    return { };
  },
  methods: {
    ...mapActions([
      'getReadersData'
    ]),
  },
  computed:{
    Readers(){
      console.log(this.$store.state.readers)
      console.log(this.$store.state.token)
      return this.$store.state.readers
    }
  },
  async mounted(){
    await this.getReadersData();
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