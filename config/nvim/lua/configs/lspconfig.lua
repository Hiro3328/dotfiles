require("nvchad.configs.lspconfig").defaults()
require("configs.lsp.harper")


local servers = { "html", "cssls", "jedi_language_server", "rust_analyzer",  "clangd", "harper-ls"}
vim.lsp.enable(servers)
