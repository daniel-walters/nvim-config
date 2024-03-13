local function getOrdinalNumber(num)
  num = tonumber(num)
  if not num then
    return nil
  end

  local suffix = { 'th', 'st', 'nd', 'rd' }
  local last_two_digits = num % 100
  local last_digit = num % 10

  if last_two_digits >= 11 and last_two_digits <= 13 then
    return tostring(num) .. 'th'
  end

  return tostring(num) .. (suffix[last_digit] or 'th')
end

local function getFullDate()
  local date = os.date '%d'

  local ordinalDate = getOrdinalNumber(date)

  return os.date '%A ' .. ordinalDate .. os.date ' %B %Y'
end

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = {
    config = {
      shortcut = {
        { desc = getFullDate() },
      },
      mru = {
        limit = 5,
      },
      footer = {},
    },
  },
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
