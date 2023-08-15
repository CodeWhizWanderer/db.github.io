<template>
  <van-tabbar v-model="active" transparent :border="false" @change="change">
    <van-tabbar-item icon="wap-home-o">首页</van-tabbar-item>
    <van-tabbar-item icon="gem">榜单</van-tabbar-item>
    <van-tabbar-item icon="user-o">我的</van-tabbar-item>
  </van-tabbar>
</template>

<script setup>
  import { useRouter,useRoute } from 'vue-router';
  import { ref,onMounted } from 'vue';
  const router = useRouter();
  const route = useRoute();
  const active = ref(0);
  const change = (value)=>{
    switch (value) {
      case 0:
        router.push({name:"Home"})
        break;
      case 1:
        router.push({name:"Ranking"})
        break;
      case 2:
        router.push({name:"My"})
        break;
    }
  }
  onMounted(()=>{
    if (route.name === "Home") {
      active.value = 0;
    }else if(route.name === "Ranking"){
      active.value = 1;
    }else{
      active.value = 2;
    }
  })
</script>

<style>

</style>