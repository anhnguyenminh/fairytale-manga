<script setup lang="ts">
interface CommentItem {
  id: number
  author: string
  chapter: string
  time: string
  content: string
  avatar: string
}

// Static placeholder comments (not backed by an API yet, same as the original).
const avatar = 'https://graph.facebook.com/v3.0/1104705490285804/picture?type=normal'
const comments: CommentItem[] = [
  { id: 114822, author: 'Ellen Phạm', chapter: 'Chapter 7.2', time: '2021/12/27 23:30', content: 'má plot này quả thực chưa nghĩ đến', avatar },
  { id: 114812, author: 'Ellen Phạm', chapter: 'Chapter 7.2', time: '2021/12/27 23:30', content: 'má plot này quả thực chưa nghĩ đến', avatar },
]
</script>

<template>
  <div class="container mx-auto comment-area">
    <div class="load-comment-content" style="padding: 0 15px">
      <ul class="nav nav-tabs main-tab list-none p-0">
        <li class="comment-active">
          <a href="#nt_comments">
            <i class="fa fa-comments"></i> <span class="uppercase">Bình luận</span> (<span class="comment-count">430</span>)
          </a>
        </li>
      </ul>
      <div class="body-content-comment-area">
        <form id="form-comment" @submit.prevent>
          <div class="form-group">
            <a-textarea class="comment-content" :rows="5" placeholder="Nhập nội dung bình luận ..." />
          </div>
          <div class="form-group btn-submit">
            <button type="submit" class="btn-more btn-submit-comment"> Gửi</button>
          </div>
          <div id="comment-message-alert"></div>
        </form>
      </div>
      <div class="content-comment">
        <ul class="ul-content-comment">
          <li v-for="comment in comments" :id="`commentID${comment.id}`" :key="comment.id" class="single-comment">
            <div class="image-li-content-comment">
              <img class="lazyloaded" :src="comment.avatar" />
            </div>
            <div class="content-li-content-comment">
              <div class="three-dots-comments">
                <span>...</span>
                <div class="action-three-dots-comments">
                  <p data-type="report">Báo cáo</p>
                  <p data-type="delete">Xóa</p>
                </div>
              </div>
              <div class="h3-span-content-li-content-comment">
                <h3>{{ comment.author }}</h3>
                <span class="chapter-comment">{{ comment.chapter }}</span>
                <span>{{ comment.time }}</span>
              </div>
              <span class="summary-content-li-content-comment">{{ comment.content }}</span>
              <a class="reply">Trả lời</a>
            </div>
            <div :id="`replyCommentID${comment.id}`" class="replyComment"></div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/css/story-details.css);
</style>
