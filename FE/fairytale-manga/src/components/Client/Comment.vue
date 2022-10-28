<template>
  <div class="container comment-area">
    <div class="load-comment-content" style="padding: 0 15px">
      <ul class="nav nav-tabs main-tab">
        <li class="comment-active">
          <a data-toggle="tab" href="#nt_comments">
            <i class="fa fa-comments"></i> <span class="text-uppercase">Bình luận</span> (<span class="comment-count">430</span>)
          </a>
        </li>
      </ul>
      <div class="body-content-comment-area">
        <form action="" id="form-comment">
          <input type="hidden" name="manga_vote_url" value="https://qmanga3.net/set-vote">
          <input type="hidden" name="manga_bookmark_url" value="https://qmanga3.net/set-bookmark">
          <input type="hidden" name="manga_bookmark_chapter_url" value="https://qmanga3.net/set-bookmark-chapter">
          <input type="hidden" name="manga_id" value="13595">
          <input type="hidden" name="action_comment" value="https://qmanga3.net/chuc-nang-binh-luan">
          <input type="hidden" name="comment_id">
          <input type="hidden" name="chapter_id">
          <div class="form-group">
              <textarea class="form-control comment-content" id="comment-content" rows="5" name="content"
                        placeholder="Nhập nội dung bình luận ..."></textarea>
          </div>
          <div class="form-group btn-submit">
            <button type="submit" class="btn-more btn-submit-comment"> Gửi</button>
          </div>
          <div id="comment-message-alert"></div>

        </form>
      </div>
      <!--        body comment-->
      <div class="content-comment">
        <ul class="ul-content-comment">
          <li class="single-comment" id="commentID114822">
            <div class="image-li-content-comment">
              <img class=" lazyloaded" src="https://graph.facebook.com/v3.0/1104705490285804/picture?type=normal">
            </div>
            <div class="content-li-content-comment">
              <div class="three-dots-comments">
                <span>...</span>
                <div class="action-three-dots-comments">
                  <p data-type="report">Báo cáo</p>
                  <p data-type="delete">Xóa</p>
                </div>
              </div>
              <!--                user comment-->
              <div class="h3-span-content-li-content-comment">
                <h3>Ellen Phạm </h3>
                <span class="chapter-comment">Chapter 7.2</span>
                <span>2021/12/27 23:30</span>
              </div>
              <!--                body-comment-->
              <span class="summary-content-li-content-comment">má plot này quả thực chưa nghĩ đến</span>
              <a class="reply">Trả lời</a>
              <!--                href="javascript:;" onclick="replyComment(`114822`, `@Ellen Phạm`, `1447`)" -->
            </div>
            <div class="replyComment" id="replyCommentID114822"></div>
          </li>

          <!--            second comment-->
          <li class="single-comment" id="commentID114812">
            <div class="image-li-content-comment">
              <img class=" lazyloaded" src="https://graph.facebook.com/v3.0/1104705490285804/picture?type=normal">
            </div>
            <div class="content-li-content-comment">
              <div class="three-dots-comments">
                <span>...</span>
                <div class="action-three-dots-comments">
                  <p data-type="report">Báo cáo</p>
                  <p data-type="delete">Xóa</p>
                </div>
              </div>
              <!--                user comment-->
              <div class="h3-span-content-li-content-comment">
                <h3>Ellen Phạm </h3>
                <span class="chapter-comment">Chapter 7.2</span>
                <span>2021/12/27 23:30</span>
              </div>
              <!--                body-comment-->
              <span class="summary-content-li-content-comment">má plot này quả thực chưa nghĩ đến</span>
              <a class="reply">Trả lời</a>
              <!--                href="javascript:;" onclick="replyComment(`114822`, `@Ellen Phạm`, `1447`)" -->
            </div>
            <div class="replyComment" id="replyCommentID114812"></div>
          </li>
        </ul>
      </div>

    </div>


  </div>
</template>
<script>
require('@/assets/css/story-details.css')
</script>

<style scoped>

@import url(@/assets/css/story-details.css);
</style>