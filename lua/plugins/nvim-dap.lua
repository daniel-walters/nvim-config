return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
    {
      'microsoft/vscode-js-debug',
      version = '1.x',
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = require('core.ensure_installed').daps,
    }

    ---@diagnostic disable-next-line: missing-fields
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      ---@diagnostic disable-next-line: missing-fields
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    local opts = require('core.keymaps').opts

    vim.keymap.set('n', '<leader>-', dap.continue, opts())
    vim.keymap.set(
      'n',
      '<leader>b',
      dap.toggle_breakpoint,
      { desc = 'Debug: Toggle Breakpoint' }
    )
    vim.keymap.set('n', '<leader>da', function()
      require('dap').continue { before = get_args }
    end)

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup()

    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
      adapters = {
        'pwa-node',
        'pwa-chrome',
        'pwa-msedge',
        'node-terminal',
        'pwa-extensionHost',
      },
    }

    for _, language in ipairs { 'typescript', 'javascript', 'svelte' } do
      require('dap').configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
          -- use nvim-dap-vscode-js's pwa-node debug adapter
          type = 'pwa-node',
          -- attach to an already running node process with --inspect flag
          -- default port: 9222
          address = '35.232.221.196',
          remoteRoot = '/home/${env:USER}/genero',
          port = 9229,
          request = 'attach',
          -- allows us to pick the process using a picker
          processId = require('dap.utils').pick_process,
          -- name of the debug action you have to select for this config
          name = 'Attach debugger to existing `node --inspect` process',
          -- for compiled languages like TypeScript or Svelte.js
          sourceMaps = true,
          -- resolve source maps in nested locations while ignoring node_modules
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          -- path to src in vite based projects (and most other projects as well)
          localRoot = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          outFiles = {
            '${workspaceFolder}/packages/*/build/**/*.js',
          },
          -- we don't want to debug code inside node_modules, so skip it!
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
        -- {
        --   type = 'pwa-chrome',
        --   name = 'Launch Chrome to debug client',
        --   request = 'launch',
        --   url = 'http://localhost:5173',
        --   sourceMaps = true,
        --   protocol = 'inspector',
        --   port = 9222,
        --   webRoot = '${workspaceFolder}/src',
        --   -- skip files from vite's hmr
        --   skipFiles = { '**/node_modules/**/*', '**/@vite/*', '**/src/client/*', '**/src/*' },
        -- },
        -- only if language is javascript, offer this debug action
        language == 'javascript'
            and {
              -- use nvim-dap-vscode-js's pwa-node debug adapter
              type = 'pwa-node',
              -- launch a new process to attach the debugger to
              request = 'launch',
              -- name of the debug action you have to select for this config
              name = 'Launch file in new node process',
              -- launch current file
              program = '${file}',
              cwd = '${workspaceFolder}',
            }
          or nil,
      }
    end
  end,
}
