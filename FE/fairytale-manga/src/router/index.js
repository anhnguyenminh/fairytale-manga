import Vue from 'vue'
import VueRouter from 'vue-router'
import LoginView from '@/views/User/LoginView'
import RegisterView from '@/views/User/RegisterView'
import LoginAdminView from '@/views/Admin/LoginAdminView'


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
                component: () => import('@/views/User/HomeView')
            },
            {
                path: '/categories/trending-stories',
                // name: 'LoginView',
                component: LoginView,
            },
            {
                path: '/categories/recommended-stories',
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
                component: () => import('@/views/User/RegisterView'),
            },
            {
                path: '/story-details',
                component: () => import('@/components/Client/SingleStoryDetails')
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
                path: 'profile-admin/',
                component: () => import('@/views/Admin/Admin/AdminProfile'),
            },
            {
                path: 'stories',
                component: () => import('@/views/Admin/Stories/StoriesView'),
            },
            {
                path: 'stories/add-new',
                component: () => import('@/views/Admin/Stories/AddNewStory'),
            },
            {
                // path: 'stories/:story/update/:id',
                path: 'stories/update/:id', //test url for UI design
                component: () => import('@/views/Admin/Stories/UpdateStory'),
            },
            {
                // path: 'stories/:story/new-chapter/',
                path: 'stories/ten-truyen/new-chapter/',  //test url for UI design
                component: () => import('@/views/Admin/Stories/AddNewChapter'),
            },
            {
                path: 'categories',
                name: 'CategoriesView',
                component: () => import('@/views/Admin/Categories/CategoriesView')
            },
            {
                path: 'categories/add-new',
                name: 'AddNewCategory',
                component: () => import('@/views/Admin/Categories/AddNewCategory'),
            },
            {
                path: 'categories/update/:id',
                name: 'UpdateCategory',
                component: () => import('@/views/Admin/Categories/UpdateCategory'),
            },
            {
                path: 'authors',
                name: 'AuthorsView',
                component: () => import('@/views/Admin/Authors/AuthorsView'),
            },
            {
                path: 'authors/update/:id',
                name: 'UpdateAuthor',
                component: () => import('@/views/Admin/Authors/UpdateAuthor'),
            },
            {
                path: 'authors/add-new',
                component: () => import('@/views/Admin/Authors/AddNewAuthor'),
            },
            {
                path: 'readers',
                name: 'ReadersView',
                component: () => import('@/views/Admin/Readers/ReadersView'),
            },
            {
                path: 'gifts',
                name: 'GiftsView',
                component: () => import('@/views/Admin/Gifts/GiftsView'),
            },
            {
                path: 'gifts/add-new',
                name: 'AddNewGift',
                component: () => import('@/views/Admin/Gifts/AddNewGift'),
            },
            {
                path: 'gifts/update/:id',
                name: 'UpdateGift',
                component: () => import('@/views/Admin/Gifts/UpdateGift'),
            },
            {
                path: 'profile-admin',
                // name: 'CategoriesView',
                component: () => import('@/views/Admin/Categories/CategoriesView'),
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
