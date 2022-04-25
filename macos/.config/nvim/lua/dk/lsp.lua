local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function set(mode, lhs, rhs, opts)
    vim.keymap.set(mode,lhs,rhs,opts)
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { buffer=bufnr}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  set('n', 'gd', vim.lsp.buf.definition, opts)
  set('n', 'K', vim.lsp.buf.hover, opts)
  set('n', 'gi', vim.lsp.buf.implementation, opts)
  set('n', 'gs', vim.lsp.buf.signature_help, opts)
  set('n', 'gt', vim.lsp.buf.type_definition, opts)
  set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  set('n', 'gr', vim.lsp.buf.references, opts)
  set('n', '<leader>e', vim.lsp.diagnostic.show_line_diagnostics, opts)
  set('n', '<leader>[', vim.diagnostic.goto_prev, opts)
  set('n', '<leader>]', vim.diagnostic.goto_next, opts)
  set('n', '<leader>ll', vim.diagnostic.setloclist, opts)
end

nvim_lsp.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        fieldalignment = true,
	nilness = true,
	shadow = true,
	unusedparams = true,
	unusedwrite = true,
      },
      staticcheck = true,
      linksInHover = false,
    },
  },
  on_attach = on_attach,
}

function goimports(timeout_ms)
  local context = { only = { "source.organizeImports" } }
  vim.validate { context = { context, "t", true } }

  local params = vim.lsp.util.make_range_params()
  params.context = context

  -- See the implementation of the textDocument/codeAction callback
  -- (lua/vim/lsp/handler.lua) for how to do this properly.
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or next(result) == nil then return end
  local actions = result[1].result
  if not actions then return end
  local action = actions[1]

  -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
  -- is a CodeAction, it can have either an edit, a command or both. Edits
  -- should be executed first.
  if action.edit or type(action.command) == "table" then
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      vim.lsp.buf.execute_command(action.command)
    end
  else
    vim.lsp.buf.execute_command(action)
  end
end

vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]])
vim.cmd([[autocmd BufWritePre *.go lua goimports(1000)]])
