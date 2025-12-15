from dataclasses import dataclass
import os

from components.utils import Utils


@dataclass
class ColorsBase16:
  base00: str | None = None
  base01: str | None = None
  base02: str | None = None
  base03: str | None = None
  base04: str | None = None
  base05: str | None = None
  base06: str | None = None
  base07: str | None = None
  base08: str | None = None
  base09: str | None = None
  base0A: str | None = None
  base0B: str | None = None
  base0C: str | None = None
  base0D: str | None = None
  base0E: str | None = None
  base0F: str | None = None


  def get_scheme(self):
    """Extract base16 color scheme from stylix environment variables."""
    hex_codes = [
      os.getenv('STYLIX_BASE_0' + hex(i).replace('0x', '').capitalize())
      for i in range(16)
    ]
    color_codes = {
      f'base0{hex(i).replace('0x', '').capitalize()}': hex_codes[i]
      for i in range(16) if hex_codes[i]
    }

    # Fallback to `base16-cappuccin-mocha` if Stylix theme cannot be found.
    self.base00 = color_codes.get('base00', '#1e1e2e')
    self.base01 = color_codes.get('base01', '#181825')
    self.base02 = color_codes.get('base02', '#313244')
    self.base03 = color_codes.get('base03', '#45475a')
    self.base04 = color_codes.get('base04', '#585b70')
    self.base05 = color_codes.get('base05', '#cdd6f4')
    self.base06 = color_codes.get('base06', '#f5e0dc')
    self.base07 = color_codes.get('base07', '#b4befe')
    self.base08 = color_codes.get('base08', '#f38ba8')
    self.base09 = color_codes.get('base09', '#fab387')
    self.base0A = color_codes.get('base0A', '#f9e2af')
    self.base0B = color_codes.get('base0B', '#a6e3a1')
    self.base0C = color_codes.get('base0C', '#94e2d5')
    self.base0D = color_codes.get('base0D', '#89b4fa')
    self.base0E = color_codes.get('base0E', '#cba6f7')
    self.base0F = color_codes.get('base0F', '#f2cdcd')
