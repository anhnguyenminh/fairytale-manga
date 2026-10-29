import { computed, shallowRef } from 'vue'
import type { PageMeta } from '@/types/models'
import { adminApi } from '@/api/client'

const DEFAULT_PAGE_SIZE = 20

type ListResponse<T> = Record<string, T[]> & { meta: PageMeta }

/** Shared shape for the paginated admin lists (stories, authors, categories, gifts, readers). */
export function usePaginatedList<T>(endpoint: string, key: string) {
  const items = shallowRef<T[]>([])
  const meta = shallowRef<PageMeta>({})
  const currentPage = shallowRef(1)

  const totalPages = computed(() => Number(meta.value.pages ?? 0))
  const totalCount = computed(() => Number(meta.value.total ?? 0))
  const pageSize = computed(() => Number(meta.value.perpage ?? DEFAULT_PAGE_SIZE))

  async function fetchPage() {
    try {
      const { data } = await adminApi.get<ListResponse<T>>(endpoint, { params: { page: currentPage.value } })
      items.value = data[key]
      meta.value = data.meta
    } catch (err) {
      console.error(err)
    }
  }

  function setCurrentPage(page: number) {
    currentPage.value = page
  }

  async function goToPage(page: number) {
    setCurrentPage(page)
    await fetchPage()
  }

  return { items, meta, currentPage, totalPages, totalCount, pageSize, fetchPage, setCurrentPage, goToPage }
}
