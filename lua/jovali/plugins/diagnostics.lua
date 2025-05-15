return {
    vim.diagnostic.config({
        virtual_text = false, -- disables inline error text
        float = {
            border = "rounded",  -- or "single", "double", etc.
            focusable = false,
            source = "always",   -- show error source
            header = "",         -- optional
            prefix = "",         -- optional
        },
    }),
    vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false }) ]])
}
