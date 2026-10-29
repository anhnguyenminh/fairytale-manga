<script setup lang="ts">
import { onMounted, shallowRef, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import Sidebar from '@/components/Admin/Sidebar.vue'
import Searchbar from '@/components/Admin/Searchbar.vue'
import Copyright from '@/components/Admin/Copyright.vue'
import { useAuthStore } from '@/stores/auth'

const router = useRouter()
const route = useRoute()
const menuOpen = shallowRef(false)

// Close the mobile drawer after navigating.
watch(() => route.fullPath, () => { menuOpen.value = false })
const auth = useAuthStore()

onMounted(() => {
  if (!auth.adminToken) router.push({ path: '/admin/login' })
})
</script>

<template>
  <div id="dashboard-admin" class="flex min-h-screen">
    <Sidebar class="hidden w-1/6 min-w-[200px] shrink-0 lg:block" />
    <a-drawer v-model:open="menuOpen" placement="left" :width="240" :closable="false" :body-style="{ padding: 0 }">
      <Sidebar class="min-h-full" />
    </a-drawer>
    <div class="flex min-w-0 flex-1 flex-col">
      <Searchbar @toggle-menu="menuOpen = true" />
      <router-view class="min-h-[1200px] flex-1" />
      <Copyright />
    </div>
  </div>
</template>
