require("mason").setup()

local capabilities =
    require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

vim.lsp.config('clangd', {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil;
        on_attach(client, bufnr);
    end,

    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--completion-style=detailed",
    },
    init_options = {
        fallbackFlags = {
            "-std=c++23",
            "-Wall",
            "-Wextra",
            "-Wpedantic"
        },
    },
})

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
});

vim.lsp.config("gopls", {
    capabilities = capabilities,
    on_attach = on_attach,
});

vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
    on_attach = on_attach,
});

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("rust_analyzer");
