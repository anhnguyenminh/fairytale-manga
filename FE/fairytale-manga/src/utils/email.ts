const EMAIL_RE = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/

export function isValidEmail(value: string): boolean {
  return EMAIL_RE.test(value)
}
