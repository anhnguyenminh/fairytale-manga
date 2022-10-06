<template>
  <div class="container" style="width: 60%; height: auto; margin-bottom: 2rem;">
    <div class="d-flex align-items-center ">
      <b-button style="background-color: #f1f1f1" @click="goBack">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </b-button>
      <h2 style="margin: 0 1.2rem ;">New Chapter</h2>
    </div>
    <div style="background-color: #f1f1f1; margin: 1.5rem 0 ;padding: 1.25rem 1rem; border-radius: 0.5rem; ">
      <b-form @submit="onSubmit" v-if="show">
        <b-form-group id="input-group-1" label="Chapter name" label-for="input-1">
          <b-form-input
              id="input-1"
              v-model="form.name"
              type="text"
              placeholder="Chapter 21..."
              required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-2" label="Upload images">
          <b-form-file
              v-model="form.files"
              multiple
              :state="Boolean(form.files)"
              placeholder="Choose files or drop it here..."
              drop-placeholder="Drop files here..."
          ></b-form-file>

          Selected files
          <div v-for="file in form.files" :key="file.name">
            <div>{{ file.name }}</div>
          </div>
        </b-form-group>

        <div style="text-align: center;">
          <b-button class="my-btn" type="submit" variant="success">Upload new chapter</b-button>
        </div>
      </b-form>
    </div>
    <b-card class="mt-3" header="Preview">
      <!--      Something to preview here-->
    </b-card>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: 'AddNewChapter',
  data() {
    return {
      form: {
        name: '',
        files: []
      },
      show: true
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      axios.post('admins/chapters', this.form)
          .then((res) => {
            //Perform Success Action
            alert("Add new chapter completed!")
            this.$router.push({path: "/admin/stories/ten-truyen/update/1"})
          })
          .catch((error) => {
            // error.response.status Check status code
          })
    },
    goBack() {
      this.$router.push({path: "/admin/stories/ten-truyen/update/1"})
    }
  }
}
</script>

<style scoped>
.my-btn {
  margin: 0 1.5rem;
}

.custom-file {
  height: calc(25em + 0.75rem + 2px);
}

</style>