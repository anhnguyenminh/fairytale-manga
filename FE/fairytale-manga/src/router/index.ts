import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        component: () => import('@/pages/Homepage.vue'),
        children: [
            {
                path: '',
                name: 'HomeView',
                component: () => import('@/views/User/HomeView.vue')
            },
            {
                path: '/categories/trending-stories',
                component: () => import('@/views/User/CollectionView.vue')
            },
            {
                path: '/categories/recommended-stories',
                component: () => import('@/views/User/RecommendStoryView.vue')
            },
            {
                path: '/categories/:collection',
                name: 'CollectionView',
                component: () => import('@/views/User/CollectionView.vue')
            },
            // {
            //     path: '/search-advanced/',
            //     component: () => import('@/views/User/search-advanced.vue')
            // },
            {
                path: '/auth/sign-in',
                name: 'LoginView',
                component: () => import('@/views/User/LoginView.vue'),
            },
            {
                path: '/auth/register',
                component: () => import('@/views/User/RegisterView.vue'),
            },
            {
                path: '/story/:details',
                component: () => import('@/components/Client/SingleStoryDetails.vue')
            },
            {
                path: 'story/:details/chapter/:chap',
                component: () => import('@/views/User/Chapter.vue')
            }
        ],
    },
    {
        path: '/admin/',
        component: () => import('@/pages/AdminDashboard.vue'),
        children: [
            {
                path: '',
                name: 'AdminDashboard',
                component: () => import('@/views/Admin/Stories/StoriesView.vue'),
            },
            {
                path: 'profile-admin/',
                component: () => import('@/views/Admin/Admin/AdminProfile.vue'),
            },
            {
                path: 'stories',
                component: () => import('@/views/Admin/Stories/StoriesView.vue'),
            },
            {
                path: 'stories/add-new',
                component: () => import('@/views/Admin/Stories/AddNewStory.vue'),
            },
            {
                path: 'stories/update/:id',
                component: () => import('@/views/Admin/Stories/UpdateStory.vue'),
            },
            {
                path: 'stories/:id/new-chapter/',
                component: () => import('@/views/Admin/Stories/AddNewChapter.vue'),
            },
            {
                path: 'stories/:id/chapter/:param',
                component: () => import('@/views/Admin/Stories/DetailSingleChapter.vue'),
            },
            {
                path: 'categories',
                name: 'CategoriesView',
                component: () => import('@/views/Admin/Categories/CategoriesView.vue')
            },
            {
                path: 'categories/add-new',
                name: 'AddNewCategory',
                component: () => import('@/views/Admin/Categories/AddNewCategory.vue'),
            },
            {
                path: 'categories/update/:id',
                name: 'UpdateCategory',
                component: () => import('@/views/Admin/Categories/UpdateCategory.vue'),
            },
            {
                path: 'authors',
                name: 'AuthorsView',
                component: () => import('@/views/Admin/Authors/AuthorsView.vue'),
            },
            {
                path: 'authors/update/:id',
                name: 'UpdateAuthor',
                component: () => import('@/views/Admin/Authors/UpdateAuthor.vue'),
            },
            {
                path: 'authors/add-new',
                component: () => import('@/views/Admin/Authors/AddNewAuthor.vue'),
            },
            {
                path: 'readers',
                name: 'ReadersView',
                component: () => import('@/views/Admin/Readers/ReadersView.vue'),
            },
            {
                path: 'gifts',
                name: 'GiftsView',
                component: () => import('@/views/Admin/Gifts/GiftsView.vue'),
            },
            {
                path: 'gifts/add-new',
                name: 'AddNewGift',
                component: () => import('@/views/Admin/Gifts/AddNewGift.vue'),
            },
            {
                path: 'gifts/update/:id',
                name: 'UpdateGift',
                component: () => import('@/views/Admin/Gifts/UpdateGift.vue'),
            }

        ],
    },
    {
        path: '/auth/register',
        name: 'RegisterView',
        component: () => import('@/views/User/RegisterView.vue')
    },
    {
        path: '/admin/login',
        name: 'LoginAdminView',
        component: () => import('@/views/Admin/LoginAdminView.vue')
    }
]

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes,
})

export default router
