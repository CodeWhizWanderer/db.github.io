<template>
  <van-nav-bar title="搜索" fixed placeholder :border="false" left-arrow @click-left="onClickLeft"/>
  <div class="container">
    <div class="search-box">
      <van-search placeholder="请输入电影名称" @search="search" v-model="state.value"  />
    </div>
    <div v-if="state.list.length > 0" class="list">
      <van-list :immediate-check="false" v-model:loading="loading" :finished="finished" finished-text="没有更多了">
        <div class="list-item" @click="goFilmInfo(item.mId)" v-for="item in state.list" :key="item.mId">
          <div class="img">
            <van-image width="60" height="76" :src="item.mImg" />
          </div>
          <div class="right">
            <div class="title">
              {{ item.mName }}&nbsp;&nbsp;<span>({{item.mYear}})</span>
            </div>
            <div class="rate">
              <van-rate color="#ffac2d" v-model="item.cmScore" readonly allow-half />
              <div class="text">{{ item.cmScore }}</div>
            </div>
            <div class="info">
                <div class="des">{{ item.mAddr }}</div>
                <div class="label">{{ item.mClass }}</div>
            </div>
          </div>
        </div>
      </van-list>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue';
import {useRouter,useRoute} from "vue-router";
import {searchInfo} from "@/api/search";
const route = useRoute();
const router = useRouter();
const state = reactive({
  value:"",
  list: []
});
const onClickLeft = ()=>{
    history.back();
};
const search = ()=>{
    searchApi(state.value);
};
const searchApi = async (value)=>{
    const {data} = await searchInfo(value);
    data.forEach(item => {
      item.mImg = "http://localhost:8888/"+item.mImg
      item.cmScore = parseFloat(item.mScore) / 2 
    });

    state.list = data;
};
const goFilmInfo = (value)=>{
    router.push({name:'FilmInfo',query:{mId:value}});
};
</script>

<style lang="scss" scoped>
.container {
  font-size: 3.733vw;
  .search-box {
    padding: 2.667vw;
    background-color: #42bd56;
    ::v-deep .van-search {
      overflow: hidden;
      border-radius: 1.333vw;
      padding: 0;
      .van-search__content {
        background-color: #fff;
      }
    }
  }
  .top {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 0 4.267vw;
    margin-top: 2.667vw;
    .img {
      position: relative;
      height: 16vw;

      border-radius: 1.333vw;
      overflow: hidden;
      ::v-deep .van-image__img {
        border-radius: 1.333vw;
      }
      .label {
        position: absolute;
        top: 11.2vw;
        left: -0.8vw;
        color: #fff;
        width: 9.067vw;
        height: 5.333vw;
        font-size: 3.2vw;
        text-align: center;
        line-height: 5.333vw;
        background-color: rgba(0, 0, 0, 0.4);
        transform: scale(0.8);
        border-radius: 1.333vw;
      }
    }

    .box {
      margin-bottom: 2.667vw;
      width: 43%;
      height: 16vw;
      border-radius: 1.333vw;
      display: flex;
      align-items: center;
      background-color: #f7f7f7;
      padding: 2.133vw 2.667vw;

      .right {
        margin-left: 1.6vw;
        flex: 1;
        font-size: 3.733vw;
        .title {
          overflow: hidden;
          -webkit-line-clamp: 2;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-box-orient: vertical;
        }
      }
      .people {
        font-size: 3.2vw;
        color: #b2b2b2;
      }
    }
  }
  .list {
    padding: 0 3.733vw;
  }
  .list-item {
    position: relative;
    display: flex;
    height: 26.667vw;
    align-items: center;
    ::v-deep .van-image__img {
      border-radius: 1.333vw;
    }
    .right {
      padding: 3.733vw 0;
      margin-left: 2.667vw;
      height: 100%;
      width: 100%;
      box-sizing: border-box;

      border-bottom: 0.267vw solid #999;
      .title {
        font-size: 3.733vw;
        font-weight: 700;
        span {
          color: #999;
          font-weight: 500;
        }
      }
    }
    .rate {
      .van-rate {
        width: 37.333vw;
        position: absolute;
        transform: scale(0.5);
        bottom: 13.333vw;
        left: 9.067vw;
      }
      .text {
        font-size: 3.733vw;
        margin-left: 16.533vw;
      }
    }
    .info {
      color: #999;
      position: relative;
      .label {
        background-color: #f2f2f2;
        padding: 0 0.533vw;
        color: #494949;
        display: inline;
        margin-right: 1.6vw;
      }
      .des {
        display: inline;
      }
    }
  }
}
</style>