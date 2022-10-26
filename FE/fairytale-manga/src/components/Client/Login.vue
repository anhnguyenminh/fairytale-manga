<template>
  <div>
    <section class="vh-100">
      <div class="container wrapped-container">
        <div class="row wrapped-card">
          <div class="col col-xl-10">
            <div class="card">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img src="https://i.pinimg.com/564x/07/2e/5e/072e5ea3323de9dc0b6256058c70ef99.jpg"
                       alt="login form" class="card-image"/>
                </div>
                <div class="col-md-6 col-lg-7 card-details">
                  <div class="card-body p-4 p-lg-5">
                    <form>
                      <div class="fairytale-wrapper">
                        <span>Fairytale Manga</span>
                      </div>
                      <h5>Đăng nhập tài khoản của bạn</h5>
                      <div class="form-outline">
                        <label class="form-label" for="userEmail">Email</label>
                        <input type="email" id="userEmail" class="form-control form-control-lg"
                               placeholder="Nhập vào địa chỉ email" v-model="email" @keyup="emailValidation" required/>

                      </div>

                      <div class="form-outline">
                        <label class="form-label" for="userPwd">Mật khẩu</label>
                        <input type="password" id="userPwd" class="form-control form-control-lg"
                               placeholder="Nhập vào mật khẩu" v-model="password" @keyup="passwordValidation" required/>

                      </div>

                      <div class="form-btn">
                        <button class="btn btn-dark" type="submit" @click.prevent="userAuthenticate">Đăng nhập</button>
                      </div>

                      <p class="mb-4 pb-lg-2 suggest">Chưa có tài khoản?
                        <router-link :to="{ name: 'RegisterView' }" tag="a"
                        >Đăng kí tại đây
                        </router-link>
                      </p>
                      <span class="error-msg">{{ error }}</span>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
import axios from '@/plugins/user_axios';

export default {
  name: "Login",
  data() {
    return {
      error: '',
      email:'',
      password:''
    };
  },
  created() {
    if(this.$store.state.user_token){
      this.$router.push("/")
    }
  },
  methods: {
    emailValidation() {
      if (this.email == null || this.email.length === 0) {
        this.error = 'Email can not be empty!!!';
        return false;
      } else {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.email)) {
          this.error = '';
          return (true);
        }
        this.error = "You have entered an invalid email address!";
        return (false)
      }
    },
    passwordValidation() {
      if (this.password == null || this.password.length < 8) {
        this.error = 'Password can not be empty and must be rather than 8 characters!!!';
        return false;
      } else {
        this.error = '';
        return (true);
      }
    },

    userAuthenticate(event){
      event.preventDefault();
      let self = this;
      axios.post('readers/sessions', {
        email: this.email,
        password: this.password
      })
          .then(function (response) {
            console.log(response);
            //get data lately here
            if (response.status == 200) {
              self.$router.push({path: "/"})
              console.log("You are here");
              self.$store.commit("setUserToken", response.data.token)
              console.log(response.data.token)
            }
          })
          .catch(function (error) {
            alert(error.response.data.validation)
            console.log(error);
            // alert("There is something wrong, please check again !!!");
          });

    }
  }

};
</script>

<style scoped>
@import url(@/assets/css/login.css);
</style>
