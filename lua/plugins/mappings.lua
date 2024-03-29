-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- navigate buffer tabs with `H` and `L`
          -- L = {
          --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          --   desc = "Next buffer",
          -- },
          -- H = {
          --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          --   desc = "Previous buffer",
          -- },

          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bD"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- open dashboard when no more buffers open
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
            end,
            desc = "Close buffer",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

          -- Tab Mappings
          ["<Leader>btn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>btc"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
          ["<Leader>bth"] = { "<cmd>tabprevious<cr>", desc = "Left tab" },
          ["<Leader>btl"] = { "<cmd>tabnext<cr>", desc = "Right tab" },
          -- a table with the `name` key will register with which-key if it's available
          -- this an easy way to add menu titles in which-key
          ["<Leader>bt"] = { name = "󰓩 Tabs" },

          -- Copy/paste with system clipboard
          ["gy"] = { '"+y', desc = "Copy to system clipboard" },
          ["gp"] = { '"+p', desc = "Paste from system clipboard" },
          ["gP"] = { '"+P', desc = "Paste from system clipboard" },

          -- Move with alt in insert, terminal and command
          -- Don't `noremap` in insert mode to have these keybindings behave exactly
          -- like arrows (crucial inside TelescopePrompt)
          -- ["<M-h>"] = { "<Left>", noremap = false, desc = "Left" },
          -- ["<M-j>"] = { "<Down>", noremap = false, desc = "Down" },
          -- ["<M-k>"] = { "<Up>", noremap = false, desc = "Up" },
          -- ["<M-l>"] = { "<Right>", noremap = false, desc = "Right" },

          -- some plugin mappings
          ["<Leader>fs"] = { "<cmd>Telescope aerial<cr>", desc = "Search symbols" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<C-Space>"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
          ["<esc><esc>"] = { "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
        },
        v = {
          -- Copy/paste with system clipboard
          ["gy"] = { '"+y', desc = "yank to system clipboard" },
          ["gp"] = { '"+p', desc = "paste from system clipboard" },
          ["gP"] = { '"+P', desc = "paste from system clipboard" },

          -- Search visually selected text (slightly better than builtins in Neovim>=0.8)
          ["*"] = { [[y/\V<C-R>=escape(@", '/\')<CR><CR>]] },
          ["#"] = { [[y?\V<C-R>=escape(@", '?\')<CR><CR>]] },
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          -- K = {
          --   function()
          --     vim.lsp.buf.hover()
          --   end,
          --   desc = "Hover symbol details",
          -- },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
