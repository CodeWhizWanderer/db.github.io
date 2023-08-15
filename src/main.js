import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import "vant/lib/index.css"
import { Tabbar, TabbarItem, NavBar, Button, Icon, Rate, Cell, Image as VanImage, Search, Lazyload, Form, Field } from 'vant'

createApp(App)
.use(store)
.use(router)
.use(Tabbar)
.use(TabbarItem)
.use(NavBar)
.use(Button)
.use(Icon)
.use(Rate)
.use(Cell)
.use(VanImage)
.use(Search)
.use(Lazyload)
.use(Form)
.use(Field)
.mount('#app')
