<template>
  <div class="container">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/stories/'}" class="btn go-back" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 class="page-header">Add New Story</h2>
    </div>
    <div class="wrap-body">
      <!--      left-->
      <div class="left-side">
        <div class="content">

          <b-form>
            <b-form-group id="input-group-1" label="Title" label-for="str-title">
              <b-form-input
                  id="str-title"
                  v-model="form.name"
                  type="text"
                  placeholder="Enter story name..."
                  required
              ></b-form-input>
            </b-form-group>

            <b-form-group label="Author">
              <b-form-select v-model="form.selected" :options="form.options"></b-form-select>
            </b-form-group>

            <b-form-group label="Category" v-slot="{ ariaDescribedby }">
              <b-form-checkbox-group
                  id="checkbox-group-category"
                  v-model="form.selected2"
                  :options="Categories.option2"
                  :aria-describedby="ariaDescribedby"
                  stacked
                  name="categories"
              ></b-form-checkbox-group>
            </b-form-group>
          </b-form>

        </div>
        <div class="content">
          <div class="d-flex justify-content-between align-items-center">
            <h5>Chapters</h5>
            <div>
              <router-link class="btn btn-success" :to="{ path: '/admin/stories/ten-truyen/new-chapter' }"
                           role="button">+ New chapter
              </router-link>
            </div>
          </div>
          <div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" width="100%" cellspacing="0">
                  <thead>
                  <tr>
                    <th class="col-3">ID</th>
                    <th class="col-5">Chapter</th>
                    <th class="col-4 col-last">Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!--                  <tr>-->
                  <!--                    <td class="col-3">1</td>-->
                  <!--                    <td class="col-5">Chapter 1</td>-->
                  <!--                    <td class="col-4 actions">-->
                  <!--                      <a>-->
                  <!--                        <button class="btn btn-info">Edit</button>-->
                  <!--                      </a>-->
                  <!--                      <a href="#">-->
                  <!--                        <button class="btn btn-danger" >Delete</button>-->
                  <!--                      </a>-->
                  <!--                    </td>-->
                  <!--                  </tr>-->

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="content">

          <div class="btn-bottom">
            <b-button class="my-btn" type="submit" variant="success">Save story</b-button>
          </div>
        </div>
      </div>
      <!--      right-->
      <div class="right-side">
        <div class="content">

          <b-form>
            <b-form-group label="Status">
              <b-form-select v-model="form.selected" :options="form.options"></b-form-select>
            </b-form-group>

          </b-form>

        </div>
        <div class="content">
          <div class="d-flex justify-content-between align-items-center">
            <h6>Cover image</h6>
            <div>
              <a href="#">Add</a>
            </div>
          </div>
          <div class="wrapped-image" style="">
            <!--            <img src="https://st.ntcdntempv3.com/data/comics/172/saotome-san-va-tro-choi1-sinh-tu.jpg" alt="cover-image" >-->
            <b-form-file
                v-model="form.file1"
                :state="Boolean(form.file1)"
                placeholder="Choose a file or drop it here..."
                drop-placeholder="Drop file here..."
            ></b-form-file>

          </div>
        </div>

      </div>
    </div>

  </div>
</template>

<script>
import Categories from "@/components/Admin/Categories";

require('@/assets/css/story.css')
import {createNamespacedHelpers} from "vuex";

const categoriesStore = createNamespacedHelpers("categories");
// const authorStore = createNamespacedHelpers("authors");
export default {
  name: 'AddNewStory',
  data() {
    return {
      form: {
        name: '',
        // description: '',
        selected: null,
        options: [
          {value: null, text: 'Please select an option'},
          {value: 'a', text: 'This is First option'},
          {value: 'b', text: 'Selected Option'},
          {value: {C: '3PO'}, text: 'This is an option with object value'},
          {value: 'd', text: 'This one is disabled', disabled: true}
        ],
        file1: null,
        selected2: [], // Must be an array reference!
      }
    }
  },
  methods: {
    ...categoriesStore.mapActions([
      'getCategoryData'
    ]),
  },

  // ...authorStore.mapActions([
  //   'getAuthorsData'
  // ]),
  computed: {
    Categories() {
      console.log(this.$store.state.categories)
      console.log(this.form.selected2)
      return this.$store.state.categories
    },
    // Authors() {
    //   return this.$store.state.authors
    // }
  },
  mounted() {
    this.getCategoryData()
  }
}
</script>

<style scoped>

</style>