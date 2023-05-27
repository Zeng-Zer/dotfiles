return {
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
      --Please make sure you install markdown and markdown_inline parser
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = true,
          keys = {
            -- string | table type
            quit = { "q", "<ESC>" },
            exec = "<CR>",
          },
        },
        finder = {
          max_height = 0.5,
          min_width = 30,
          force_max_height = false,
          keys = {
            jump_to = 'p',
            expand_or_jump = 'o',
            vsplit = 's',
            split = 'i',
            tabe = 't',
            tabnew = 'r',
            quit = { 'q', '<ESC>' },
            close_in_preview = '<ESC>',
          },
        },
        lightbulb = {
          enable = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
        diagnostic = {
          on_insert = false,
          on_insert_follow = false,
          insert_winblend = 0,
          show_code_action = true,
          show_source = true,
          jump_num_shortcut = true,
          max_width = 0.7,
          max_height = 0.6,
          max_show_width = 0.9,
          max_show_height = 0.6,
          text_hl_follow = true,
          border_follow = true,
          extend_relatedInformation = false,
          keys = {
            exec_action = 'o',
            quit = 'q',
            expand_or_jump = '<CR>',
            quit_in_show = { 'q', '<ESC>' },
          },
        },
        rename = {
          quit = '<ESC>',
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = true,
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- "RobertBrunhage/flutter-riverpod-snippets",
      "Zeng-Zer/flutter-riverpod-snippets",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
      "j-hui/fidget.nvim",
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
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), -- next suggestion
          ["<C-u>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select, count = 5 }), -- previous suggestion
          ["<C-d>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select, count = 5 }), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-5),
          ["<C-f>"] = cmp.mapping.scroll_docs(5),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
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

      -- auto format on save for dart files
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = '*.dart',
        callback = function()
          vim.lsp.buf.format { async = false }
        end
      })

      require("fidget").setup({})
    end,
  },
}
