<script setup lang="ts">
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useProfileStore } from '@/stores/profile'

interface MenuLink { to: string; icon: string; label: string }

const links: MenuLink[] = [
  { to: '/admin/stories/', icon: 'fa-books', label: 'Stories' },
  { to: '/admin/categories', icon: 'fa-th-large', label: 'Categories' },
  { to: '/admin/authors', icon: 'fa-marker', label: 'Authors' },
  { to: '/admin/readers', icon: 'fa-book-reader', label: 'Readers' },
  { to: '/admin/gifts', icon: 'fa-gift', label: 'Gifts' },
]

const router = useRouter()
const auth = useAuthStore()
const profile = useProfileStore()

function logout() {
  auth.clearTokens()
  router.push({ path: '/admin/login' })
}

onMounted(() => {
  profile.fetchAdmin()
})
</script>

<template>
  <nav class="flex h-full flex-col bg-[#6959CD] text-white">
    <div class="mt-8 flex flex-col items-center">
      <img src="@/assets/images/logo-while.png" alt="app-logo" />
    </div>

    <div class="mt-10 flex flex-col items-center">
      <img
        class="mb-4 h-[75px] w-[75px] rounded-md"
        src="https://preview.keenthemes.com/metronic8/demo15/assets/media/avatars/300-1.jpg"
        alt="avatar"
      />
      <router-link to="/admin/profile-admin/" class="text-lg font-semibold !text-white hover:!text-blue-900">
        Admin Control
      </router-link>
    </div>

    <div class="mt-6 flex flex-col">
      <router-link
        v-for="link in links"
        :key="link.to"
        :to="link.to"
        class="menu-item flex gap-4 px-6 py-3 text-lg font-bold !text-white hover:bg-[#F4F6FA] hover:!text-[#6959CD]"
      >
        <i :class="['fas', link.icon]"></i>
        <span>{{ link.label }}</span>
      </router-link>
      <div
        class="menu-item flex cursor-pointer gap-4 px-6 py-3 text-lg font-bold hover:bg-[#F4F6FA] hover:text-[#6959CD]"
        @click="logout"
      >
        <i class="fas fa-sign-out-alt"></i>
        <span>Logout</span>
      </div>
    </div>
  </nav>
</template>
