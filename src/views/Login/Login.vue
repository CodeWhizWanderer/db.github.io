<template>
    <van-nav-bar title="登录" fixed placeholder :border="false" left-arrow @click-left="onClickLeft"/>
    <div class="login">
        <van-form @submit="onSubmit">
        <van-cell-group inset>
            <van-field v-model="username" name="用户名" label="用户名" placeholder="用户名" :rules="[{ required: true, message: '请填写用户名' }]"/>
            <van-field v-model="password" type="password" name="密码" label="密码" placeholder="密码" :rules="[{ required: true, message: '请填写密码' }]" />
        </van-cell-group>
        <div style="margin: 16px">
            <van-button color="#5cc76d" round block type="primary" native-type="submit">
            登录
            </van-button>
        </div>
        </van-form>
        <div @click="goReg">立即注册</div>
    </div>
</template>

<script setup>
    import { Toast } from 'vant';
    import { ref,onMounted } from 'vue';
    import { useRouter } from 'vue-router';
    import { userLogin } from "@/api/user";
    import { useStore } from "vuex";
    
    const store = useStore();
    const router = useRouter();
    const username = ref('');
    const password = ref('');
    // 跳转注册页
    const goReg = () => {
        router.push({ name: 'Reg' });
    }
    const goMy = () => {
        router.push({ name: 'My' });
    }
    const onClickLeft = () => {
        history.back();
    };
    const onSubmit = async ()=>{
    const {data} = await userLogin({
        uName:username.value,
        uPwd :password.value
    });
    if(data!="404"){
        Toast.success("欢迎登录");
        store.commit("setUserInfo",data);
        goMy();
    }else{
       Toast.fail("用户名或密码错误，重新登录") ;
    }
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