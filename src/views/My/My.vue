<template>
    <van-nav-bar title="书影音档案" fixed placeholder :border="false" />
    <!-- 用户登录成功显示的页面 -->
    <div class="login-container">
      <div class="user">
        <div class="head">
          <div class="img">
            <van-image width="80" height="80" :src="require('@/assets/logo.png')" />
          </div>
          <div class="user-name">{{state.userinfo.uName}}</div>
          <van-button @click="removeToken" icon="share-o" color="#29a8ab" type="primary"
            >退出</van-button
          >
        </div>
      </div>
      <div class="my-book">
        <van-cell :border="false" title="我的书影音" is-link value="全部" />
        <div class="info">
          <div class="look">
            <div class="img">
              <van-image width="20" height="20" :src="require('@/assets/imgs/play-icon.png')" />
            </div>
            <div class="right">
              <div class="start">
                <div>观影分析</div>
                <div>
                  <span>{{state.userinfo.uMovieSys}}</span> 看过
                </div>
              </div>
              <div class="center">
                <div>标记{{state.userinfo.uMovieMark}}部影片</div>
                <div>开启观影分析</div>
              </div>
              <div class="end">
                <div>立即开始</div>
                <van-icon name="arrow" />
              </div>
            </div>
          </div>

          <div class="read">
            <div class="img">
              <van-image width="20" height="20" :src="require('@/assets/imgs/look-icon.png')" />
            </div>
            <div class="right">
              <div class="start">
                <div>读书分析</div>
                <div>
                  <span>{{state.userinfo.uBookSys}}</span> 读过
                </div>
              </div>
              <div class="center">
                <div>标记{{state.userinfo.uBookMark}}本书</div>
                <div>开启读书分析</div>
              </div>
              <div class="end">
                <div>立即开始</div>
                <van-icon name="arrow" />
              </div>
            </div>
          </div>
          <div class="music">
            <div class="img">
              <van-image width="20" height="20" :src="require('@/assets/imgs/music-icon.png')" />
            </div>
            <div class="right">
              <div class="start">
                <div>音乐分析</div>
                <div>
                  <span>{{state.userinfo.uMusicSys}}</span> 听过
                </div>
              </div>
              <div class="center">
                <div>标记{{state.userinfo.uMusicMark}}张唱片</div>
                <div>开启音乐分析</div>
              </div>
              <div class="end">
                <div>立即开始</div>
                <van-icon name="arrow" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <TabBar></TabBar>
</template>

<script setup>
    import TabBar from "@/components/TabBar/TabBar.vue";
    import { ref,reactive,onMounted } from "vue";
    import { useRoute,useRouter } from "vue-router";
    import { getToken,clearToken } from "@/utils/token";
    import { Toast } from "vant";
    import { useStore } from "vuex";
    
    const store = useStore();
    const route = useRoute();
    const router = useRouter();
    const state = reactive({
      userinfo:{}
    })
    onMounted(()=>{
      if(!getToken()){
          console.log("登录后访问");
          //提示用户没有登录
          Toast.fail("您还没有登录，请登录后访问")
          //跳转到登录页面
          goLogin()
      }else{
          state.userinfo = JSON.parse(localStorage.getItem("userInfo"))
      }
    })
    const goLogin=()=>{
      router.push({name:"Login"})
    }
    const removeToken = ()=>{
      clearToken();
      router.go(0)
    }
</script>
<style lang="scss" scoped>
::v-deep .van-nav-bar {
  background-color: #fff;
  .van-nav-bar__title {
    color: black;
  }
}
.no-login-container {
  padding-bottom: 16vw;
  .login {
    height: 53.333vw;
    background-color: #5cc76d;
    display: flex;
    justify-content: center;
    align-items: center;
    button {
      color: #1a4b22 !important;
      width: 40vw;

      font-size: 4.267vw;
    }
  }
  .img {
    .van-image {
      width: 100% !important;
      height: 100% !important;
    }
  }
  .van-cell {
    ::v-deep .van-cell__value {
      color: #999;
    }
  }
}
.login-container {
  .user {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 53.333vw;
    background-color: #29a8ab;
    text-align: center;
    color: #fff;
    font-weight: 700;
    font-size: 4.8vw;
    .img {
      margin-bottom: 1.6vw;
      ::v-deep .van-image__img {
        border-radius: 50%;
      }
    }
    button {
      position: absolute;
      bottom: 2.667vw;
      right: 0.8vw;
      border: 0.267vw solid #d4eaec !important;
      border-radius: 1.067vw;
      height: 8vw;
      width: 23.6vw;
      font-size: 3.733vw;
      transform: scale(0.8);
    }
  }
  .my-book {
    ::v-deep .van-cell__value {
      color: #9a9a9a;
    }
    ::v-deep .van-badge__wrapper {
      color: #9a9a9a;
    }
    ::v-deep .van-cell__title {
      font-size: 4.8vw;
    }
    .read,
    .look,
    .music {
      padding: 2.667vw 2.667vw;
      padding-left: 16vw;
      margin-bottom: 2.667vw;
      position: relative;
      height: 13.333vw;
      font-size: 3.733vw;
      .img {
        position: absolute;
        left: 4.533vw;
        bottom: 3.733vw;
      }
      .right {
        display: flex;
        height: 100%;
        justify-content: space-between;
        align-items: center;
        .start {
          & > :nth-child(2) {
            color: #00bb30;
            span {
              font-size: 5.333vw;
            }
          }
        }
        .center {
          color: #7f7f7f;
        }
        .end {
          display: flex;
          align-items: center;
          div {
            background-color: #f5f5f5;
            color: #494949;
            padding: 1.067vw;
          }
          i {
            margin-left: 2.667vw;
            font-size: 4.267vw;
          }
        }
      }
    }
    .look {
      .right {
        .start {
          & > :nth-child(2) {
            color: #2384e8;
            span {
              font-size: 5.333vw;
            }
          }
        }
      }
    }
    .music {
      .right {
        .start {
          & > :nth-child(2) {
            color: #ff8d55;
            span {
              font-size: 5.333vw;
            }
          }
        }
      }
    }
  }
}
</style>