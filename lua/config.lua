-- NvimTree
require 'nvim-tree'.setup {
}
vim.api.nvim_command("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
-- Lualine
require('lualine').setup()

require('nvim-autopairs').setup()
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "vim", "lua", "python", "go" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

-- telescope
local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key",
                ["<c-n>"] = actions.cycle_history_next,
                ["<c-p>"] = actions.cycle_history_prev,
                ["<c-j>"] = actions.move_selection_next,
                ["<c-k>"] = actions.move_selection_previous,
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    }
}

-- symbols_outline
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = true,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = { icon = "", hl = "TSURI" },
        Module = { icon = "", hl = "TSNamespace" },
        Namespace = { icon = "", hl = "TSNamespace" },
        Package = { icon = "", hl = "TSNamespace" },
        Class = { icon = "𝓒", hl = "TSType" },
        Method = { icon = "ƒ", hl = "TSMethod" },
        Property = { icon = "", hl = "TSMethod" },
        Field = { icon = "", hl = "TSField" },
        Constructor = { icon = "", hl = "TSConstructor" },
        Enum = { icon = "ℰ", hl = "TSType" },
        Interface = { icon = "ﰮ", hl = "TSType" },
        Function = { icon = "", hl = "TSFunction" },
        Variable = { icon = "", hl = "TSConstant" },
        Constant = { icon = "", hl = "TSConstant" },
        String = { icon = "𝓐", hl = "TSString" },
        Number = { icon = "#", hl = "TSNumber" },
        Boolean = { icon = "⊨", hl = "TSBoolean" },
        Array = { icon = "", hl = "TSConstant" },
        Object = { icon = "⦿", hl = "TSType" },
        Key = { icon = "🔐", hl = "TSType" },
        Null = { icon = "NULL", hl = "TSType" },
        EnumMember = { icon = "", hl = "TSField" },
        Struct = { icon = "𝓢", hl = "TSType" },
        Event = { icon = "🗲", hl = "TSType" },
        Operator = { icon = "+", hl = "TSOperator" },
        TypeParameter = { icon = "𝙏", hl = "TSParameter" }
    }
}

-- bufferline
require("bufferline").setup {
    options = {
        mode = "buffers",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        diagnostics = "nvim_lsp",
        show_close_icon = false,
        separator_style = "thick",
        offsets = { {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        } }
    },
}
