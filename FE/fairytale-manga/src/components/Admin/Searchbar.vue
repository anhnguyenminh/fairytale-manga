<script setup lang="ts">
import { computed, shallowRef, watch } from 'vue'
import { useRouter } from 'vue-router'
import { MenuOutlined } from '@ant-design/icons-vue'
import { adminApi } from '@/api/client'

defineEmits<{ 'toggle-menu': [] }>()

interface SearchHit { id: number; name: string }
interface SearchResults { stories: SearchHit[]; authors: SearchHit[]; categories: SearchHit[] }

const MIN_LENGTH = 2
const DEBOUNCE_MS = 300

// Which list page each result group opens, and how it is labelled in the dropdown.
const GROUPS: { key: keyof SearchResults; label: string; to: string }[] = [
  { key: 'stories', label: 'Stories', to: '/admin/stories' },
  { key: 'authors', label: 'Authors', to: '/admin/authors' },
  { key: 'categories', label: 'Categories', to: '/admin/categories' },
]

const router = useRouter()
const query = shallowRef('')
const results = shallowRef<SearchResults | null>(null)
const searching = shallowRef(false)
let timer: ReturnType<typeof setTimeout> | undefined
let latest = 0

const options = computed(() =>
  GROUPS.filter((group) => results.value?.[group.key].length).map((group) => ({
    label: group.label,
    options: results.value![group.key].map((hit) => ({ value: `${group.key}:${hit.id}`, label: hit.name })),
  })),
)

async function search(term: string) {
  const request = ++latest
  searching.value = true
  try {
    const { data } = await adminApi.get<SearchResults>('admins/search', { params: { q: term } })
    if (request === latest) results.value = data
  } catch {
    if (request === latest) results.value = null
  } finally {
    if (request === latest) searching.value = false
  }
}

watch(query, (value) => {
  clearTimeout(timer)
  const term = value.trim()
  if (term.length < MIN_LENGTH) {
    latest++
    results.value = null
    searching.value = false
    return
  }
  timer = setTimeout(() => search(term), DEBOUNCE_MS)
})

function open(value: string) {
  const [key] = value.split(':')
  const group = GROUPS.find((g) => g.key === key)
  if (!group) return
  query.value = ''
  router.push(group.to)
}
</script>

<template>
  <nav class="mb-4 flex items-center justify-between gap-3 bg-neutral-800 p-2 shadow lg:justify-end">
    <a-button class="lg:!hidden" @click="$emit('toggle-menu')">
      <template #icon><MenuOutlined /></template>
    </a-button>
    <a-auto-complete
      v-model:value="query"
      class="!w-full sm:!w-[40%] lg:!w-[30%]"
      :options="options"
      :not-found-content="query.trim().length >= MIN_LENGTH && !searching ? 'Không tìm thấy kết quả' : null"
      @select="open"
    >
      <a-input-search placeholder="Search stories, authors, categories..." :loading="searching" />
    </a-auto-complete>
  </nav>
</template>
