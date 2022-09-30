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
                name: 'HomeView',
                component: () => import('@/views/HomeView'),
            },
            {
                path: '/categories/trending-stories',
                name: 'LoginView',
                component: LoginView,
            },
            {
                path: '/categories/recommended-stories',
                name: 'LoginView',
                component: LoginView,
            },
            // {
            //     path: '/categories',
            //     name: 'LoginView',
            //     component: LoginView,
            // },
            // {
            //     path: '/search-advanced/',
            //     name: 'LoginView',
            //     component: LoginView,
            // },
            {
                path: '/auth/sign-in',
                name: 'LoginView',
                component: LoginView,
            },
            {
                path: '/auth/register',
                component: () => import(/* webpackChunkName: "about" */ '@/views/RegisterView'),
            }
        ],
    },
    {
        path: '/admin/',
        name: 'AdminDashboard',
        component: () => import('@/pages/AdminDashboard'),
        children: [
            {
                path: '',
                component: () => import('@/views/AboutView'),
            },
            {
                path: 'stories',
                component: () => import('@/views/StoriesView'),
            },
            {
                path: 'categories',
                name: 'CategoriesView',
                component: () => import('@/views/CategoriesView'),
            },
            {
                path: 'authors',
                name: 'AuthorsView',
                component: () => import('@/views/AuthorsView'),
            },
            {
                path: 'readers',
                name: 'ReadersView',
                component: () => import('@/views/ReadersView'),
            },
            // {
            //     path: 'gifts',
            //     name: 'CategoriesView',
            //     component: () => import('@/views/GiftsView'),
            // },
            {
                path: 'profile-admin',
                name: 'CategoriesView',
                component: () => import('@/views/CategoriesView'),
            },
            {
                path: 'categories/add-new',
                name: 'AddNewCategory',
                component: () => import('@/views/AddNewCategory'),
            },

        ],
    },
    {
        path: '/auth/register',
        name: 'RegisterView',
        component: RegisterView
    },
    {
        path: '/admin/login',
        name: 'LoginAdminView',
        component: LoginAdminView
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
