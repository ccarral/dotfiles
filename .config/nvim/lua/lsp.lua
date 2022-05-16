-- local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- vim.lsp.set_log_level("debug")

local common = require("lsp_common")


local on_attach = common.on_attach

local global_opts = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
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
            -- assist = {
            -- importGranularity = "module",
            -- importPrefix = "by_self",
            -- },
            -- cargo = {
            -- loadOutDirsFromCheck = true
            -- },
            -- procMacro = {
            -- enable = false
            -- },
            -- diagnostics = {
            -- disabled = {"macro-error", "unresolved-proc-macro"}
            -- },
        }
    }
}

local rust_opts = {
    tools = {
        -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            only_current_line = false,
            show_parameter_hints = false,
        },
    },
    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = global_opts,
}


require("nvim-lsp-installer").setup()

local servers = { 'sumneko_lua', 'tsserver', 'pyright', 'clangd', 'rust_analyzer', 'volar', 'jdtls' }

for _, lsp in pairs(servers) do
    if lsp == "rust_analyzer" then
        require('rust-tools').setup(rust_opts)
    elseif lsp == "volar" then
        local volar_options = vim.deepcopy(global_opts)
        volar_options["cmd"] = { "vls", "--stdio" }
        volar_options["init_options"] = {
            serverPath = "~/.npm/lib/node_modules/typescript/lib/tsserver.js"
        }
        require("lspconfig")[lsp].setup(volar_options)
    else
        require("lspconfig")[lsp].setup(global_opts)
    end
end


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
    },
})

-- local saga = require('lspsaga')

-- saga.init_lsp_saga()

-- saga.init_lsp_saga{
-- code_action_prompt = {
-- enable = true,
-- sign = true,
-- sign_priority = 20,
-- virtual_text = true,
-- },
-- }
