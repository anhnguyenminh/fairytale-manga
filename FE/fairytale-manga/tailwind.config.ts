import type { Config } from 'tailwindcss'

export default {
  content: ['./index.html', './src/**/*.{vue,ts}'],
  // Ant Design Vue ships its own reset; keep Tailwind's preflight off to avoid clashes.
  corePlugins: { preflight: false },
  theme: { extend: { fontFamily: { serif: ['Alegreya', 'serif'] } } },
} satisfies Config
