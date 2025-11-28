from qutebrowser.api import interceptor

def redirect_to_https(req: interceptor.Request):
  """
  Rewrite all HTTP requests to HTTPS, except for localhost
  """
  url = req.request_url
  # Bypass non-HTTP requests.
  if url.scheme() != 'http': return
  # Ignore localhost.
  if url.host() in ['localhost', '127.0.0.1', '::1']: return

  url.setScheme('https')

  # Try redirecting to HTTPS address.
  try:
    req.redirect(url)
  except Exception:
    pass
