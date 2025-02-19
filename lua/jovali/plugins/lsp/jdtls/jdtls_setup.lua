local M = {}

function M.setup()
    --If jdtls stops working try deleting the workspace and reinstalling jdtls. remember to update jar path
    local jdtls = require("jdtls")
    local jdtls_setup = require("jdtls.setup")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local home = os.getenv("USERPROFILE")
    local jdtls_jar_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
    -- THE JAR Path changes when jdtls is updated
    local jdtls_config_path = home .. "\\AppData\\Local\\nvim-data\\mason\\packages\\jdtls\\config_win"
    --local jdtls_workspace_path = home .. "\\AppData\\Local\\nvim-data\\jdtls-workspace"

    local is_file_exist = function(path)
        local f = io.open(path, 'r')
        return f ~= nil and io.close(f)
    end

    local get_lombok_javaagent = function()
        local lombok_dir = home .. "\\.m2\\repository\\org\\projectlombok\\lombok\\"
        local command = 'powershell -Command "Get-ChildItem -Path \'' .. lombok_dir .. '\' -Name | Sort-Object -Descending"'
        local lombok_versions = io.popen(command)
        if lombok_versions ~= nil then
            local lb_i, lb_versions = 0, {}
            for lb_version in lombok_versions:lines() do
                lb_i = lb_i + 1
                lb_versions[lb_i] = lb_version
            end
            lombok_versions:close()
            if next(lb_versions) ~= nil then
                local lombok_jar = string.format('%s%s\\lombok-%s.jar', lombok_dir, lb_versions[1], lb_versions[1])
                if is_file_exist(lombok_jar) then
                    return lombok_jar
                end
            end
        end
        return ''
    end

    local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
    local root_dir = jdtls_setup.find_root(root_markers)

    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    local jdtls_workspace_path = home .. "\\.cache\\jdtls\\workspace\\" .. project_name
    --print(jdtls_workspace_path)
    --
    local lombok_javaagent = get_lombok_javaagent()

    local cmd = {
        --'java', -- or '/path/to/java21_or_newer/bin/java'   THIS ALWAYS HAS TO BE >= java 21. THEN SET CORRECT VERSION IN RUNTIME CONFIG
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.
        home .. '\\.sdkman\\candidates\\java\\21.0.3-ms\\bin\\java.exe',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. lombok_javaagent,
        '-jar', jdtls_jar_path,
        '-configuration', jdtls_config_path,
        '-data', jdtls_workspace_path,
    }

    local config = {
        -- The command that starts the language server
        cmd = cmd, 


        root_dir = root_dir,
        
        -- Here the correct runtime can be configured, java 1.8, java 11 etc.
        settings = {
            java = {
                configuration = {
                    runtimes = {
                        {
                            name = "JavaSE-1.8",
                            path = home .. "\\.sdkman\\candidates\\java\\8.0.412-amzn",
                        }
                    }
                }
            }
        },
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            bundles = {}
        },

        on_init = function(client)
            client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
    }


    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(config)
    -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
end

return M
