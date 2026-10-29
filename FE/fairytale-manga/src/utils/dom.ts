/** First file picked in an `<input type="file">` change event. */
export function firstFile(event: Event): File | null {
  return (event.target as HTMLInputElement).files?.[0] ?? null
}

/** Swap a broken `<img>` for `fallback` (use as the `@error` handler). */
export function useFallbackImage(event: Event, fallback: string) {
  ;(event.target as HTMLImageElement).src = fallback
}
