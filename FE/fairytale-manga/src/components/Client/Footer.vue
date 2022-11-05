<template>
  <div>
    <footer style="background-color: #292929; color: white;">
      <div class="container-fuild footer">
        <div class="container footer-content" style="padding: 1em 0;">
          <div class="row">
            <div class="col-md-4 col-sm-12">
              <h2 class="h2-footer">GIỚI THIỆU</h2>
              <div class="line-h2-footer"></div>
              <p class="small-footer-p"><b>Fairytale Manga</b> - Đọc Truyện Online Miễn Phí | Truyện Hay. Truyện
                Mới. Website luôn cập nhập những bộ truyện mới nhất thuộc các thể loại đặc sắc như
                truyện tiên hiệp, kiếm hiệp, truyện teen, tiểu thuyết ngôn tình hay nhất.</p>
            </div>
            <div class="col-md-4 col-sm-12">
              <h2 class="h2-footer">HỖ TRỢ</h2>
              <div class="line-h2-footer"></div>
              <p class="small-footer-p"><b>Điều khoản sử dụng</b><br>
                Tất cả nội dung trên website của chúng tôi (Nội dung) đều được tổng hợp từ các nguồn
                công khai trên Internet và được đọc miễn phí. Nếu bạn muốn sử dụng, yêu cầu ghi rõ nguồn
                tổng hợp từ chúng tôi. Nếu sử dụng với mục đích kinh doanh, yêu cầu tìm hiểu kỹ về bản
                quyền nội dung. Việc vi phạm bản quyền sẽ được xử lý theo quy định.</p>
            </div>
            <div class="col-md-4 col-sm-12">
              <h2 class="h2-footer">LIÊN HỆ</h2>
              <div class="line-h2-footer"></div>
              <p class="small-footer-p"><a style=" color: #f6e58d;"
                                           href="https://qmanga3.net/chinh-sach-bao-mat" target="_blank">Chính sách
                riêng
                tư</a></p>
              <p class="small-footer-p">Email: <a style="color: #f6e58d;"
                                                  href="mailto:fairytale.manga@gmail.com">fairytale.manga@gmail.com</a>
              </p>
              <p class="small-footer-p">Fanpage: <a style="color: #f6e58d;"
                                                    href="https://www.facebook.com/QMG2-Sở-thú-ăn-tạp-109474538240392"
                                                    target="_blank">https://www.facebook.com/hoadoquyenno12</a></p>
            </div>
          </div>
        </div>
      </div>

      <div class="container-fuild bottom-footer text-center" style="background-color: black;padding-top: 2em;">
        <a href="#" class="logo-bottom"><img src="@/assets/images/logo-while.png"
                                             style="max-width: 100%;" class="img-responsive"></a>
        <h2 style="font-size: 1.75rem;">Fairytale Manga</h2>
        <span>Quality - Quickly - Quantity</span>
        <p style="margin-bottom:0 !important;" class="container copyright">Copyright © 2022 Fairytale Manga. All
          Right
          Reserved </p>
      </div>
    </footer>

  </div>
</template>
<script>
export default {
  name: "Footer",
  data() {
    return {};
  }, method: {}
}
</script>

<style scoped>
a {
  text-decoration: none;
}

a:hover {
  color: #f1c40f !important;
}

.bottom-footer .logo-bottom {
  width: 120px;
  margin: 0 auto;
  display: block;
}

.bottom-footer span,
.copyright {
  display: block;
  text-align: center;
}

.bottom-footer span {
  color: #fff;
  width: 300px;
  margin: 8px auto;
  font-size: 20px;
}

.copyright {
  font-size: 14px;
  color: #ccc;
  line-height: 50px;
  border-top: 1px solid #3e3e3e;
}

.line-h2-footer {
  display: block;
  width: 40%;
  /*width: 25%;*/
  height: 2px;
  background: #f1c40f;
  margin-bottom: 8px;
}

h2.h2-footer {
  font-size: 20px;
}
</style>