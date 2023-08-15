<template>
    <van-nav-bar title="首页" fixed placeholder :border="false"></van-nav-bar>
    <div class="container">
        <div class="search-box">
            <van-button  @click="goSearch">
                <van-icon name="search" />
                搜索
            </van-button>
        </div>
        <div class="reflection" v-for="item in state.homeList" :key="item.tId">
            <van-cell :border="false" :title="item.tName" is-link value="查看更多" @click="goinfoList(item)"/>
            <div class="list">
                <ul>
                    <li v-for="items in item[0]" :key="items.mId" @click="goFilmInfo(items.mId)">
                        <div class="img">
                            <van-image width="90" height="120" :src="`http://localhost:8888/${items.mImg}`"/>
                        </div>
                        <div class="title">{{ items.mName }}</div>
                        <div class="rate">
                            <van-rate color="#ffac2d" v-model="items.cmScore" readonly allow-half void-icon="star" void-color="#eee" />
                            <div class="text">{{ items.cmScore }}</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <TabBar></TabBar>
</template>
<script setup>
import TabBar from "@/components/TabBar/TabBar.vue"
import {ref,reactive,onMounted} from "vue"
import {getHomeList} from "@/api/home"
import {useRouter} from "vue-router"

const router = useRouter();
const state = reactive({
    homeList:[]
})
onMounted(async()=>{
    const {data} = await getHomeList();
    data.forEach(element => {
        element[0].forEach(elements => {
            elements.cmScore = parseFloat(elements.mScore/2);
        });
    });
    state.homeList = data;
})
const goFilmInfo = (value) =>{
    router.push({name:"FilmInfo",query:{mId:value}})
}
const goSearch =()=>{
    router.push("/search")
}
const goinfoList =(value)=>{
    router.push({name:"InfoList",query:{tId:value.tId,tName:value.tName}})
}
</script>
<style lang="scss" scoped>
.container{
    padding-bottom: 16vw;
    .search-box{
        padding: 2.667vw;
        background-color: #42bd56;
        button{
            width: 100%;
            height: 8vw;
            border-radius: 1.333vw;
            color: #999;
        }
    }
    .list{
        margin-bottom: 2.667vw;
        padding: 0 4.267vw;
    }
    ul{
        overflow: auto;
        display: flex;
        & li:nth-child(1){
            margin-left: 0;
        }
        &::-webkit-scrollbar{
            display: none;
        }
        li{
            margin-left: 4.267vw;
            position: relative;
            .img{
                ::v-deep .van-image_img{
                    border-radius: 1.333vw;
                }
            }
            .title{
                width: 24vw;
                font-size: 3.733vw;
                font-weight: 700;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .rate{
                .van-rate{
                    width: 37.333vw;
                    position: absolute;
                    transform: scale(0.5);
                    bottom: -0.533vw;
                    left: -9.6vw;
                }
                .text{
                    font-size: 3.733vw;
                    margin-left: 16.533vw;
                }
            }
        }
    }
}
</style>