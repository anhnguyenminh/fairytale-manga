<template>
  <div class="container" style="width: 60%; ">
    <div class="d-flex align-items-center ">
      <b-button style="background-color: #f1f1f1" @click="goBack">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </b-button>
      <h2 style="margin: 0 1.2rem ;">Create New Gift</h2>
    </div>
    <div style="background-color: #f1f1f1; margin: 1.5rem 0 ;padding: 1.25rem 1rem; border-radius: 0.5rem; ">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group id="input-group-1" label="Title" label-for="input-1">
          <b-form-input
              id="input-1"
              v-model="form.name"
              type="text"
              placeholder="Gift name..."
              required
          ></b-form-input>
        </b-form-group>
        <div style="display: flex;">
          <b-form-group id="input-group-2" label="Score to Achieved" label-for="input-2">
            <b-form-input
                id="input-2"
                v-model="form.score"
                type="number"
                placeholder="10.000..."
                required
            ></b-form-input>
          </b-form-group>
          <b-form-group id="input-group-3" label="Number in Stock" label-for="input-3" style="margin-left: 5rem;">
            <b-form-input
                id="input-3"
                v-model="form.stock"
                type="number"
                placeholder="1"
                required
            ></b-form-input>
          </b-form-group>
        </div>
        <b-form-group id="input-group-1" label="Select image" label-for="input-1">
          <b-form-file
              ref="imgInput"
              placeholder="Choose file or drop it here..."
              drop-placeholder="Drop image here..."
              required
          >
          </b-form-file>
        </b-form-group>
        <div style="text-align: center;">
          <b-button class="my-btn" type="reset" variant="info">Reset</b-button>
          <b-button class="my-btn" type="submit" variant="success">Save</b-button>
        </div>
      </b-form>
    </div>
    <b-card class="mt-3" header="Preview Data">
      <p class="m-0 font-weight-bold">Name: {{ form.name }}</p>
      <p class="m-0 font-weight-bold">Score: {{ form.score }}</p>
      <p class="m-0 font-weight-bold">Stock: {{ form.stock }}</p>
    </b-card>
  </div>
</template>

<script>

import axios from "@/plugins/axios";

export default {
  data() {
    return {
      form: {
        name: '',
        score: '',
        stock: ''
      },
      show: true
    }
  },
  methods: {
    onSubmit(e) {
      console.log(this.$refs.imgInput.files);
      let formData = new FormData();
      formData.append("name", this.form.name);
      formData.append("score", this.form.score);
      formData.append("stock", this.form.stock);
      if (this.$refs.imgInput.files[0]) formData.append("image", this.$refs.imgInput.files[0]);
      e.preventDefault();
      axios.post(`/admins/gifts`, formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      }).then(() => {
        // this.$refs.imgInput.value = ''
        alert("Add gift successfully!")
        this.$router.push({path: "/admin/gifts"})
        // e.preventDefault();
      }).catch(() => {
        alert("something wrong happen !");
        e.preventDefault();
      });
    },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.name = ''
      this.form.score = ''
      this.form.stock = ''
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    },
    goBack() {
      this.$router.push({path: "/admin/gifts"})
    }
  }
}
</script>

<style scoped>
.my-btn {
  margin: 0 1.5rem;
}
</style>