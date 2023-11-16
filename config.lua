-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- -- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

lvim.plugins = {
    -- { "lunarvim/colorschemes" },
    -- {
    --     "stevearc/dressing.nvim",
    --     config = function()
    --         require("dressing").setup({
    --             input = { enabled = false },
    --         })
    --     end,
    -- },
    {"nvim-tree/nvim-web-devicons"},
    {
        "nvim-neorg/neorg",
        ft = "norg",   -- lazy-load on filetype
        config = true, -- run require("neorg").setup()
    },
    {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function()
            require("spectre").setup()
        end,
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "mrjones2014/nvim-ts-rainbow",
    },
    {
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120,              -- Width of the floating window
                height = 25,              -- Height of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false,            -- Print debug information
                opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "aca/emmet-ls",
        config = function()
            local lspconfig = require("lspconfig")
            local configs = require("lspconfig/configs")

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                },
            }

            if not lspconfig.emmet_ls then
                configs.emmet_ls = {
                    default_config = {
                        cmd = { "emmet-ls", "--stdio" },
                        filetypes = {
                            "html",
                            "css",
                            "javascript",
                            "typescript",
                            "eruby",
                            "typescriptreact",
                            "javascriptreact",
                            "svelte",
                            "vue",
                        },
                        root_dir = function(fname)
                            return vim.loop.cwd()
                        end,
                        settings = {},
                    },
                }
            end
            lspconfig.emmet_ls.setup({ capabilities = capabilities })
        end,
    },
}


-- Plugin configurations
lvim.builtin.treesitter.rainbow.enable = true
