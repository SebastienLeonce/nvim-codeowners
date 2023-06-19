# nvim-codeowners
A nvim plugin for interacting with [GitHub's CODEOWNERS](https://github.blog/2017-07-06-introducing-code-owners/) file.

## Requirements

- [github-codeowners](https://github.com/jjmschofield/github-codeowners)

## Installation
Install `nvim-codeowners` as any other plugin through the use of
[Packer](https://github.com/wbthomason/packer.nvim)
or your favourite nvim plugin manager.

```
use { "SebastienLeonce/nvim-codeowners", run = "npm install" }
```

## Commands

- `CodeownersWho` - shows a codeowner of active file.
- `CodeownersReset` - resets cache.

## Config
Default config for the plugin :
```lua

require("codeowners").setup({
    codeownersFile = "CODEOWNERS",
    pattern =  "(@[%S]+)",
})
```

## Hardline Configuration

[nvim-hardline](https://github.com/ojroques/nvim-hardline)
```lua
require('hardline').setup {
  ...
  sections = {
    ...
    {class = 'low', item = require("codeowners").whoBufname},
    ...
  },
}
```

## Source

- [vim-github-codeowners](https://github.com/mrded/vim-github-codeowners/tree/master)
