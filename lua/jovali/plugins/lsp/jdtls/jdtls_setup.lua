local M = {}

function M.setup()
    --If jdtls stops working try deleting the workspace and reinstalling jdtls. remember to update jar path
    local jdtls = require("jdtls")
    local jdtls_setup = require("jdtls.setup")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local home = os.getenv("USERPROFILE")
    local jdtls_jar_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.800.v20240330-1250.jar"
    -- THE JAR Path changes when jdtls is updated
    local jdtls_config_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win"
    --local jdtls_workspace_path = home .. "\\AppData\\Local\\nvim-data\\jdtls-workspace"

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = jdtls_setup.find_root(root_markers)

    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    local jdtls_workspace_path = home .. "\\.cache\\jdtls\\workspace\\" .. project_name
    print(jdtls_workspace_path)
    local config = {
        -- The command that starts the language server
        cmd = {
            -- 💀
            'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-jar', jdtls_jar_path,
            '-configuration', jdtls_config_path,
            '-data', jdtls_workspace_path,
        },

        root_dir = root_dir,

        settings = {
            java = {
            }
        },
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            bundles = {}
        },
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(config)
    -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
end

return M
