<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useAuthStore } from '@/stores/auth'
import { useProfileStore } from '@/stores/profile'
import { ROLE_LABELS } from '@/constants/admin'

interface MenuLink { to: string; icon: string; label: string; managerOnly?: boolean }

const allLinks: MenuLink[] = [
  { to: '/admin/stories/', icon: 'fa-books', label: 'Stories' },
  { to: '/admin/categories', icon: 'fa-th-large', label: 'Categories', managerOnly: true },
  { to: '/admin/authors', icon: 'fa-marker', label: 'Authors', managerOnly: true },
  { to: '/admin/readers', icon: 'fa-book-reader', label: 'Readers', managerOnly: true },
  { to: '/admin/gifts', icon: 'fa-gift', label: 'Gifts', managerOnly: true },
  { to: '/admin/staff', icon: 'fa-user-shield', label: 'Staff', managerOnly: true },
]

const router = useRouter()
const route = useRoute()
const auth = useAuthStore()
const profile = useProfileStore()

// Moderators only see the story tools.
const links = computed(() => allLinks.filter((link) => !link.managerOnly || profile.isManager))
const roleLabel = computed(() => (profile.admin ? ROLE_LABELS[profile.admin.role] : ''))

// A link is active on its own page and on every page below it (e.g. /admin/stories/update/3).
// The dashboard root (/admin) shows the stories list, so it counts for Stories too.
function isActive(link: MenuLink): boolean {
  const base = link.to.replace(/\/$/, '')
  if (link.to === '/admin/stories/' && /^\/admin\/?$/.test(route.path)) return true
  return route.path === base || route.path.startsWith(`${base}/`)
}

const profileActive = computed(() => route.path.startsWith('/admin/profile-admin'))

function logout() {
  auth.clearTokens()
  profile.resetAdmin()
  router.push({ path: '/admin/login' })
}
</script>

<template>
  <nav class="flex flex-col bg-admin text-white">
    <div class="mt-8 flex flex-col items-center">
      <img src="@/assets/images/logo-while.png" alt="app-logo" />
    </div>

    <div class="mt-10 flex flex-col items-center">
      <img class="mb-4 h-[75px] w-[75px] rounded-md object-cover" :src="profile.adminAvatar" alt="avatar" />
      <router-link
        to="/admin/profile-admin/"
        class="rounded px-2 text-lg font-semibold no-underline !text-white"
        :class="{ 'bg-white/25': profileActive }"
        :aria-current="profileActive ? 'page' : undefined"
      >
        {{ profile.adminName }}
      </router-link>
      <span v-if="roleLabel" class="mt-1 rounded bg-white/20 px-2 py-0.5 text-xs">{{ roleLabel }}</span>
    </div>

    <div class="mt-6 flex flex-col">
      <router-link
        v-for="link in links"
        :key="link.to"
        :to="link.to"
        class="menu-item flex items-center gap-4 border-l-4 px-6 py-3 text-lg font-bold no-underline transition-colors"
        :class="isActive(link) ? 'border-white bg-admin-light !text-admin' : 'border-transparent !text-white hover:bg-white/20'"
        :aria-current="isActive(link) ? 'page' : undefined"
      >
        <i :class="['fas', 'w-6 text-center', link.icon]"></i>
        <span>{{ link.label }}</span>
      </router-link>
      <div
        class="menu-item flex cursor-pointer items-center gap-4 border-l-4 border-transparent px-6 py-3 text-lg font-bold no-underline transition-colors hover:bg-white/20"
        @click="logout"
      >
        <i class="fas fa-sign-out-alt w-6 text-center"></i>
        <span>Logout</span>
      </div>
    </div>
  </nav>
</template>
