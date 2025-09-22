return {
  "akinsho/toggleterm.nvim",
  version = "*", -- Use the latest version
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[§]],
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal", -- "vertical" | "horizontal" | "float"
      close_on_exit = true,
      shell = vim.o.shell,
    })
  end,
}
