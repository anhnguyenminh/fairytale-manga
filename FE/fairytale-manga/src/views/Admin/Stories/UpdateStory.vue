<template>
  <div class="container">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/stories/'}" class="btn go-back" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 class="page-header">Story Detail</h2>
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
                  v-model="form.selectedCategory"
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
                <router-link class="btn btn-success"
                             :to="{ path: '/admin/stories/'+ this.$route.params.id +'/new-chapter' }"
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
                      <th class="col-2">ID</th>
                      <th class="col-5">Chapter</th>
                      <th class="col-5 col-last">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="chap in chapter" :key="chap.id">
                      <td class="col-2">{{ chap.id }}</td>
                      <td class="col-5">{{ chap.name }}</td>
                      <td class="col-5 ">
                        <div class="d-flex justify-content-end actions">
                          <button class="btn btn-info">Details</button>
                          <button class="btn btn-danger">Delete</button>
                        </div>
                      </td>
                    </tr>

                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="content">

            <div class="btn-bottom">
              <b-button class="my-btn" type="reset" variant="outline-danger" @click="deleteStory($route.params.id)">
                Delete this story
              </b-button>
              <b-button class="my-btn-submit" type="submit" variant="outline-success">Save story</b-button>
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
            <div>
              <h6>Cover image</h6>
            </div>
            <div class="wrapped-image">
              <b-form-file
                  ref="imgInput"
                  placeholder="Choose file or drop it here..."
                  drop-placeholder="Drop image here..."
              >
              </b-form-file>
            </div>
          </div>
          <div class="content">
            <div>
              <h6>Preview</h6>
            </div>
            <div class="wrapped-image d-flex justify-content-center">
              <b-img :src="form.images_url" fluid alt="Responsive image"></b-img>
            </div>
          </div>
        </div>

      </div>
    </b-form>

  </div>
</template>

<script>
import axios from "@/plugins/axios";

// require('@/assets/css/story.css')
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
        images_url:'',
        end: null,
        status: [
          {value: false, text: 'On going'},
          {value: true, text: 'Ended'}
        ],
        selectedCategory: [], // list categories
      },
      chapter: {
      }
    }
  },
  created() {
    // console.log(this.$route.params.id)
    let self = this;
    axios.get('admins/stories/' + this.$route.params.id)
        .then(function (response) {
          // handle success
          // console.log(response.data.category)
          // console.log(response.data.status)
          self.form.name = response.data.name
          self.form.author_id = response.data.author_id
          self.form.description = response.data.description
          self.form.end = response.data.status
          self.form.images_url = response.data.image_url
          self.form.selectedCategory = response.data.category.map(item => {
            return item.id
          })
          console.log(response);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
    axios.get('admins/stories/' + this.$route.params.id + '/show_list_chapters')
        .then(function (response) {
          // handle success
          self.chapter = response.data
          // console.log(response.data);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        });
  },
  methods: {
    ...categoriesStore.mapActions([
      'getAllCategories'
    ]),
    ...authorsStore.mapActions([
      'getAllAuthors'
    ]),
    onSubmit(e) {
      console.log(this.$refs.imgInput.files);
      let formData = new FormData();
      formData.append("name", this.form.name);
      // console.log(this.form.name)
      formData.append("author_id", this.form.author_id);
      // console.log(this.form.author_id)
      formData.append("description", this.form.description);
      // console.log(this.form.description)
      formData.append("end", this.form.end);
      // console.log(this.form.end)
      formData.append("categories_id", JSON.stringify(this.form.selectedCategory));
      // console.log(this.form.selectedCategory)
      if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
      e.preventDefault();
      axios.put(`/admins/stories/` + this.$route.params.id, formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }).then(() => {
        alert("Update story successfully!")
        this.$router.push('/admin/stories')
      }).catch(() => {
        alert("Something wrong happened, please check again!");
        e.preventDefault();
      });
    },
    deleteStory(id) {
      if (confirm('Are you sure you want to delete this story? (All chapters of this story will be delete completely)')) {
        // Delete it!
        axios.delete(`admins/stories/${id}`)
            .then(response => {
              alert("Delete successfully")
              this.$router.push("/admin/stories/")
            })
            .catch(function (error) {
              console.log(error.response)
            })
        console.log('Thing was deleted.');
      } else {
        // Do nothing!
        console.log('Thing was not deleted.');
      }
    },
    deleteChapter(id) {
      if (confirm('Are you sure you want to delete this chapter?')) {
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
      // console.log("Categories selected:" + this.form.selectedCategory)
      return this.$store.state.categories
    },
    Authors() {
      // console.log("Author selected:" + this.form.author_id)
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

@import url(@/assets/css/story.css);
</style>