-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- vim.lsp.set_log_level("debug")

local common = require("lsp_common")

local on_attach = common.on_attach

local servers = {
    ts_ls = {},
    pyright = {},
    terraformls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                hint = { enable = true },
            }
        }
    },
    lemminx = {},
    gopls = {}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for server, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    vim.lsp.config(server, config)
end
