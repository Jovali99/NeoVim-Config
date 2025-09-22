return {
    vim.diagnostic.config({
        virtual_text = false, -- disables inline error text
        float = {
            border = "rounded",  -- or "single", "double", etc.
            focusable = false,
            source = "always",   -- show error source
            header = "",         -- optional
            prefix = "",         -- optional
            anchor = "NW",        -- anchor to top-left of float
            relative = "cursor",  -- relative to cursor position
            row = 1,              -- vertical offset (1 line below)
            col = 0,              -- horizontal offset (same column)
        },
    }),
    vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false }) ]])
}
