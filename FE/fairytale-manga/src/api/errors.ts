interface ApiErrorBody {
  message?: string
}

/** Message from a failed API call, or `fallback` when the response carries none. */
export function getApiError(err: unknown, fallback = 'Request failed'): string {
  const body = (err as { response?: { data?: ApiErrorBody } }).response?.data
  return body?.message ?? fallback
}
