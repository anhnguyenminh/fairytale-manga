<template>
  <div>
    <div class="wrapper d-flex flex-column container">
      <div class="header">
        <div class="container-fluid d-flex align-items-center flex-wrap justify-content-between">
          <div
              class="page-title d-flex flex-column align-items-start justify-content-center flex-wrap me-2 pb-5 pb-lg-0 pt-7 pt-lg-0">
            <h3 class="d-flex flex-column text-dark fw-bold my-0">Overview</h3>
          </div>
        </div>
      </div>
      <div class="admin-wrapped-content d-flex flex-column">
        <div class="container-fluid">
          <div class="card mb-3">
            <div class="card-body pb-0">
              <div class="d-flex flex-wrap flex-sm-nowrap">
                <div class="avt-admin">
                  <div class="symbol position-relative">
                    <img class="symbol-avt"
                         src="https://preview.keenthemes.com/metronic8/demo15/assets/media/avatars/300-1.jpg"
                         alt="image">
                  </div>
                </div>
                <div class="flex-grow-1">
                  <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                    <div class="d-flex flex-column">
                      <div class="d-flex align-items-center mb-2">
                        <div class="username-admin">{{ form.username }}</div>
                      </div>
                      <div class="position-admin d-flex flex-wrap">
                        <div>Administrator</div>
                      </div>
                      <div class="position-admin d-flex flex-wrap">
                        <div>Email: <b>{{ form.email }}</b>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex">
                      <button class="btn btn-sm btn-light me-2" @click="editProfile">
                        <span class="indicator-label">Edit</span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--category-->
      <div class="container-fluid" v-if="show">

        <div style="background-color: #fafafa; margin: 1.5rem 0 ;padding: 1.25rem 1rem; border-radius: 0.5rem; ">
          <b-form @submit="onSubmit">
            <b-form-group id="input-group-1" label="Username" label-for="admin-username">
              <b-form-input
                  id="admin-username"
                  v-model="form.username"
                  type="text"
                  placeholder="Enter username"
                  required
              ></b-form-input>
            </b-form-group>

            <b-form-group id="input-group-2" label="Email" label-for="admin-email">
              <b-form-input
                  id="admin-email"
                  v-model="form.email"
                  type="email"
                  placeholder="Enter email"
                  required
              ></b-form-input>
            </b-form-group>
            <b-form-group id="input-group-2" label="Old Password" label-for="admin-email">
              <b-form-input
                  id="admin-email"
                  v-model="form.oldPassword"
                  type="password"
                  placeholder="Please enter old password"
                  autocomplete="off"
                  required
              ></b-form-input>
            </b-form-group>
            <b-form-group id="input-group-2" label="New Password" label-for="admin-email">
              <b-form-input
                  id="admin-email"
                  v-model="form.password"
                  type="password"
                  placeholder="Please enter new password"
                  autocomplete="off"
              ></b-form-input>
            </b-form-group>
            <b-form-group id="input-group-2" label="Re-Enter New Password" label-for="admin-email">
              <b-form-input
                  id="admin-email"
                  v-model="form.reEnterPwd"
                  type="password"
                  placeholder="Re-enter new password"
                  autocomplete="off"
              ></b-form-input>
            </b-form-group>

            <div style="text-align: center;">
              <b-button class="my-btn" type="submit" variant="outline-success">Save profile</b-button>
            </div>
          </b-form>
        </div>

      </div>

    </div>

  </div>
</template>
<script>

import axios from "@/plugins/axios";

export default {
  name: 'AdminProfile',
  data() {
    return {
      form: {
        username: '',
        email: '',
        password: '',
        oldPassword: '',
        reEnterPwd: ''
      },
      show: false
    }
  },
  methods: {
    editProfile() {
      this.show = true;
    },
    onSubmit(event) {
      event.preventDefault()
      axios.put('admins/admins/update_admin/', this.form)
          .then((res) => {
            //Perform Success Action
            alert("Update profile completed!")
            this.show = false
          })
          .catch((error) => {
            event.preventDefault();
            alert("Wrong password, please try again !!!")
            // error.response.status Check status code
          })
    }
  },
  created() {
    let self = this;
    axios.get('admins/admins/show_current_admin/')
        .then(function (response) {
          // handle success
          self.form.username = response.data.username
          self.form.email = response.data.email
          // console.log(response);
        })
        .catch(function (error) {
          // handle error
          console.log(error);
        })
        .finally(function () {
          // always executed
        });
  }
}
</script>

<style scoped>
@import url(@/assets/css/admin-profile.css);
</style>