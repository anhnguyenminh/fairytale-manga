<template>
  <div>
    <section class="vh-100" style="background-color: #6959CD;">
      <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5">
            <div class="card shadow-2-strong" style="border-radius: 1rem;">
              <div class="card-body p-5 text-center">

                <h3 class="mb-5">Login</h3>

                <div class="form-outline mb-4">
                  <input type="email" class="form-control form-control-lg" v-model.lazy="admin.adminEmail"
                         placeholder="Email" required/>
                </div>

                <div class="form-outline mb-4">
                  <input type="password" class="form-control form-control-lg" v-model.lazy="admin.adminPwd"
                         placeholder="Password" required/>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-start mb-4">
                  <input class="form-check-input" type="checkbox" value="" id="rememberPwd"/>
                  <label class="form-check-label" for="rememberPwd"> Remember password</label>
                </div>

                <button class="btn btn-primary btn-lg" type="submit" style="width:-webkit-fill-available;"
                        @click.prevent="adminAuthenticate()">Login
                </button>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
import axios from "axios";

export default {
  name: 'AdminLogin',
  data() {
    return {
      admin: {
        adminEmail: '',
        adminPwd: ''
      }
    }
  },
  methods: {

    adminAuthenticate() {
      axios.post('http://localhost:3000/api/v1/admins/sessions', {
        email : this.admin.adminEmail,
        password : this.admin.adminPwd
      })
          .then(function (response) {
            console.log(response);
            //get data lately here
          })
          .catch(function (error) {
            console.log(error);
            alert("Something went wrong, please check again!!!");
          });
    }

  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
