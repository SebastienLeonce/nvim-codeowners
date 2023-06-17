if vim.g.loaded_codeowners then
  return
end

local codeowners = require('codeowners')

local function codeownersWhoCmd()
  return print(codeowners.whoBufname())
end

vim.api.nvim_create_user_command('CodeownersWho', codeownersWhoCmd, { nargs=0 })
vim.api.nvim_create_user_command('CodeownersReset', codeowners.reset, { nargs=0 })

vim.g.loaded_codeowners = true
