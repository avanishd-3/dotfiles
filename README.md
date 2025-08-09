# Dotfiles

## Kitty

Pretty much standard Kitty terminal, except:
  - No update checking
  - Tokyo Night Moon theme
  - 12 point PT Mono font

<img width="1106" alt="Kitty config" src="https://github.com/user-attachments/assets/e10410aa-6afe-45e3-92d9-96324f4b07bc" />

## ZSH
Using Oh-My-ZSH with

- General Autocomplete: [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
- pnpm autocmplete: [pnpm-shell-completion](https://github.com/g-plane/pnpm-shell-completion)

pnpm lags the terminal without pnpm autocompletion, since zsh autocmplete cannot autocomplete pnpm by itself. The same is probably true for npm, but you shouldn't
be using npm. pnpm is much faster and fully compatibile.


## Vim

Using these plugins

- Package manager: [vim-plug](https://github.com/junegunn/vim-plug)
- Git diff: [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- File explorer: [nerdtree](https://github.com/preservim/nerdtree)
  - Ctrl-O to open and close
- Linting: [ale](https://github.com/dense-analysis/ale)
- C++ highlighting: [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)
- Autopairs: [delimitMate](https://github.com/Raimondi/delimitMate)
- Colorscheme: [everforest](https://github.com/sainnhe/everforest)

<img width="1192" alt="Vim config" src="https://github.com/user-attachments/assets/34678ebb-50e4-408d-99a8-d2f271d2a7c5" />


## Neovim

Using these plugins

- Package manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Auto-completion
   - Completion source: [blink-cmp](https://github.com/Saghen/blink.cmp)
   - Vscode pictograms: [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- LSP support
  - [mason.nvim](https://github.com/williamboman/mason.nvim)
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- Colorscheme: [tokyonight-moon](https://github.com/folke/tokyonight.nvim)
- Improved editing experience
  - Syntax Highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - Autopairs: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
  - Indentation indicator: [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - Status line: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- File explorer: [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
  - Ctrl-O to open and close
- Git:
  - Git commands: [vim-fugitive](https://github.com/tpope/vim-fugitive)
  - Git decoration: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
  - Git diff view: [diffview.nvim](https://github.com/sindrets/diffview.nvim)

| Configured Languages |
| -------------------- |
| Lua                  |
| Rust                 |
| C                    |
| C++                  |
| Python               |
| Markdown             |

<img width="1083" alt="Neovim config" src="https://github.com/user-attachments/assets/ce77cb85-4e0b-4244-9d6b-1ea7f35d378e" />
