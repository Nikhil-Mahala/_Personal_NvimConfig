require("nvim-treesitter.config").setup({
    ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c",
        "cpp",
        "cmake",
        "bash",
        "json",
        "markdown",
    },

    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})
