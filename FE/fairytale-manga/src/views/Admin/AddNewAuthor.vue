<template>
  <div class="container" style="width: 60%; height: auto; margin-bottom: 2rem;">
    <div class="d-flex align-items-center ">
      <b-button style="background-color: #f1f1f1" @click="goBack">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </b-button>
      <h2 style="margin: 0 1.2rem ;">Create New Author</h2>
    </div>
    <div style="background-color: #f1f1f1; margin: 1.5rem 0 ;padding: 1.25rem 1rem; border-radius: 0.5rem; ">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <b-form-group id="input-group-1" label="Author" label-for="input-1">
          <b-form-input
              id="input-1"
              v-model="form.name"
              type="text"
              placeholder="Author's name..."
              required
          ></b-form-input>
        </b-form-group>

        <b-form-group id="input-group-2" label="Description" label-for="textarea">
          <b-form-textarea
              id="textarea"
              v-model="form.description"
              placeholder="Short description about the author..."
              rows="3"
              max-rows="6"
          ></b-form-textarea>
        </b-form-group>

        <div style="text-align: center;">
          <b-button class="my-btn" type="reset" variant="info">Reset</b-button>
          <b-button class="my-btn" type="submit" variant="success">Save</b-button>
        </div>
      </b-form>
    </div>
    <b-card class="mt-3" header="Preview Data">
      <p class="m-0 font-weight-bold">Author's name: {{ form.name }}</p>
      <p class="m-0 font-weight-bold">Description: {{ form.description }}</p>
    </b-card>
  </div>
</template>

<script>

export default {
  name: 'AddNewCategory',
  data() {
    return {
      form: {
        name: '',
        description: ''
      },
      show: true
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      alert("Submit data completed!")
      this.$router.push({path: "/admin/authors"})
    },
    onReset(event) {
      event.preventDefault()
      // Reset our form values
      this.form.name = ''
      this.form.description = ''
      // Trick to reset/clear native browser form validation state
      this.show = false
      this.$nextTick(() => {
        this.show = true
      })
    },
    goBack(){
      this.$router.push({path: "/admin/authors"})
    }
  }
}
</script>

<style scoped>
.my-btn {
  margin: 0 1.5rem;
}
</style>