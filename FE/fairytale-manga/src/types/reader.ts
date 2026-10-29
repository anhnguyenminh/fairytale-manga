/** Shapes returned by the reader-facing API (readers/*). */
export interface ReaderChapterRef {
  id?: number
  name: string
  time?: string
}

export interface ReaderStory {
  id: number
  name: string
  image_url: string
  views: number
  chapter?: ReaderChapterRef
  /** Present on recommend/for_gender responses instead of `chapter`. */
  last_chap?: ReaderChapterRef
}

export interface ReaderChapter {
  name?: string
  images_url?: string[]
}

export interface StoryDetails {
  name?: string
  description?: string
  image_url?: string
  author_name?: string
  status?: string
  views?: number
  category?: { name: string }[]
  first_chap?: ReaderChapterRef
  last_chap?: ReaderChapterRef
  chapter?: ReaderChapterRef[]
}
