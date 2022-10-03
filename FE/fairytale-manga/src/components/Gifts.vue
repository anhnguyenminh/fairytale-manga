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
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Gifts</h5>
                <router-link class="btn btn-success" :to="{ path: 'gifts/add-new' }" role="button">Add new gift
                </router-link>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-4">Name</th>
                      <th class="col-2">Score</th>
                      <th class="col-2">Stock</th>
                      <th class="col-3 col-last">Actions</th>
                    </tr>
                    </thead>
                    <!-- admin account data -->
                    <tbody>
                    <tr v-for="gift in Gifts.gifts" :key="gift.id">
                      <td class="col-1">{{ gift.id }}</td>
                      <td class="col-4">{{ gift.name }}</td>
                      <td class="col-2">{{ gift.score }}</td>
                      <td class="col-2">{{ gift.stock }}</td>
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

const {mapActions} = createNamespacedHelpers("gifts");
// import {mapActions} from  'vuex'

export default {
  // name: "Gifts",.
  data() {
    return {};
  },
  mounted() {
     this.getGift();
  },
  methods: {
    ...mapActions([
      'getGift'
    ])
  },
  computed: {
    Gifts() {
      console.log(this.$store.state.gifts)
      console.log(this.$store.state.token)
      return this.$store.state.gifts
    }
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