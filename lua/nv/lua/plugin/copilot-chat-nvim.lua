-- Chat with GitHub Copilot in Neovim.

return {
  "CopilotC-Nvim/CopilotChat.nvim",

  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },

  build = "make tiktoken",

  opts = {},

  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatStop",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatPrompts",
    "CopilotChatModels",
    "CopilotCha",
  },
}
