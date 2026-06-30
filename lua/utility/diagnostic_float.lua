vim.diagnostic.config({
    signs = false,

    underline = false,

    virtual_text = false,

    update_in_insert = false,

    float = {
        focusable = false,
        style = "minimal",
        border = "solid",
        source = "always", -- Shows which LSP gave the error (e.g., clangd)
        header = "",
        prefix = "",
    },
})

function showDiagnosticFloat()
    vim.diagnostic.config({
        signs = true,
    })
end

function hideDiagnosticFloat()
    vim.diagnostic.config({
        signs = false,
    })
end
