/** owner > admin (quản trị viên) > moderator (kiểm duyệt viên) */
export type AdminRole = 'owner' | 'admin' | 'moderator'
export type PublishStatus = 'draft' | 'published'

export const DEFAULT_ADMIN_NAME = 'Admin Control'

export const ROLE_LABELS: Record<AdminRole, string> = {
  owner: 'Chủ sở hữu',
  admin: 'Quản trị viên',
  moderator: 'Kiểm duyệt viên',
}

export const ROLE_OPTIONS = (['owner', 'admin', 'moderator'] as AdminRole[]).map((value) => ({
  value,
  label: ROLE_LABELS[value],
}))

export const PUBLISH_OPTIONS: { value: PublishStatus; label: string }[] = [
  { value: 'draft', label: 'Nháp' },
  { value: 'published', label: 'Đã xuất bản' },
]

/** Roles an account may create, change and delete; mirrors Admin#manageable_roles on the backend. */
export function manageableRoles(role: AdminRole | undefined): AdminRole[] {
  if (role === 'owner') return ['owner', 'admin', 'moderator']
  if (role === 'admin') return ['moderator']
  return []
}
