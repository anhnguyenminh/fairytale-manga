<script setup lang="ts">
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useProfileStore } from '@/stores/profile'
import { ROLE_LABELS } from '@/constants/admin'

interface MenuLink { to: string; icon: string; label: string; adminOnly?: boolean }

const allLinks: MenuLink[] = [
  { to: '/admin/stories/', icon: 'fa-books', label: 'Stories' },
  { to: '/admin/categories', icon: 'fa-th-large', label: 'Categories', adminOnly: true },
  { to: '/admin/authors', icon: 'fa-marker', label: 'Authors', adminOnly: true },
  { to: '/admin/readers', icon: 'fa-book-reader', label: 'Readers', adminOnly: true },
  { to: '/admin/gifts', icon: 'fa-gift', label: 'Gifts', adminOnly: true },
  { to: '/admin/staff', icon: 'fa-user-shield', label: 'Staff', adminOnly: true },
]

const router = useRouter()
const auth = useAuthStore()
const profile = useProfileStore()

// Moderators only see the story tools.
const links = computed(() => allLinks.filter((link) => !link.adminOnly || profile.isAdmin))
const roleLabel = computed(() => (profile.admin ? ROLE_LABELS[profile.admin.role] : ''))

function logout() {
  auth.clearTokens()
  profile.resetAdmin()
  router.push({ path: '/admin/login' })
}
</script>

<template>
  <nav class="flex h-full flex-col bg-[#6959CD] text-white">
    <div class="mt-8 flex flex-col items-center">
      <img src="@/assets/images/logo-while.png" alt="app-logo" />
    </div>

    <div class="mt-10 flex flex-col items-center">
      <img class="mb-4 h-[75px] w-[75px] rounded-md object-cover" :src="profile.adminAvatar" alt="avatar" />
      <router-link to="/admin/profile-admin/" class="text-lg font-semibold !text-white hover:!text-blue-900">
        {{ profile.adminName }}
      </router-link>
      <span v-if="roleLabel" class="mt-1 rounded bg-white/20 px-2 py-0.5 text-xs">{{ roleLabel }}</span>
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
