<template>
  <div class="container">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/stories/'}" class="btn go-back" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 class="page-header">Add New Story</h2>
    </div>
    <b-form @submit="onSubmit">
    <div class="wrap-body">
      <!--      left-->

        <div class="left-side">

          <div class="content">


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
              <b-form-select v-model="form.author_id" :options="Authors.options"></b-form-select>
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
            <b-form-group label="Description" label-for="textarea">
              <b-form-textarea
                  id="textarea"
                  v-model="form.description"
                  placeholder="Enter short summary for this story"
                  rows="3"
                  max-rows="6"
                  required
              ></b-form-textarea>
            </b-form-group>


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
                <b-form-select v-model="form.end" :options="form.status"></b-form-select>
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
    </b-form>

  </div>
</template>

<script>
import axios from "@/plugins/axios";

require('@/assets/css/story.css')
import {createNamespacedHelpers} from "vuex";

const categoriesStore = createNamespacedHelpers("categories");
const authorsStore = createNamespacedHelpers("authors");
export default {
  name: 'AddNewStory',
  data() {
    return {
      form: {
        name: '',
        author_id: null,
        description: '',
        end: null,
        file1: null,
        status: [
          {value: 0, text: 'On going'},
          {value: 1, text: 'Ended'}
        ],
        selected2: [], // Must be an array reference!
      }
    }
  },
  methods: {
    ...categoriesStore.mapActions([
      'getAllCategories'
    ]),
    ...authorsStore.mapActions([
      'getAllAuthors'
    ]),
    onSubmit(event) {
      event.preventDefault()
      console.log(this.form)
      axios.post('admins/stories', this.form)
          .then((res) => {
            //Perform Success Action
            alert("Add new story completed!")
            this.$router.push({path: "/admin/stories/"})
          })
          .catch((error) => {
            // error.response.status Check status code
          })
    }
  },
  computed: {
    Categories() {
      // console.log(this.$store.state.categories)
      console.log("Categories selected:" + this.form.selected2)
      return this.$store.state.categories
    },
    Authors() {
      // console.log(this.$store.state.authors)
      console.log("Author selected:" + this.form.selected)
      return this.$store.state.authors
    }
  },
  mounted() {
    this.getAllCategories(),
        this.getAllAuthors()
  }
}
</script>

<style scoped>

</style>