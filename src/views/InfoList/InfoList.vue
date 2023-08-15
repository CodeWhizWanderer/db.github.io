<template>
    <van-nav-bar :title="state.tName" fixed placeholder :border="false" left-arrow @click-left="onClickLeft"/>
  <div class="list">
    <div class="list-item" v-for="item in state.list" :key="item.mId">
      <div class="img">
        <van-image lazy-load width="90" height="120" :src="item.mImg" @click="goFilmInfo(item.mId)" />
      </div>
      <div class="title">{{item.mName}}</div>
      <div class="rate">
        <van-rate color="#ffac2d" size="9" v-model="item.mScore" readonly allow-half />
        <div class="text">{{item.mScore}}</div>
      </div>
    </div>
  </div>
</template>

<script setup>
    import { ref,reactive,onMounted } from "vue";
    import {useRouter,useRoute} from "vue-router";
    import {goHomeList} from "@/api/home";
    const router = useRouter();
    const route  = useRoute();
    const state = reactive({
        tId:route.query.tId,
        tName:route.query.tName,
        list:[]
    });
    onMounted(async ()=>{
        const {data} = await goHomeList(route.query.tId);
        
        data.forEach(item=>{
            item.mScore = parseFloat(item.mScore/2);
            item.mImg = "http://localhost:8888/"+item.mImg;
        });
        state.list = data;
    });
    const onClickLeft = () => {
        history.back();
    };
    const goFilmInfo = (value)=>{
        router.push({name:"FilmInfo",query:{mId:value}})
    };

</script>

<style lang="scss" scoped>
::v-deep .van-nav-bar {
  background-color: #fff;
  .van-nav-bar__title {
    color: #333 !important;
  }
  .van-nav-bar__left {
    i {
      color: #333 !important;
    }
  }
}
.list {
  display: flex;
  flex-wrap: wrap;
  padding: 2.667vw 5.333vw;
  & > :nth-child(3n-2) {
    padding-left: 0 !important;
  }
  .list-item {
    padding-bottom: 2.667vw;
    padding-left: 8.533vw;
    width: 24vw;
    .img {
      ::v-deep .van-image__img {
        border-radius: 1.333vw;
      }
    }
    .title {
      font-size: 3.733vw;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      color: #191919;
      text-align: center;
    }
    .rate {
      display: flex;
      .van-rate {
        margin-top: 0.267vw;
      }
      .text {
        font-size: 3.467vw;
        color: #818181;
        margin-left: 1.6vw;
      }
    }
  }
}
</style>