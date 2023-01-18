return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      rainbow = { 
        enable = true, 
        extended_mode = true,
        max_file_lines = 1500,
      },
      ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'cpp',
        'dockerfile',
        'help',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'sql',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      },
    },
  },
}
