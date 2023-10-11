# nvim-junit

Do you strongly dislike having to manually create the _Junit_ test files in the proper directory, and then
having to import all the right libraries to use for that test... This tedious work could be done for you!
Introducing `nvim-junit`! 

### Installation

The easiest way to install this plugin is with your favorite plugin manager

Using [packer](https://github.com/wbthomason/packer.nvim) in lua

```lua
use {"asror1/nvim-junit", config = function()
  require("nvim-junit").setup()
end}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{
  {'asror1/nvim-junit', version = "*", config = false}
}
```

Using [vim-plug](https://github.com/junegunn/vim-plug) in vimscript

```vim
Plug 'asror1/nvim-junit'
```

### Commands

* `JUnitGenerateTest` - generate a junit test file with template contents
