<template>
    <van-nav-bar title="注册" fixed placeholder :border="false" left-arrow @click-left="onClickLeft" />
    <div class="login">
        <van-form @submit="onSubmit">
        <van-cell-group inset>
            <van-field v-model="username" name="用户名" label="用户名" placeholder="用户名" :rules="[{ required: true, message: '请填写用户名' }]" />
            <van-field v-model="password" type="password" name="密码" label="密码" placeholder="密码" :rules="[{ required: true, message: '请填写密码' }]" />
        </van-cell-group>
        <div style="margin: 16px">
            <van-button color="#5cc76d" round block type="primary" native-type="submit">
            注册
            </van-button>
        </div>
        </van-form>
        <div @click="goLogin">立即登录</div>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { Toast } from 'vant';
import { useRouter } from 'vue-router';
import { userReg } from "@/api/user";
const router = useRouter();
const username = ref('');
const password = ref('');
const onClickLeft = () => {
    history.back();
};
const onSubmit = async ()=>{
    const {data} = await userReg({
        uName:username.value,
        uPwd:password.value,
    })
    console.log(data);
    if(data===200){
        Toast.success("注册成功");
        goLogin();
    }else{
        Toast.fail("注册失败，请重新注册");
    }
}

const goLogin = () => {
  router.push({ name: 'Login' });
}
</script>

<style lang="scss" scoped>
::v-deep .van-nav-bar {
  background-color: #fff;
  .van-nav-bar__title {
    color: black;
  }
}
.login {
  margin-top: 5.333vw;
  & > div {
    padding: 0 4.267vw;
    text-align: right;
    color: #999;
  }
}
</style>