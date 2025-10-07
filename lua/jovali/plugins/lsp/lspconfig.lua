return { 
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'mfussenegger/nvim-jdtls',
    },
    opts = {
        setup = {
            jdtls = function()
                return true -- avoid duplicate servers
            end,
        },
    },
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local on_attach = function(client, bufnr)
          local bufmap = function(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Example keybindings:
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
          bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
          bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

          -- optionally disable formatting for some servers:
          -- client.server_capabilities.documentFormattingProvider = false
        end

        -- configure html server
        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua_ls with plugin
        vim.lsp.config("lua_ls", {
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
                
            },
        })
        -- Enable all the language servers
        vim.lsp.enable("html")
        vim.lsp.enable("cssls")
        vim.lsp.enable("ts_ls")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("gopls")
        vim.lsp.enable("clangd")

        -- run ":!npm i -g @angular/language-server"
        -- configure "angularls" server with plugin
        local ts_probe = "C:/nvm4w/nodejs/node_modules"
        local project_library_path = "/Users/darki/AppData/Roaming/npm/node_modules"
        local cmd = {"node",
                      "/Users/darki/AppData/Roaming/npm/node_modules/@angular/language-server",
                      "--stdio",
                      "--tsProbeLocations", ts_probe,
                      "--ngProbeLocations", ts_probe}
        vim.lsp.config("angularls", {
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = cmd,
            on_new_config = function(new_config,new_root_dir)
                new_config.cmd = cmd
            end,
        })
    end,
}
