<template>
    <van-nav-bar title="榜单" fixed placeholder :border="false" />
    <div class="container">
      <div class="list">
        <div class="list-item" v-for="item in state.list" :key="item.tId">
          <div class="img">
            <van-image width="100" height="100" 
            :src="`http://localhost:8888/${item.info[0].mImg}`" />
          </div>
          <div class="right">
            <div @click="goFilmInfo(items.mId)" v-for="(items,index) in item.info" :key="items.mId">
              {{index+1}}.{{ items.mName }} <span>{{ items.cmScore }}分</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <TabBar></TabBar>
</template>
  
<script setup>
  import TabBar from "@/components/TabBar/TabBar.vue";
  import { ref, reactive, onMounted } from 'vue';
  import {useRouter,useRoute} from "vue-router";
  import {getRankingList} from "@/api/ranking.js";
  const router = useRouter();
  const state = reactive({
      list: []
  });
  onMounted(async ()=>{
      const {data} = await getRankingList();
      data.forEach(item => {
          item.info.forEach(items=>{
              items.cmScore = parseFloat(items.mScore/2);
          })
      });
      state.list = data;
  })
  const goFilmInfo = (value)=>{
      router.push({name:'FilmInfo',query:{mId:value}});
  }
</script>
<style lang="scss" scoped>
::v-deep .van-nav-bar {
  background-color: #fff;
  .van-nav-bar__title {
    color: black;
  }
}
.container {
  padding: 0 4.267vw;
  padding-bottom: 16vw;
  .list {
    .list-item {
      display: flex;
      align-items: center;
      height: 26.667vw;
      margin-top: 2.667vw;
      .img {
        ::v-deep .van-image__img {
          border-radius: 1.333vw;
        }
      }
      .right {
        display: flex;
        width: 100%;
        flex-direction: column;
        justify-content: center;
        height: 22.933vw;
        border: 0.267vw solid #e6e6e6;
        border-left: none;
        color: #494949;
        font-size: 3.733vw;
        padding-left: 5.333vw;
        border-top-right-radius: 0.8vw;
        border-bottom-right-radius: 0.8vw;
        span {
          color: #ffac2d;
        }
      }
    }
  }
}
</style>
