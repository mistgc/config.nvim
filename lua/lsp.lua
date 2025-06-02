vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("cmake")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    -- [obtain LSP client]
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- [basic keymaps]
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Get Hover Document" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "LSP: Goto Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: Goto Decalaration" })
    vim.keymap.set("n", "<leader>ld", function()
      vim.diagnostic.open_float({ source = true })
    end, { buffer = event.buf, desc = "LSP: Show Diagnostic" })
    vim.keymap.set(
      "n",
      "<leader>td",
      (function()
        local diag_status = 1 -- 1 is show; 0 is hide
        return function()
          if diag_status == 1 then
            diag_status = 0
            vim.diagnostic.config({ underline = false, virtual_text = false, signs = false, update_in_insert = false })
          else
            diag_status = 1
            vim.diagnostic.config({ underline = true, virtual_text = true, signs = true, update_in_insert = true })
          end
        end
      end)(),
      { buffer = event.buf, desc = "LSP: Toggle Diagnostics" }
    )

    -- [diagnostics]
    vim.diagnostic.config({
      virtual_text = {
        spacing = 4,
        prefix = "●",
      },
      float = { severity_sort = true },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "●",
          [vim.diagnostic.severity.WARN] = "●",
          [vim.diagnostic.severity.INFO] = "●",
          [vim.diagnostic.severity.HINT] = "●",
        },
      },
    })

    -- [inlay hint]
    if client and client:supports_method("textDocument/inlayHint") then
      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, { buffer = event.buf, desc = "LSP: Toggle Inlay Hint" })
    end

    -- [highlight words under cursor]
    if client and client:supports_method("textDocument/documentHighlight") then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- [offloads upon detachment]
    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
      end,
    })
  end,
})
