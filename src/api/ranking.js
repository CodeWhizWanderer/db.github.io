import req from "@/utils/request"
export const getRankingList =()=>{
    return req({
        url:"/goHot.php"
    })
}