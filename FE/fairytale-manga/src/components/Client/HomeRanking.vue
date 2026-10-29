<script setup lang="ts">
// Static ranking placeholders (identical to the original markup; not backed by an API yet).
const columns = ['Top ngày', 'Top tuần', 'Top tháng']
const ranks = [1, 2, 3, 4, 5]
const href = 'https://qmanga3.net/doi-tac-ban-thoi-gian-bl.html'
const covers = Object.values(
  import.meta.glob<string>('@/assets/images/*.jpg', { eager: true, import: 'default' }),
)
const coverOf = (column: number, rank: number) => covers[(column * ranks.length + rank) % covers.length]
</script>

<template>
  <div class="top-bxh">
    <h1 class="h1-title h1-title-bxh uppercase">
      <i class="fas fa-star-shooting" style="color: gold"></i> Bảng xếp hạng
    </h1>
    <div class="grid grid-cols-1 md:grid-cols-3">
      <div v-for="(title, column) in columns" :key="title" class="col-top-bxh">
        <div class="top-bxh-row-header">
          <div class="top-bxh-row-header-title">
            <h3 class="uppercase">{{ title }}</h3>
          </div>
          <div v-for="rank in ranks" :key="rank" class="row-top-bxh">
            <div class="number-top-bhx">{{ rank }}</div>
            <div class="comic-image-top-bxh">
              <a :href="href"><img :src="coverOf(column, rank)" alt="" /></a>
            </div>
            <div class="desc-top-bxh">
              <a :href="href"><h5>Đối tác Bán thời gian</h5></a>
              <a :href="href"><p>Chapter 15 &lt;Ngang Raw&gt;</p></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
@import url(@/assets/css/home.css);
</style>
