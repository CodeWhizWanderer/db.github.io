import req from "@/utils/request";
import qs from "qs";
export const userReg=({uName,uPwd})=>{
    return req({
        url:"reg.php",
        params:{
            uName,
            uPwd
        }
    })
}

export const userLogin=({uName,uPwd})=>{
    return req({
        url:"login.php",
        method:"POST",
        data:qs.stringify({
            uName,
            uPwd
        })
    })
}