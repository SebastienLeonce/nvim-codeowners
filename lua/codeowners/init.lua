local config = require'codeowners.config'
local Codeowners = {
  cache = {}
}

function Codeowners.setup(userConfig)
  config = vim.tbl_deep_extend("force", config, userConfig)
end

function Codeowners.reset()
  Codeowners.cache = {}
end

local function isCodeownersFileExist(file)
  local fileHandle = io.open(file, 'r')
  if fileHandle then
    fileHandle:close()
    return true
  end
  return false
end

function Codeowners.whoBufname()
  local bufname = vim.fn.bufname()
  return who(vim.fn.fnamemodify(bufname, ":."))
end

function who(file)
  if not Codeowners.cache[file] then
    local codeownersFile = config.codeownersFile

    if not isCodeownersFileExist(codeownersFile) then
      Codeowners.cache[file] = "Unloved"
    else
      local bin = vim.api.nvim_call_function('globpath', {vim.o.rtp, "node_modules/.bin/github-codeowners"})
      local handle = io.popen(bin .. " who -c " .. codeownersFile .. " " .. file)
      local output = handle:read('*all')
      handle:close()
      
      local pattern = config.pattern
      local owner = string.match(output, pattern)
      Codeowners.cache[file] = owner or "Unloved"
    end
  end

  return Codeowners.cache[file]
end

return Codeowners

