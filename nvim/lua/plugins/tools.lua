return {

  
    ---- C O R E ----

    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup(
                {
                    ensure_installed = { "python", "java", "lua", "javascript", },
                    sync_install = false,
                    highlight = { enable = true },
                    indent = { enable = true },
                }
            )
        end
    },

    {
        "nvim-lua/plenary.nvim",
        lazy = false,
    },

    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
        keys = {
            {	
				"<leader>fp",
				function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() }) end,
				desc = "Find Plugin File",
			},
            {
                "<leader>fg",
                function() require("telescope.builtin").live_grep({ cwd = vim.fn.getcwd() }) end,
                desc = "Find Plugin Grep",
            },
            {
              "<leader>fb",
                function() require("telescope.builtin").buffers() end,
                desc = "Find Plugin Buffers",  
            },
            {
                "<leader>fm",
                function() require("telescope.builtin").marks() end,
                desc = "Find Plugin Marks",
            } 
        },


    },

    ---------------------


    ---- V E R S I O N  C O N T R O L ----
    {
       "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        },

    },
        
    ---------------------

    
    ---- L S P / A U T O C O M P L E T E / I N T E L L I S E N S E ----

    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lspconfig').pyright.setup({})
        end,
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
          {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
          },
          {
            "<leader>xX",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
          },
          {
            "<leader>cs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
          },
          {
            "<leader>cl",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
          },
          {
            "<leader>xL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
          },
          {
            "<leader>xQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
          },
        },
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", 
        build = "make install_jsregexp",
    },

    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false
    },
    
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",  
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end,
                  },
                  window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                  },
                  mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                  }),
                  sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                  }, {
                    { name = 'buffer' },
                  })
            })
        end,
    },

    {
        "hrsh7th/cmp-buffer"
    },

    {
        "hrsh7th/cmp-path"
    },

    {
        "hrsh7th/cmp-cmdline"
    },

    ---------------------


     --- D E P E N D E N C I E S ---

    {
        "BurntSushi/ripgrep",
        lazy = false,
    },

    
    {
        "nvim-tree/nvim-web-devicons",
        lazy = false,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",   
        lazy = false,
    },
    
    ---------------------
}