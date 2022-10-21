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
            <br><br>
            <div class="btn-bottom">
              <b-button class="my-btn" type="submit" variant="outline-success">Add new story</b-button>
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
            <div class="wrapped-image" >
                <b-form-file
                    ref="imgInput"
                    placeholder="Choose file or drop it here..."
                    drop-placeholder="Drop image here..."
                    required
                >
                </b-form-file>
            </div>
          </div>

        </div>

    </div>
    </b-form>

  </div>
</template>

<script>
import axios from "@/plugins/axios";

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
        status: [
          {value: false, text: 'On going'},
          {value: true, text: 'Ended'}
        ],
        selectedCategory: [], // list categories
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
    onSubmit(e) {
    console.log(this.$refs.imgInput.files);
      let formData = new FormData();
      formData.append("name", this.form.name);
      formData.append("author_id", this.form.author_id);
      formData.append("description", this.form.description);
      formData.append("end", this.form.end);
      formData.append("categories_id", JSON.stringify(this.form.selectedCategory));
      if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
      e.preventDefault();
      axios.post(`/admins/stories`, formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }).then(() => {
        alert("Add new story successfully!")
        this.$router.push({path: "/admin/stories"})
      }).catch(() => {
        alert("Something wrong happened, please check again!");
        e.preventDefault();
      });
    }
  },
  computed: {
    Categories() {
      console.log("Categories selected:" + this.form.selectedCategory)
      return this.$store.state.categories
    },
    Authors() {
      console.log("Author selected:" + this.form.author_id)
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