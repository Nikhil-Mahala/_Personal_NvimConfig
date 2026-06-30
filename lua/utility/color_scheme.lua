function applyColorScheme(scheme)
    scheme = scheme or "rose-pine"

    vim.cmd.colorscheme(scheme)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

require("rose-pine").setup({
  highlight_groups = {
    Comment = { italic = false }
  }
})

applyColorScheme()
