return {
  'daniel-walters/notes.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    notes_folder = '~/personal/obsidian',
    templates_folder = '~/personal/obsidian/templates',
    daily_note_format = 'Work - Daily Note - %DATE%.md',
    daily_note_template = 'Work daily.md',
  },
}
