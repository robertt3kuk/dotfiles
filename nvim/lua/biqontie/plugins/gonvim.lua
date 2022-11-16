local gonvim_status, go = pcall(require, "go")
if not gonvim_status then
	return
end
go.setup({
	max_line_len = 120, -- max line length in goline format
	tag_transform = false, -- tag_transfer  check gomodifytags for details
	lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
	lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
	lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
	-- true: will use go.nvim on_attach if true
	-- nil/false do nothing

	lsp_codelens = true,
	-- gopls_remote_auto = true, -- set to false is you do not want to pass -remote=auto to gopls(enable share)
	-- gopls_cmd = nil,
	-- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
	lsp_diag_hdlr = true, -- hook lsp diag handler
	test_runner = "richgo", -- richgo, go test, richgo, dlv, ginkgo
	verbose_tests = true, -- set to add verbose flag to tests
	run_in_floaterm = true, -- set to true to run in float window.)
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
})
-- Run gofmt + goimport on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
})
