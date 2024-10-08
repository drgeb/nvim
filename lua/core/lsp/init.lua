-- local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status then
-- 	return
-- end
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- local status_navic, navic = pcall(require, "nvim-navic")
-- if not status_navic then
-- 	return
-- end
local navic = require("nvim-navic")

local keymap = vim.keymap

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local mappingOpts = { noremap = true, silent = true }
keymap.set("n", "<space>e", vim.diagnostic.open_float, mappingOpts)
keymap.set("n", "[d", vim.diagnostic.goto_prev, mappingOpts)
keymap.set("n", "]d", vim.diagnostic.goto_next, mappingOpts)
keymap.set("n", "<space>q", vim.diagnostic.setloclist, mappingOpts)
-- keymap.set("n", "<space>q", '<cmd', mappingOpts)

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
-- 	callback = function(ev, client)
-- 		print(client)
-- 	end,
-- })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, bufopts)
	keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	keymap.set("n", "<space>bf", function()
		-- vim.lsp.buf.format({ async = false })
		vim.lsp.buf.format({
			async = false,
			filter = function(cli)
				return cli.name == "null-ls"
			end,
		})
	end, bufopts)
	-- keymap.set("n", "<space>lA", vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = cmp_nvim_lsp.default_capabilities()

local providers_path = "core.lsp.providers."
local lsps_table = {
	lua_lsp = require(providers_path .. "lua"),
	jdtls_lsp = require(providers_path .. "jdtls"),
	--rnix_lsp = require(providers_path .. "rnix"),
	tsserver_lsp = require(providers_path .. "tsserver"),
	json_lsp = require(providers_path .. "json"),
	-- cssls_lsp = require(providers_path .. "cssls"),
	latex_lsp = require(providers_path .. "latex"),
	-- dartls_lsp = require(providers_path .. "dartls"),
	-- vue_lsp = require(providers_path .. "vue"),
	eslint_lsp = require(providers_path .. "eslint"),
	angular_lsp = require(providers_path .. "angular"),
	-- clang_lsp = require(providers_path .. "clang"),
	-- php_lsp = require(providers_path .. "php"),
	-- tailwind = require(providers_path .. "tailwind"),
}

-- LSP settings (for overriding per client)
-- local test = "test"
-- local handlers = {
-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
-- 	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
-- }

for key, _ in next, lsps_table, nil do
	lsps_table[key].load({
		capabilities = capabilities,
		on_attach = on_attach,
		flags = lsp_flags,
		-- handlers = handlers,
	})
end

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=NONE]])
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])

-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or "rounded"
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
local test = "test"
vim.diagnostic.config({
	underline = true,
	signs = true,
	-- virtual_text = false,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		-- header = "",
		-- prefix = "",
	},
})

-- local border = {
-- 	{ "╭", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╮", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- 	{ "╯", "FloatBorder" },
-- 	{ "─", "FloatBorder" },
-- 	{ "╰", "FloatBorder" },
-- 	{ "│", "FloatBorder" },
-- }

-- LSP settings (for overriding per client)
-- local handlers = {
-- 	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
-- 	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
-- }
--
-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or border
-- 	-- opts.border = "rounded"
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
