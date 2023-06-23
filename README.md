# normon.vim
run normal commands over visual select or cursor word in neovim.

### Example Config
```lua
local normon = require("normon")
-- cgn on current word/selection
normon("<leader>n", "cgn")
normon("<leader>N", "cgN")

-- macro on current word/selection
normon("<leader>q", "qq")
normon("<leader>Q", "qq", {backward = true})

-- improved * and #
-- escapes special characters and does not ignore case
normon("*", "n", {clearSearch = true})
normon("#", "n", {backward = true, clearSearch = true})
```
