local M = {}

-- INFO: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.lsp_servers = {
  cssls = {},
  eslint = {},
  html = {},
  htmx = {},
  graphql = {},
  gopls = {
    settings = {
      gopls = {
        staticcheck = true,
      },
    },
  },
  intelephense = {},
  templ = {},
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
        },
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

M.mason = {
  'stylua',
  'prettierd',
  'staticcheck',
}

-- NOTE: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
M.daps = {
  'delve',
  'node2',
}

M.register_additional_filetypes = function()
  vim.filetype.add { extension = { templ = 'templ' } }
end

return M
