# "Charleston" dark theme for neovim

## Features

- High contrast color theme with a low saturation and smooth colors
- Many plugins supported

  ![Dashboard screenshot](./dashboard.png)
  ![Screenshot Austere theme with Rust](./screenshot1.png)
  ![Screenshot Austere theme with fzf-lua](./screenshot2.png)
  ![palette](./palette.png)

> [!WARNING]
> The color scheme is under deep development.
> But it will be very useful to get feedback.

## Roadmap

- Transparent supported

## Requirements

- neovim >= 0.8

## Supported plugins

- NeoTree
- blink.cmp
- diffveiw.nvim
- fzf-lua
- gitsings.nvim
- noice.nvim
- render-markdown.nvim
- snacks.nvim
- telescope.nvim

## Install

Only use with lazy plugin manager:

```bash
{
    "romanaverin/charleston.nvim",
    name = "charleston",
    priority = 1000,
    opts = {},
  },
}
```

## Usage

Lazy:

```bash
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "charleston",
    },
  },
```

Or:

```bash
vim.cmd.colorscheme "charleston"
```

## Options

To configure options, add `opts` to the plugin declaration:

```bash
opts = {
  terminal_colors = true, -- sets terminal colors
  italic = true, -- use italic font style
  dimmed_background = false, -- use more dim background
}
```

For the lualine add this

```bash
require('lualine').setup {
    options = {
        theme = "charleston"
        -- ... the rest of your lualine config
    }
}
```
