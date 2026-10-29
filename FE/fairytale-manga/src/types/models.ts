/** Mirrors Backend/app/controllers/concerns/response.rb#meta_data (Pagy). */
export interface PageMeta {
  total?: number
  page?: number
  from?: number
  to?: number
  pages?: number
  perpage?: number
}

export interface Category { id: number; name: string; description?: string; target_gender?: 'male' | 'female' | null }
export interface Author { id: number; name: string; description?: string }
export interface Gift { id: number; name: string; score: number; stock: number; image_url?: string }
export interface Reader {
  id: number
  email: string
  name?: string
  age?: number
  address?: string
  phonenumber?: string
  ban?: boolean
  score?: number
  show_gender?: string
}
export interface Story {
  id: number
  name: string
  description?: string
  status?: string
  author_name?: string
  category?: unknown
}
export interface Chapter { id: number; name: string; images_url?: string[] }
export interface SelectOption { value: number; label: string }
