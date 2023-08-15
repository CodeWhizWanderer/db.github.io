import Axios from "axios";
const axios = Axios.create({
    baseURL : "http://localhost:8888/request",
    setTimeout : 30000
})
// 请求拦截
axios.interceptors.request.use(function(request){
    return request;
},function(error){
    return Promise.reject(error)
})
// 响应拦截
axios.interceptors.response.use(function(response) {
    return response;
},function(error) {
    return Promise.reject(error)
})
export default axios;