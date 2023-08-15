import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/my',
    name: 'My',
    component: ()=>import("@/views/My/My.vue")
  },
  {
    path: '/ranking',
    name: 'Ranking',
    component: ()=>import("@/views/Ranking/Ranking.vue")
  },
  {
    path: '/filminfo',
    name: 'FilmInfo',
    component: ()=>import("@/views/FilmInfo/FilmInfo.vue")
  },
  {
    path: '/search',
    name: 'Search',
    component: ()=>import("@/views/Search/Search.vue")
  },
  {
    path: '/infolist',
    name: 'InfoList',
    component: ()=>import("@/views/InfoList/InfoList.vue")
  },
  {
    path: '/login',
    name: 'Login',
    component: ()=>import("@/views/Login/Login.vue")
  },
  {
    path: '/reg',
    name: 'Reg',
    component: ()=>import("@/views/Reg/Reg.vue")
  }
  
  
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
