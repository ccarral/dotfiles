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
                command = "clippy",
                assist = {
                    importGranularity = "module",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = false
                },
                diagnostics = {
                    disabled = {"macro-error", "unresolved-proc-macro"}
                },
            }
        }
} 

local rust_opts = {
    tools = { 
        -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            highlight = "LspDiagnosticsDefaultHint",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = global_opts,
}


local lsp_installer = require("nvim-lsp-installer")

local lsp_installer_server = require("nvim-lsp-installer.server")


lsp_installer.on_server_ready(function(server)
    -- local opts = {}

    -- (optional) Customize the options passed to the server
    if server.name == "rust_analyzer" then
        local server_options = server:get_default_options()
        server_options['on_attach'] = on_attach
        rust_opts.server = server_options 
        require('rust-tools').setup(rust_opts)
        return 
        -- vim.cmd [[ do User LspAttachBuffers ]]
   else
       server:setup(global_opts)
   end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
   -- server:setup(global_opts)
   vim.cmd [[ do User LspAttachBuffers ]]
end)
 

--Setup Completion
--See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

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

