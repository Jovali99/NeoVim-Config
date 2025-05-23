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
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure html server
        lspconfig["html"].setup({
            capabilities = capabilities,
            init_options = {
                configurationSection = { "html", "javascript" },
                embeddedLanguages = {
                    javascript = true
                },
                provideFormatter = true
            },
            on_attach = on_attach,
        })

        -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- run ":!npm i -g typescript-language-server"
        -- configure typescript server with plugin
        lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            filetypes = { 'html', 'javascript', 'javascript.jsx', 'javascriptreact' , 'typescript', 'typescriptreact', 'typescript.tsx'},
            on_attach = on_attach,
        })

        -- configure lua_ls with plugin
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
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

        -- configure "pyright-langserver" server with plugin
        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure "gopls" server with plugin
        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- run ":!npm i -g @angular/language-server"
        -- configure "angularls" server with plugin
        --local project_library_path = "/Users/darki/Jobb/adapp/frontend/node_modules/"                                                    --Laptop adapp location
        --local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path}      --Laptop adapp location
        local project_library_path = "/Users/darki/AppData/Roaming/npm/node_modules"
        local cmd = {"node",  "/Users/darki/AppData/Roaming/npm/node_modules/@angular/language-server","--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}
        lspconfig["angularls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = cmd,
            on_new_config = function(new_config,new_root_dir)
                new_config.cmd = cmd
            end,
        })
    end,
}
