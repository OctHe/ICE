local hop = require'hop'
local hint = require'hop.hint'
local directions = hint.HintDirection
local positions = hint.HintPosition

hop.setup({})

vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
vim.keymap.set('', 'W', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, {remap=true})
vim.keymap.set('', 'E', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, {remap=true})
vim.keymap.set('', 'B', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, {remap=true})
vim.keymap.set('', 'gE', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, {remap=true})
