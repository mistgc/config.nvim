local function on_attach(client, buffer)
    -- This callback is called when the LSP is atttached/enabled for this buffer
    -- we could set keymaps related to LSP, etc here.
    local bufopts = { noremap = true, silent = true, buffer = buffer }

    -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", bufopts)
    -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", bufopts)
    -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
    vim.keymap.set("n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", bufopts)
    -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
    vim.keymap.set("n", "<leader>ca", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", bufopts)
    -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
    vim.keymap.set("n", "<leader>cn", "<cmd>Lspsaga rename<CR>", bufopts)
    -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
    vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", bufopts)
    -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
    -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
    vim.keymap.set("n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
    -- 悬浮窗口上翻页，由 Lspsaga 提供
    vim.keymap.set("n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", bufopts)
    -- 悬浮窗口下翻页，由 Lspsaga 提供
    vim.keymap.set("n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", bufopts)

    -- ** auto format when saving a file **
    -- ** if need this, plz enable it mannually. **

    -- auto format when save a file
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('LspFormatting', { clear = true }),
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format()
        end
    })
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
                inlayHints = { locationLinks = false },
            },
        },
    },
}

require("rust-tools").setup(opts)
