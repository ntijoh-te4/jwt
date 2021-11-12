import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import QOTDView from '../views/QOTDView.vue'
import SignInView from '../views/SignInView.vue'
import UserView from '../views/UserView.vue'

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    component: HomeView
  },
  {
    path: '/qotd',
    name: 'Quote of the Day View',
    component: QOTDView
  },
  {
    path: '/signin',
    name: 'Sign In View',
    component: SignInView
  },
  {
    path: '/users',
    name: 'User View',
    component: UserView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
