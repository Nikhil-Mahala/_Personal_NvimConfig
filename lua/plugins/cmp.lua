local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    completion = {
        autocomplete = false,
        completeopt = "menu,menuone,noinsert,noselect",
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        ["<Tab>"] = cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Select,
        }),

        ["<S-Tab>"] = cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Select,
        }),

        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),

        ["<C-y>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    }),

    sources = cmp.config.sources({
        {
            name = "nvim_lsp",

            entry_filter = function(entry)
                local kind = require("cmp.types").lsp.CompletionItemKind[
                    entry:get_kind()
                ]

                local ok, client_name = pcall(function()
                    return entry.source.source.client.name
                end)

                if not ok then
                    return true
                end

                if client_name == "clangd" then
                    return (
                        kind == "Method"
                        or kind == "Field"
                        or kind == "Property"
                        or kind == "Operator"
                    )
                elseif client_name == "ts_ls" then
                    return kind ~= "Text"
                end

                return true
            end,
        },

        { name = "luasnip" },
    }, {
        { name = "buffer" },
    }),

    formatting = {
        fields = { "kind", "abbr", "menu" },
    },

    experimental = {
        ghost_text = false,
    },
})
