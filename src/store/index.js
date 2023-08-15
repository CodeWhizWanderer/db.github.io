import { createStore } from 'vuex'
import { setToken } from "@/utils/token";

export default createStore({
  state: {
    userInfo:{}
  },
  getters: {
  },
  mutations: {
    setUserInfo(state,value){
      state.userInfo = value;
      setToken(value.uToken);
      localStorage.setItem("userInfo",JSON.stringify(value));
    }
  },
  actions: {
  },
  modules: {
  }
})
