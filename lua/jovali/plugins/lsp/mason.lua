return {
	"williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
          --languages = {
          --    angular = {
          --        cmd = { "ngserver", "--stdio" },
          --        filetypes = { "typescript", "html" },
          --        rootPatterns = { "angular.json" },  -- Specify the pattern for your angular.json file
          --    },
          --},
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "lua_ls",
                "pyright",
                "gopls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
