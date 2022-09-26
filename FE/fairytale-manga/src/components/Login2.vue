<template>
  <div>
    <section class="vh-100">
      <div class="container">
        <div class="row wrapped-card">
          <div class="col col-xl-10">
            <div class="card">
              <div class="row g-0">
                <div class="col-md-6 col-lg-5 d-none d-md-block">
                  <img src="https://i.pinimg.com/564x/c2/70/ed/c270edfd62cb6fd905e48dea39b04a5e.jpg"
                       alt="login form" class="card-image"/>
                </div>


                <div class="col-md-6 col-lg-7 card-details">
                  <div class="card-body p-4 p-lg-5">
                    <form>
                      <div class="fairytale-wrapper">
                        <span>Fairytale Manga</span>
                      </div>
                      <h5> Đăng nhập tài khoản của bạn</h5>
                      <div class="form-outline">
                        <label class="form-label" for="userEmail">Email</label>
                        <input type="email" id="userEmail" class="form-control form-control-lg"
                               placeholder="Nhập vào địa chỉ email"/>

                      </div>

                      <div class="form-outline">
                        <label class="form-label" for="userPwd">Mật khẩu</label>
                        <input type="password" id="userPwd" class="form-control form-control-lg"
                               placeholder="Nhập vào mật khẩu" required/>
                      </div>

                      <div class="form-btn">
                        <button class="btn btn-dark" type="button">Đăng nhập</button>
                      </div>

                      <p class="mb-5 pb-lg-2 suggest">Chưa có tài khoản? <router-link :to="{ name: 'RegisterView' }" tag="a"
                      >Đăng kí tại đây</router-link></p>

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
  name: "Login2",
  data() {
    return {};
  },
  methods: {},
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
</style>
