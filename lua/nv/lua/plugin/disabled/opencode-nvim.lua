return {
  "sudo-tee/opencode.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "saghen/blink.cmp",
    "ibhagwan/fzf-lua",
  },

  opts = {
    keymap_prefix = "<leader>a",

    ui = {
      icons = {
        -- switch all icons to text
        preset = "text",
      },
    },
  },

  event = "VeryLazy",
}
