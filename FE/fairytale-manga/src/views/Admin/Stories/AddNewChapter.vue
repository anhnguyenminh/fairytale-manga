<template>
  <div class="container" style="width: 60%;">
    <div class="d-flex align-items-center ">
      <b-button style="background-color: #f1f1f1" @click="$router.go(-1)">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </b-button>
      <h2 style="margin: 0 1.2rem ;">New Chapter</h2>
    </div>
    <div style="background-color: #f1f1f1; margin: 1.5rem 0 ;padding: 1.25rem 1rem; border-radius: 0.5rem; ">
      <b-form @submit="onSubmit">
        <b-form-group id="input-group-1" label="Chapter" label-for="input-1">
          <b-form-input
              id="input-1"
              v-model="form.name"
              type="number"
              placeholder="Enter chapter number"
              required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-2" label="Upload images">
          <b-form-file
              ref="imgInput"
              multiple
              placeholder="Choose files or drop it here..."
              drop-placeholder="Drop image here..."
              required
          >
          </b-form-file>
        </b-form-group>

        <div style="text-align: center;">
          <b-button class="my-btn" type="submit" variant="success">Upload new chapter</b-button>
        </div>
      </b-form>
    </div>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: 'AddNewChapter',
  data() {
    return {
      form: {
        name: ''
      }
    }
  },
  methods: {
    onSubmit(e) {
      e.preventDefault();
      console.log("Chapter " + this.$refs.imgInput.files.length);
      console.log(this.$refs.imgInput.files);
      let formData = new FormData();
      let totalFiles = this.$refs.imgInput.files.length;

      formData.append("name", this.form.name);
      console.log(this.form.name);
      formData.append("story_id", this.$route.params.id);
      console.log(this.$route.params.id);
      if (this.$refs.imgInput.files) {
        for (let index = 0; index < totalFiles; index++) {
          console.log(this.$refs.imgInput.files[index])
          formData.append("images[]", this.$refs.imgInput.files[index]);
        }
      }
      axios.post(`/admins/chapters`, formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }).then(() => {
        alert("Add new chapter completed!")
        this.$router.push({path: "/admin/stories/update/" + this.$route.params.id})
      }).catch(() => {
        alert("Something wrong happened, please check again!");
        e.preventDefault();
      });
    }

  }
}
</script>

<style scoped>
.my-btn {
  margin: 0 1.5rem;
}

/*.custom-file {*/
/*  height: calc(25em + 0.75rem + 2px);*/
/*}*/

</style>