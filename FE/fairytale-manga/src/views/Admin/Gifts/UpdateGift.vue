<template>
  <div class="container" style="width: 60%; ">
    <div class="d-flex align-items-center ">
      <router-link :to="{path: '/admin/gifts/'}" class="btn" style="background-color: #f1f1f1" tag="button">
        <b-icon variant="dark" icon="arrow-left"></b-icon>
      </router-link>
      <h2 style="margin: 0 1.2rem ;">Update Gift</h2>
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
import {createNamespacedHelpers} from "vuex";

const {mapActions} = createNamespacedHelpers("gifts");
import axios from "@/plugins/axios";

export default {
  name: 'UpdateGift',
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
  created() {
    // console.log(this.$route.params.id)
    let self = this;
    axios.get('admins/gifts/' + this.$route.params.id)
        .then(function (response) {
          // handle success
          self.form.name = response.data.name
          self.form.score = response.data.score
          self.form.stock = response.data.stock
          // console.log(response);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        })
        .finally(function () {
          // always executed
        });
  },
  methods: {
    onSubmit(event) {
      event.preventDefault()
      axios.put('http://localhost:3000/api/v1/admins/gifts/' + this.$route.params.id, this.form)
          .then((res) => {
            //Perform Success Action
            alert("Update item completed!")
            this.$router.push({path: "/admin/gifts"})
          })
          .catch((error) => {
            // error.response.status Check status code
          })
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