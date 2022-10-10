<template>
  <div>
    <section class="vh-100">
      <div class="container">
        <div class="row wrapped-card">
          <div class="col col-xl-10">
            <div class="card">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img
                      src="https://i.pinimg.com/564x/0f/f3/e1/0ff3e1200fe31d8bb7e1a8e5efadfceb.jpg"
                      alt="register form" class="card-image"/>
                </div>
                <div class="col-md-6 col-lg-7 card-details">
                  <div class="card-body p-4 p-lg-5">

                    <form>
                      <div class="fairytale-wrapper">
                        <span>Fairytale Manga</span>
                      </div>
                      <h5>Đăng kí tài khoản mới</h5>
                      <div class="form-outline">
                        <label class="form-label" for="registEmail">Email</label>
                        <input type="email" id="registEmail" class="form-control form-control-lg"
                               placeholder="Nhập vào địa chỉ email" required v-model="email" @keyup="emailValidation"/>
                        <span class="error-msg">{{ emailError }}</span>
                      </div>

                      <div class="form-outline">
                        <label class="form-label" for="registPwd">Mật khẩu</label>
                        <input type="password" id="registPwd" class="form-control form-control-lg"
                               placeholder="Nhập vào mật khẩu" required/>
                        <span class="error-msg">{{ passwordError }}</span>

                      </div>

                      <div class="form-outline">
                        <label class="form-label" for="reRegistPwd">Nhập lại mật khẩu</label>
                        <input type="password" id="reRegistPwd" class="form-control form-control-lg"
                               placeholder="Nhập lại mật khẩu" required/>
                        <span class="error-msg">{{ rePwdError }}</span>

                      </div>

                      <div class="form-btn">
                        <button class="btn btn-dark" type="button">Đăng kí</button>
                      </div>

                      <p class="suggest">Đã có tài khoản?
                        <router-link :to="{ name: 'LoginView' }" tag="a">Đăng nhập tại đây</router-link>
                      </p>

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
export default {
  name: 'Register2',
  data() {
    return {
      email: '',
      emailError: '',
      rePwdError: '',
      passwordError: ''
    }
  },
  methods: {
    emailValidation() {
      if (this.email == null || this.email.length === 0) {
        this.emailError = 'Email can not be empty';
        return false;
      } else {

        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(this.email)) {
          this.emailError = '';
          return (true);
        }
        this.emailError = "You have entered an invalid email address!";
        return (false)
      }
    }
  }

}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

section {
  /*background-color: #9A616D;*/
  background: linear-gradient(210deg, #ffdde1, #ee9ca7, #9A616D);
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
  background: linear-gradient(210deg, #ffdde1, #F2F3F2, #ffdde1);
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

.error-msg {
  color: firebrick;
  font-weight: 500;
}

* {
  font-family: 'Alegreya', serif;
  color: black;
}

.form-control:focus {
  border-color: black !important;
  box-shadow: none;
}
</style>
