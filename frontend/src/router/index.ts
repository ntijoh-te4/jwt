import { createRouter, createWebHistory, NavigationGuardNext, RouteLocationNormalized, RouteRecordRaw } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import QOTDView from '../views/QOTDView.vue'
import SignInView from '../views/SignInView.vue'
import UserView from '../views/UserView.vue'
import store from '../store'

function authenticationRequired(to : RouteLocationNormalized, from : RouteLocationNormalized, next: NavigationGuardNext) {
  if (!store.getters.isAuthenticated) {
    next('/signin')
  } else {
    next()
  }
}

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
    beforeEnter: (to, from, next) => { authenticationRequired(to, from, next) },
    component: UserView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
