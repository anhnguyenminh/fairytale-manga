import Vue from 'vue'
import VueRouter from 'vue-router'
import LoginView from '@/views/LoginView'
import RegisterView from '@/views/RegisterView'
import LoginAdminView from '@/views/LoginAdminView'


Vue.use(VueRouter)

const routes = [
  {
    path: '',
    name: 'Homepage',
    component: () => import('@/pages/Homepage'),
    children: [
      {
        path: '/',
        name: 'LoginView',
        component: LoginView,
      },
      {
        path: '/register',
        component: () => import(/* webpackChunkName: "about" */ '@/views/RegisterView'),
      }
    ],
  },
  {
    path: '/register',
    name: 'RegisterView',
    component: RegisterView
  },
  {
    path: '/admin/login',
    name: 'LoginAdminView',
    component: LoginAdminView
  },
  //
  // {
  //   path: '/abc',
  //   name: '',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
