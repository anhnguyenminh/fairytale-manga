<template>
  <div>
    <section class="vh-100">
      <div class="container">
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
                               placeholder="Nhập vào địa chỉ email" required v-model="email" @keyup="emailValidation" />
                        <span class="error-msg">{{ emailError }}</span>
                      </div>

                      <div class="form-outline">
                        <label class="form-label" for="userPwd">Mật khẩu</label>
                        <input type="password" id="userPwd" class="form-control form-control-lg"
                               placeholder="Nhập vào mật khẩu" required  v-model="password" @keyup="passwordValidation"/>
                        <span class="error-msg">{{ passwordError }}</span>
                      </div>

                      <div class="form-btn">
                        <button class="btn btn-dark" type="button">Đăng nhập</button>
                      </div>

                      <p class="mb-5 pb-lg-2 suggest">Chưa có tài khoản? <a
                          href="#">Đăng kí tại đây</a></p>

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
import axios from 'axios';

export default {
  name: "Login",
  data() {
    return {
      email: '',
      emailError: '',
      password: '',
      passwordError: ''
    };
  },
  methods: {
    emailValidation() {
      if (this.email == null || this.email.length === 0) {
        this.emailError = 'Email can not be empty!!!';
        return false;
      } else {

        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.email)) {
          this.emailError = '';
          return (true);
        }
        this.emailError = "You have entered an invalid email address!";
        return (false)
      }
    },

    passwordValidation() {
      if (this.password == null || this.password.length < 8) {
        this.passwordErrorError = 'Password can not be empty and must be rather than 8 characters!!!';
        return false;
      } else {
        this.passwordErrorError = '';
        return (true);
      }
    }
  }

};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->

<style scoped>
* {
  font-family: 'Alegreya', serif;
  color: black;
}

.form-control:focus {
  border-color: black !important;
  box-shadow: none;
}

section {
  /*background-color: #9A616D;*/
  background: url('http://storage.googleapis.com/cheritz/msg/images/general/bg.png') no-repeat top center fixed;
  color: white;
  background-size: cover;
}

.container {
  padding-top: 3rem;
  padding-bottom: 3rem;
  height: 100%;
}

.wrapped-card {
  display: flex;
  justify-content: center;
  height: 100%;
  align-items: center !important;
}

.wrapped-card .card {
  border-radius: 1rem;
  background: linear-gradient(120deg, #BF953F, #FCF6BA, #B38728, #FBF5B7, #AA771C);
}

.card-image {
  border-radius: 1rem 0 0 1rem;
  max-width: 100%;
  height: 100%;
}

.card-details {
  display: flex;
  align-items: center;
}

.card-body {
  color: black;
  opacity: 1;
}

.fairytale-wrapper {
  padding-bottom: 0.25rem;
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
}

.fairytale-wrapper span {
  font-weight: 700;
  margin-bottom: 0;
  font-size: calc(1.375rem + 1.5vw);
}

h5 {
  letter-spacing: 1px;
  font-weight: 600;
  padding-bottom: 1rem;
  margin-bottom: 1rem;
}

.form-outline {
  margin-bottom: 1.5rem
}

.form-outline label {
  font-size: 1.25rem;
  font-weight: 500;
}

.form-btn {
  padding-top: 0.25rem;
  margin-bottom: 1.5rem
}

.form-btn button {
  width: -webkit-fill-available;
}

.suggest {
  color: #393f81;
  font-weight: 500;
}

p a {
  color: #393f81;
}

.error-msg{
  color: darkred;
}
</style>
