export type AdminRole = 'admin' | 'moderator'
export type PublishStatus = 'draft' | 'published'

export const DEFAULT_ADMIN_NAME = 'Admin Control'

export const ROLE_LABELS: Record<AdminRole, string> = {
  admin: 'Quản trị viên',
  moderator: 'Kiểm duyệt viên',
}

export const ROLE_OPTIONS = (Object.keys(ROLE_LABELS) as AdminRole[]).map((value) => ({
  value,
  label: ROLE_LABELS[value],
}))

export const PUBLISH_OPTIONS: { value: PublishStatus; label: string }[] = [
  { value: 'draft', label: 'Nháp' },
  { value: 'published', label: 'Đã xuất bản' },
]
