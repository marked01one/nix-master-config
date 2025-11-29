from qutebrowser.api import interceptor
from PyQt6.QtCore import QUrl

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
  req.redirect(url)


def redirect_nix_shortcuts(req: interceptor.Request):
  """
  Redirect `nix:<shortcut>` addresses to their according sites.
  """
  url = req.request_url
  hostname = url.host(QUrl.ComponentFormattingOption.PrettyDecoded)
  path = url.path(QUrl.ComponentFormattingOption.PrettyDecoded)
  # Bypass any requests that's not of scheme `nix:<anything>`
  if hostname != 'nix.default-redirector': return

  shortcuts = {
    "/search": "https://search.nixos.org/packages?channel=unstable",
    "/hm-opts": "https://home-manager-options.extranix.com/",
    "/wiki": "https://wiki.nixos.org/",
  }

  # If path not found: redirect to default NixOS intro page for now.
  redirect_url = shortcuts.get(path, "https://nixos.org/")
  url.setUrl(redirect_url)

  # Try redirecting.
  req.redirect(url)
