-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "geg2102/nvim-python-repl",
    dependencies = {
      "nvim-treesitter",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>tr"] = {
                function() require("nvim-python-repl").send_statement_definition() end,
                desc = "Send semantic unit to REPL",
              },
              ["<Leader>r"] = {
                function() require("nvim-python-repl").send_statement_definition() end,
                desc = "Send semantic unit to REPL",
              },
              ["<Leader>tb"] = {
                function() require("nvim-python-repl").send_buffer_to_repl() end,
                desc = "Send entire buffer to REPL",
              },
              ["<Leader>tE"] = {
                function()
                  require("nvim-python-repl").toggle_execute()
                  require("astrocore").notify(
                    "Automatic REPL execution "
                      .. (
                        require("nvim-python-repl.config").defaults["execute_on_send"] == true and "Enabled"
                        or "Disabled"
                      )
                  )
                end,
                desc = "Toggle automatic execution",
              },
              ["<Leader>tV"] = {
                function()
                  require("nvim-python-repl").toggle_vertical()
                  require("astrocore").notify(
                    "REPL split set to "
                      .. (require("nvim-python-repl.config").defaults["vsplit"] == true and "Vertical" or "Horizontal")
                  )
                end,
                desc = "Toggle vertical/horizontal split",
              },
            },
            v = {
              ["<Leader>r"] = {
                function() require("nvim-python-repl").send_visual_to_repl() end,
                desc = "Send visual selection to REPL",
              },
            },
          },
        },
      },
    },
    ft = { "python", "lua", "scala" },
    config = function()
      require("nvim-python-repl").setup {
        execute_on_send = true,
        vsplit = true,
        spawn_command = {
          python = "ipython",
          scala = "sbt console",
          lua = "ilua",
        },
      }
    end,
  },
}
