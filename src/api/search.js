import req from "@/utils/request"
export const searchInfo = (key)=>{
    return req({
        url:"/search.php",
        params:{key}
    })
}