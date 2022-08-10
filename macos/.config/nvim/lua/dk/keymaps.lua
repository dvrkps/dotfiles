local function set(mode, lhs, rhs, opts)
  vim.keymap.set(mode,lhs,rhs,opts)
end

set('i','jk','<esc>')
set('n','<enter>','O<esc>j')

set('n','<leader>w',':write<cr>')
-- set('n','<leader>q',':quit!<cr>')

set('n','<leader>q',':quit!<cr>')

local telescope = require('telescope.builtin')

set('n','<leader>ff',telescope.find_files, {})
set('n','<leader>fg',telescope.live_grep, {})
set('n', '<leader>fb',telescope.buffers,{})
set('n', '<leader>fd',telescope.diagnostics,{})

set('t','<esc>',[[<c-\><c-n>]])
set('t','jk',[[<c-\><c-n><esc>]])


local keymapsGroup = vim.api.nvim_create_augroup("KeymapsGroup", {clear= true})

vim.api.nvim_create_autocmd("FileType", {
  group = keymapsGroup,
  pattern = "go",
  callback = function()
    set('n','<leader>r', function()
      vim.cmd([[:terminal go run .]])
    end)

    set('n','<leader>t', function()
      vim.cmd([[:terminal go test -race -cover]])
    end)

    set('n','<leader>y', function()
      vim.cmd([[:terminal golangci-lint run]])
    end)

  end,
})


