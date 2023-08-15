import req from "@/utils/request"
// 请求首页列表数据
export const getHomeList = ()=>{
    return req({
        url:"/getInfoByHome.php"
    })
}
export const goHomeList =(tId)=>{
    return req({
        url:"/goHomeMoreList.php",
        params:{
            tId
        }
    })
}