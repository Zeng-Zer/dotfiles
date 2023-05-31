return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "Zeng-Zer/flutter-riverpod-snippets",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      vim.diagnostic.config({
        virtual_text = false,
      })

      local function border(hl_name)
        return {
          { "╭", hl_name },
          { "─", hl_name },
          { "╮", hl_name },
          { "│", hl_name },
          { "╯", hl_name },
          { "─", hl_name },
          { "╰", hl_name },
          { "│", hl_name },
        }
      end

      cmp.setup({
        window = {
          completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
          },
          documentation = {
            border = border "CmpDocBorder",
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp.config.disable,
          ["<C-n>"] = cmp.config.disable,
          ["<C-p>"] = cmp.config.disable,
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), -- next suggestion
          ["<C-u>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 4 }), -- previous suggestion
          ["<C-d>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 4 }), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-5),
          ["<C-x>"] = cmp.mapping.scroll_docs(5),
          -- toggle completion menu because of copilot
          ["<C-e>"] = function()
            if cmp.visible() then
              cmp.abort()
            else
              cmp.complete()
            end
          end,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              local entry = cmp.get_selected_entry()
              if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                cmp.confirm()
              end
            else
              fallback()
            end
          end, {"i","s"}),
        }),
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            priority = 10,
            entry_filter = function(entry, _)
              local kind = require('cmp.types').lsp.CompletionItemKind[entry:get_kind()]
              if kind == "Text" then return false end
              return true
            end
          }, -- lsp
          { name = "luasnip", priority = 10 }, -- snippets
          { name = "buffer", priority = 9 }, -- text within current buffer
          { name = "path", priority = 8 }, -- file system paths
        }),
      })
    end,
  },
}
