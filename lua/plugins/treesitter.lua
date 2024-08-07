-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>lQ"] = { "<cmd>EditQuery<cr>", desc = "TS Live Query Editor" },
            ["<Leader>lt"] = { "<cmd>Inspect<cr>", desc = "TS Node under Cursor" },
            ["<Leader>lT"] = { "<cmd>InspectTree<cr>", desc = "Show AST" },
          },
        },
      },
    },
  },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
      -- python
      "python",
      -- cpp
      "cpp",
      "cmake",
      "make",
      -- bash
      "bash",
      "fish",
      -- git
      "diff",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitignore",
      "gitcommit",
      -- docker
      "dockerfile",
      -- cloud
      "terraform",
      -- md
      "markdown",
      "markdown_inline",
      -- general
      "json",
      "yaml",
      "toml",
      "query",
      -- sql
      "sql",
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<Leader>lz"] = "@parameter.inner",
        },
        swap_previous = {
          ["<Leader>lZ"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
    rainbow = {
      disable = {
        -- "jsx",
        -- "cpp",
      },
    },
  },
}
