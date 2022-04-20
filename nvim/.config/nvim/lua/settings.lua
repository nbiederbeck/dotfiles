local lsp = require "lspconfig"
local coq = require "coq"

lsp.pylsp.setup(coq.lsp_ensure_capabilities({cmd={"python-language-server" }}))

require "startify"
