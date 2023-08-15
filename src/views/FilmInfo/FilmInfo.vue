<template>
  <van-nav-bar :title="state.info.mName" fixed placeholder :border="false" left-arrow @click-left="onClickLeft"/>
  <div class="container">
    <div class="top">
      <div class="img">
        <van-image width="110" height="140" :src="state.info.mImg" />
      </div>
      <div class="info">
        <div class="title">{{state.info.mName}}</div>
        <div class="label">
          <div>No.5</div>
          <div>一周口碑电影榜</div>
        </div>
        <div class="des">
          {{state.info.mAddr}}&nbsp;&nbsp;{{ state.info.mYear }}&nbsp;&nbsp;{{state.info.mClass}}&nbsp;&nbsp;片长{{state.info.mLong}}
        </div>
        <div class="btn">
          <van-button icon="like-o" type="primary">想看</van-button>
          <van-button icon="star-o" type="primary">看过</van-button>
        </div>
      </div>
    </div>
    <div class="introduction">
        <div class="title">简介</div>
        <div class="main" :class="{closed:status}">
          {{state.info.mInfo}}
        </div>
        <div class="open" @click="opends">{{ status === true ? '展开' : '收起' }}</div>
      </div>
      <div class="shadowman">
        <div class="title">影人</div>
        <ul>
          <li v-for="item in state.shadowManList" :key="item.mmId">
            <div class="img">
              <van-image width="90" height="120" :src="item.mmImg" />
            </div>
            <div class="name">{{item.mmName}}</div>
            <div class="position">{{item.mmRole}}</div>
          </li>
        </ul>
      </div>
  </div>
</template>

<script setup>
import {ref,reactive,onMounted} from "vue";
import {useRoute} from "vue-router";
import {searchInfo,getMovieManList} from "@/api/fimlInfo"

const route = useRoute();
const onClickLeft = () =>{
  history.back()
};
const state = reactive({
  info:{},
  shadowManList:[]
});
onMounted(async()=>{
  const {data} = await searchInfo(route.query.mId);
  state.info = data;
  state.info.mImg = "http://localhost:8888/"+state.info.mImg;

  // 获取影人数据
  // const MovieManList = await getMovieManList(route.query.mId);
  const MovieManList = await getMovieManList(1);
  state.shadowManList = MovieManList.data;
  state.shadowManList.forEach(item=>{
    item.mmImg = "http://localhost:8888/" + item.mmImg;
  })
});

const status = ref(true);
const opends = () =>{
  status.value = !status.value
};
</script>

<style lang="scss" scoped>
//样式穿透
::v-deep .van-nav-bar {
  background-color: #f9f5f4;
  .van-nav-bar__title {
    color: #333 !important;
  }
  .van-nav-bar__left {
    i {
      color: #333 !important;
    }
  }
}
.container {
  background-color: #f9f5f4;
  height:100%;
  padding-bottom: 2.667vw;
  .top {
    display: flex;
    padding: 0 4.267vw;
    margin-bottom:6vw;
    .img {
      height: 37.333vw;
      ::v-deep .van-image__img {
        border-radius: 1.333vw;
      }
    }
    .info {
      margin-left: 4vw;
      .title {
        font-size: 5.5vw;
        font-weight: 700;
      }
      .label {
        margin-top: 1.067vw;
        display: flex;
        & > :nth-child(1) {
          background-color: #ffe5bf;
          color: #b65f43;
          padding: 0.533vw 1.6vw;
          font-size: 3.733vw;
          border-top-left-radius: 1.333vw;
          border-bottom-left-radius: 1.333vw;
        }
        & > :nth-child(2) {
          background-color: #ffc673;
          color: #9d5f00;
          padding: 0.533vw 1.6vw;
          font-size: 3.733vw;
          border-top-right-radius: 1.333vw;
          border-bottom-right-radius: 1.333vw;
        }
      }
      .des {
        color: #818181;
        font-size: 3.2vw;
        margin-top: 2.667vw;
      }
      .btn {
        margin-top: 2.2vw;
        display: flex;
        button {
          width: 26.667vw;
          height: 9.333vw;
          border-radius: 1.333vw;
          margin-left: 2.667vw;
          color: #4c4c4c;
          font-size: 4.267vw;
          background-color: #fff;
          border: none;
        }
        & > :nth-child(1) {
          margin: 0;
        }
        ::v-deep .van-badge__wrapper {
          color: #ffac2d;
        }
      }
    }
  }
  .introduction {
    padding: 0 4.267vw;
    .title {
      font-size: 4.8vw;
      font-weight: 700;
      padding-bottom: 2.667vw;
    }
    .main {
      line-height: 7.2vw;
      // 收起的样式
      &.closed {
        height: 29.6vw;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 4; // 想要超出三行显示 就把这里改成3就好了
      }
    }
    .open {
      text-align: right;
      color: #c0c0c0;
    }
  }
  .shadowman {
    padding: 0 4.267vw;
    padding-bottom: 8vw;
    .title {
      font-size: 4.8vw;
      font-weight: 700;
      padding-bottom: 2.667vw;
    }
    ul {
      display: flex;
      overflow: auto;
      & > :nth-child(1) {
        margin: 0;
      }
      &::-webkit-scrollbar {
        display: none;
      }
      li {
        margin-left: 4.267vw;

        .img {
          height: 32vw;
          ::v-deep .van-image__img {
            border-radius: 1.333vw;
          }
        }
        .name {
          margin-top: 3.733vw;
          color: #191919;
          font-size: 3.733vw;
        }
        .position {
          color: #818181;
          font-size: 3.467vw;
          margin-top: 1.333vw;
        }
      }
    }
  }
}
</style>