local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

local is_image = function(filepath)
  local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
  local split_path = vim.split(filepath:lower(), ".", { plain = true })
  local extension = split_path[#split_path]
  return vim.tbl_contains(image_extensions, extension)
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      }
    },
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _)
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d .. "\r\n")
            end
          end

          vim.fn.jobstart({
            "viu",
            "-b",
            filepath,
          }, {
            on_stdout = send_output,
            stdout_buffered = true,
          })
        else
          require("telescope.previewers.utils").set_preview_message(
            bufnr,
            opts.winid,
            "Binary cannot be previewed"
          )
        end
      end,
    },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw add use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- custom insert mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        }
      }
    },
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }


-- Keymaps

vim.keymap.set(
  'n', ';f', '<cmd> lua require("telescope.builtin").find_files({ no_ignore = false })<cr>',
  opts
)
vim.keymap.set(
  'n', ';r', '<cmd> lua require("telescope.builtin").live_grep()<cr>',
  opts
)
vim.keymap.set(
  'n', '\\\\', '<cmd> lua require("telescope.builtin").buffers()<cr>',
  opts
)
vim.keymap.set(
  'n', ';t', '<cmd> lua require("telescope.builtin").help_tags()<cr>',
  opts
)
vim.keymap.set(
  'n', ';;', '<cmd> lua require("telescope.builtin").resume()<cr>',
  opts
)
vim.keymap.set(
  'n', ';e', '<cmd> lua require("telescope.builtin").diagnostics()<cr>',
  opts
)
vim.keymap.set(
  'n', 'sf',
  '<cmd> lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } })<cr>'
  ,
  opts
)
