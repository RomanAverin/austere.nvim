# Austere Theme for neovim

## Features

- High contrast theme with a low saturation and smooth colors
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

- neovim > 0.9

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
    "romanaverin/austere.nvim",
    name = "austere",
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "austere",
    },
  },
}
```
