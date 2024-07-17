require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"antlersls",
		-- "awk_ls",
		"azure_pipelines_ls",
		--"circle_ci_ls",
		"cmake",
		"cssls",
		--"cucumber_language_server",
		--"docker_compose_language_server",
		"dotls",
		"dockerls",
		"earthlyls",
		"gradle_ls",
		"grammarly",
		"graphql",
		-- "hls",
		"hdl_checker",
		"helm_ls",
		"html",
		-- "htmx",
		"java_language_server",
		"jqls",
		"kotlin_language_server",
		-- "groovyls",
		--"nginx",
		"pylsp",
		"svelte",
		"volar",
		"yamlls",
		"lua_ls",
		"tsserver",
		"jdtls",
		"angularls",
		"bashls",
	},
	automatic_installation = true,
})
require("mason-nvim-dap").setup({
	automatic_installation = true,
	ensure_installed = {
		"firefox",
		"kotlin-debug-adapter",
		"bash-debug-adapter",
		"chrome-debug-adapter",
		"debugpy",
		"js-debug-adapter",
		"vscode-java-decompiler",
	},
	automatic_setup = true,
	handlers = {
		function(config)
			-- all sources with no handler get passed here

			-- Keep original functionality
			require("mason-nvim-dap").default_setup(config)
		end,
		firefox = function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})
require("mason-null-ls").setup({
	ensure_installed = {
		"stylua",
		"eslint_d",
		"prettierd",
		"prettier",
		"cspell",
		"detekt",
		"ansible-lint",
		"gitlint",
		"yamllint",
		"codespell",
		"flake8",
		"ast_grep",
	},
	-- ensure_installed = { "stylua", "prettier" },
	automatic_installation = true,
})
