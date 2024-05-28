return {
    'mfussenegger/nvim-jdtls',
--  ft = { "java" },
--  config = function()
--      local jdtls = require("jdtls")
--      local jdtls_setup = require("jdtls.setup")
--      local capabilities = require("cmp_nvim_lsp").default_capabilities()

--      local home = os.getenv("USERPROFILE")
--      local jdtls_jar_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.800.v20240304-1850.jar"
--      local jdtls_config_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win"
--      --local jdtls_workspace_path = home .. "\\AppData\\Local\\nvim-data\\jdtls-workspace"

--      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
--      local root_dir = jdtls_setup.find_root(root_markers)
--      local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
--      local jdtls_workspace_path = home .. "\\.cache\\jdtls\\workspace" .. project_name

--      local config = {
--          -- The command that starts the language server
--          cmd = {
--              -- 💀
--              'java', -- or '/path/to/java17_or_newer/bin/java'
--              -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--              '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--              '-Dosgi.bundles.defaultStartLevel=4',
--              '-Declipse.product=org.eclipse.jdt.ls.core.product',
--              '-Dlog.protocol=true',
--              '-Dlog.level=ALL',
--              '-Xmx1g',
--              '--add-modules=ALL-SYSTEM',
--              '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--              '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--              '-jar', jdtls_jar_path,
--              '-configuration', jdtls_config_path,
--              '-data', jdtls_workspace_path,
--          },

--          -- 💀
--          -- This is the default if not provided, you can remove it. Or adjust as needed.
--          -- One dedicated LSP server & client will be started per unique root_dir
--          root_dir = require('jdtls.setup').find_root({'.git', 'mvnw',  'pom.xml', 'gradlew', 'build.gradle'}),

--          -- Here you can configure eclipse.jdt.ls specific settings
--          -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--          -- for a list of options
--          settings = {
--              java = {
--              }
--          },
--          on_attach = on_attach,
--          capabilities = capabilities,

--          -- Language server `initializationOptions`
--          -- You need to extend the `bundles` with paths to jar files
--          -- if you want to use additional eclipse.jdt.ls plugins.
--          --
--          -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--          --
--          -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--          init_options = {
--              bundles = {}
--          },
--      }
--      -- This starts a new client & server,
--      -- or attaches to an existing client & server depending on the `root_dir`.
--      require('jdtls').start_or_attach(config)
--      -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
--  end
}

