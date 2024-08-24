vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "tabs",
    separator_style = "slope",
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = " ", -- use a "true" to enable the default, or set your own character
      }
    },
   -- theme = 'nord',
  }
}
