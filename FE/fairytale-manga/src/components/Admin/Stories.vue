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
                <h5 class="m-0 font-weight-bold text-primary text-uppercase">Stories</h5>
                <router-link class="btn btn-success" :to="{ path: '/admin/stories/add-new' }" role="button">New story
                </router-link>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                      <th class="col-1">ID</th>
                      <th class="col-2">Title</th>
                      <th class="col-2">Author</th>
                      <th class="col-3">Description</th>
                      <th class="col-1">Status</th>
                      <th class="col-1">All chapter</th>
                      <th class="col-2 col-last">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="story in Stories.stories" :key="story.id">
                      <td class="col-1">{{ story.id }}</td>
                      <td class="col-2">{{ story.name }}</td>
                      <td class="col-2">Jimmy Tran</td>
                      <td class="col-3">This is the description for the story</td>
                      <td class="col-1">On-going</td>
                      <td class="col-1">235</td>
                      <td class="col-2 actions">
                        <router-link :to="{path:`/admin/stories/ten-truyen/update/${story.id}`}">
                          <button class="btn btn-info">Details</button>
                        </router-link>

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

const {mapActions} = createNamespacedHelpers("stories");
import axios from "@/plugins/axios";

export default {
  name: "Stories",
  data() {
    return {};
  },
  methods: {
    ...mapActions([
      'getStoriesData'
    ])
  },
  computed: {
    Stories() {
      // console.log(this.$store.state.stories)
      // console.log(this.$store.state.token)
      return this.$store.state.stories
    }
  },
  mounted() {
    this.getStoriesData();
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