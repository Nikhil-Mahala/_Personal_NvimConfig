local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp',
	  entry_filter = function(entry, _)
		  local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

		  local status, client_name = pcall(function()
			  return entry.source.source.client.name
		  end)

		  if not status then
			  return true
		  end

          if client_name == "clangd" then
              return (
                  kind == "Method" or
                  kind == "Function" or
                  kind == "Constructor" or
                  kind == "Field" or
                  kind == "Property" or
                  kind == "EnumMember" or
                  kind == "Struct" or
                  kind == "Operator" or
                  kind == "Class"
              )
          elseif client_name == "ts_ls" then
              return not(kind == "Text")
          end

		  return true
	  end
	},
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
