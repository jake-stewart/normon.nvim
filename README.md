# normon.vim
run normal commands over visual select or cursor word in neovim.

### Example Config
```lua
local normon = require("normon")

normon("<leader>n", "cgn")
normon("<leader>N", "cgN")

normon("<leader>q", "qq")
normon("<leader>Q", "qq", {backward = true})

-- improved * and #
normon("*", "n")
normon("#", "n", {backward=true})
```
