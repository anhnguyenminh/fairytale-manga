<script setup lang="ts">
import { computed } from 'vue'
import Menu from '@/components/Client/Menu.vue'
import Footer from '@/components/Client/Footer.vue'
import GenderPopup from '@/components/Client/GenderPopup.vue'
import { usePreferencesStore } from '@/stores/preferences'

const preferences = usePreferencesStore()
const antdTheme = computed(() => ({
  token: preferences.theme ? { colorPrimary: preferences.theme.primary } : {},
}))
</script>

<template>
  <a-config-provider :theme="antdTheme">
    <div id="homepage-user" :data-theme="preferences.gender ?? undefined">
      <Menu />
      <router-view />
      <Footer />
      <GenderPopup />
    </div>
  </a-config-provider>
</template>

<style>
@import url('https://fonts.googleapis.com/css2?family=Alegreya+SC:wght@700&family=Alegreya:ital,wght@0,400;0,500;0,600;0,700;1,500;1,700&display=swap');

* {
  font-family: 'Alegreya', serif;
}

/* Ant Design's reset colours every <a> blue; the reader pages style their own links. */
:where(#homepage-user) a {
  color: inherit;
  text-decoration: none;
}

/* Bootstrap's .container used to add side padding; keep it so content doesn't touch the edge. */
#homepage-user .container {
  padding-inline: 12px;
}

/* Gender themes: override the default background of the reader area. */
[data-theme='male'] .background-home-part {
  background: linear-gradient(180deg, #0d0e13, #1c1e2b) fixed;
}
[data-theme='female'] .background-home-part {
  background: linear-gradient(210deg, #ffdde1, #ee9ca7 60%, #d6628a) fixed;
}
</style>
