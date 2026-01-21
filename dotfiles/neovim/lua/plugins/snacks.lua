return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
      trash = true,
    },
    picker = {
      sources = {
        -- File explorer configurations
        explorer = {
          focus = "list",
          layout = {
            preset = "sidebar",
            preview = true,
            layout = { position = "right" }
          },
        },

        icons = {
          git = {
            enabled = true,
            staged = "●",
            added = "A",
            deleted = "D",
            ignored = "",
            modified = "M",
            renamed = "R",
            untracked = "U",
          },
        };
      }
    }
  },
}
