import type { AdminRole, PublishStatus } from '@/constants/admin'

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
  publish_status?: PublishStatus
  description?: string
  status?: string
  author_name?: string
  category?: unknown
}
export interface Chapter { id: number; name: string; images_url?: string[] }
export interface SelectOption { value: number; label: string }

export interface AdminProfile {
  id: number
  email: string
  username: string | null
  full_name: string | null
  phone: string | null
  bio: string | null
  role: AdminRole
  image_url: string | null
}
