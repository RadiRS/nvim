local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    background = {
      fg = '#A4895C',
      bg = '#0F0908',
    },
    buffer_selected = {
      fg = '#F2DDBC',
      -- bg = '#66292F',
      bold = true,
    },
    fill = {
      bg = '#1F1311'
    }
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})

-- Reference Colors
--#F2DDBC
--#E0CCAE
--#a4896f
--#A4895C
--#66292F
--#8A4B53
--#BF472C
--#D47D49
--#F2A766
--#A67458
--#6B4035
--#291916
--#1F1311
--#0F0908
