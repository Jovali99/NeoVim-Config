return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- format before saving
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                cpp = { "clang_format" },
                c = { "clang_format" },
                h = { "clang_format" },
                ["objc"] = { "clang_format" }, -- optional: if working with Objective-C
                css = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                typescript = { "prettier" },
                javascript = { "prettier" },
                typescriptreact = { "prettier" },
                javascriptreact = { "prettier" },
            },
            format_on_save = {
                lsp_fallback = false, -- use formatter even if no LSP formatter
                timeout_ms = 500,     -- optional
            },
        })
    end,
}
