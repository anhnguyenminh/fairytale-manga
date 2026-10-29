export type Gender = 'male' | 'female'

export interface GenderTheme {
  label: string
  /** Ant Design primary colour for this theme. */
  primary: string
  /** Illustration shown next to the login form. */
  loginImage: string
}

export const GENDER_THEMES: Record<Gender, GenderTheme> = {
  male: {
    label: 'Nam',
    primary: '#2b2d42',
    loginImage: 'https://i.pinimg.com/564x/07/2e/5e/072e5ea3323de9dc0b6256058c70ef99.jpg',
  },
  female: {
    label: 'Nữ',
    primary: '#d6628a',
    loginImage: 'https://i.pinimg.com/564x/c2/70/ed/c270edfd62cb6fd905e48dea39b04a5e.jpg',
  },
}

/** Admin-side choice for a category: empty string means "suggest to everyone". */
export const TARGET_GENDER_OPTIONS = [
  { value: '', label: 'Cả hai giới (mặc định)' },
  { value: 'male', label: 'Chỉ nam' },
  { value: 'female', label: 'Chỉ nữ' },
]
