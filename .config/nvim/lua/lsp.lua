-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- vim.lsp.set_log_level("debug")

local common = require("lsp_common")


local on_attach = common.on_attach

local servers = {
    tsserver = {},
    pyright = {},
    clangd = {},
    rust_analyzer = {
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                completion = {
                    postfix = {
                        enable = false
                    }
                },
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
    volar = { cmd = { "vls", "--stdio" }, init_options = { serverPath = "~/.npm/lib/node_modules/typescript/lib/tsserver.js" } },
    jdtls = {},
    vimls = {},
    texlab = {},
    lua_ls = {
        on_init = function(client)
            -- This is to enable completion for editing neovim files
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            })
        end,
        settings = {
            Lua = { hint = { enable = true } }
        }
    },
    lemminx = {},
    cssls = {},
    ruby_lsp = {},
    solargraph = {},
}

require("mason").setup()
require("mason-lspconfig").setup()

for server, config in pairs(servers) do
    config.on_attach = on_attach
    require('lspconfig')[server].setup(config)
end




local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


--Setup Completion
--See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-l>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })

    },

    -- Installed sources
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'orgmode' },
    },
})
