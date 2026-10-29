import type { Config } from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{vue,ts}'],
  // Ant Design Vue ships its own reset; keep Tailwind's preflight off to avoid clashes.
  corePlugins: { preflight: false },
  theme: {
    extend: {
      fontFamily: { serif: ['Alegreya', 'serif'] },
      // Admin palette: a deep indigo-purple shared by the sidebar and the login page.
      colors: { admin: { DEFAULT: '#4A3F8F', dark: '#2F2863', light: '#F4F2FB' } },
    },
  },
} satisfies Config
