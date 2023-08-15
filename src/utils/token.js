// 使用localStorage存储数据
// 获取数据
export const getToken =()=>{
    return localStorage.getItem("user");
}
// 存储信息
export const setToken =(value)=>{
    localStorage.setItem("user",value);
}
// 消除信息
export const clearToken =()=>{
    localStorage.removeItem("user")
}