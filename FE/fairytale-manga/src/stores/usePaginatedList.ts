import { shallowRef, ref, type Ref } from 'vue'
import type { PageMeta } from '@/types/models'
import { adminApi } from '@/api/client'

/** Shared shape for the paginated admin lists (stories, authors, categories, gifts, readers). */
export function usePaginatedList<T>(endpoint: string, key: string) {
  const items = ref([]) as Ref<T[]>
  const meta = ref<PageMeta>({})
  const currentPage = shallowRef(1)

  async function fetchPage() {
    try {
      const { data } = await adminApi.get(endpoint, { params: { page: currentPage.value } })
      items.value = data[key]
      meta.value = data.meta
    } catch (err) {
      console.error(err)
    }
  }

  function setCurrentPage(page: number) {
    currentPage.value = page
  }

  return { items, meta, currentPage, fetchPage, setCurrentPage }
}
