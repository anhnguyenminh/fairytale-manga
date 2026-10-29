import { createRouter, createWebHistory, type RouteRecordRaw } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useProfileStore } from '@/stores/profile'

declare module 'vue-router' {
    interface RouteMeta {
        /** Only accounts with the admin role (not moderators) may open this route. */
        adminOnly?: boolean
    }
}

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
                path: 'staff',
                name: 'StaffView',
                meta: { adminOnly: true },
                component: () => import('@/views/Admin/Staff/StaffView.vue'),
            },
            {
                path: 'categories',
                meta: { adminOnly: true },
                name: 'CategoriesView',
                component: () => import('@/views/Admin/Categories/CategoriesView.vue')
            },
            {
                path: 'categories/add-new',
                meta: { adminOnly: true },
                name: 'AddNewCategory',
                component: () => import('@/views/Admin/Categories/AddNewCategory.vue'),
            },
            {
                path: 'categories/update/:id',
                meta: { adminOnly: true },
                name: 'UpdateCategory',
                component: () => import('@/views/Admin/Categories/UpdateCategory.vue'),
            },
            {
                path: 'authors',
                meta: { adminOnly: true },
                name: 'AuthorsView',
                component: () => import('@/views/Admin/Authors/AuthorsView.vue'),
            },
            {
                path: 'authors/update/:id',
                meta: { adminOnly: true },
                name: 'UpdateAuthor',
                component: () => import('@/views/Admin/Authors/UpdateAuthor.vue'),
            },
            {
                path: 'authors/add-new',
                meta: { adminOnly: true },
                component: () => import('@/views/Admin/Authors/AddNewAuthor.vue'),
            },
            {
                path: 'readers',
                meta: { adminOnly: true },
                name: 'ReadersView',
                component: () => import('@/views/Admin/Readers/ReadersView.vue'),
            },
            {
                path: 'gifts',
                meta: { adminOnly: true },
                name: 'GiftsView',
                component: () => import('@/views/Admin/Gifts/GiftsView.vue'),
            },
            {
                path: 'gifts/add-new',
                meta: { adminOnly: true },
                name: 'AddNewGift',
                component: () => import('@/views/Admin/Gifts/AddNewGift.vue'),
            },
            {
                path: 'gifts/update/:id',
                meta: { adminOnly: true },
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

// Admin pages need a valid session and the right role (RBAC mirrors the backend's Admin#can?).
router.beforeEach(async (to) => {
    if (!to.path.startsWith('/admin') || to.path === '/admin/login') return

    const auth = useAuthStore()
    if (!auth.adminToken) return { path: '/admin/login' }

    const profile = useProfileStore()
    if (!profile.admin && !(await profile.fetchAdmin())) {
        auth.clearTokens()
        return { path: '/admin/login' }
    }
    if (to.meta.adminOnly && !profile.isAdmin) return { path: '/admin/stories' }
})

export default router
