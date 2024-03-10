return {
  check = function()
    vim.health.start 'config'

    vim.health.info [[Test]]
  end,
}
