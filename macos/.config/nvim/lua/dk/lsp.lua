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

function go_org_imports(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = {only = {"source.organizeImports"}}
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

local goGroup = vim.api.nvim_create_augroup("GoGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = goGroup,
  pattern = '*.go',
  callback = function()
    go_org_imports()
    vim.lsp.buf.formatting()
  end,
})

