local icons = require "configs.icons"

vim.lsp.enable {
  "ts_ls",
  "css_ls",
  "lua_ls",
  "json_ls",
  "emmet_ls",
  "html_ls",
  "tailwind_ls",
  "unocss",
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    vim.lsp.handlers["textDocument/completion"] = function(_, _, result, _)
      vim.print(result)
    end

    if client:supports_method "textDocument/completion" then
      -- client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
      local lsp_kind = vim.lsp.protocol.CompletionItemKind

      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = false,
        convert = function(item)
          local kind_name = lsp_kind[item.kind] or "Text"
          local icon = icons[kind_name] or "Text"
          return { kind = icon .. "│", abbr = item.label }
        end,
      })

      if client:supports_method "textDocument/implementation" then
        vim.keymap.set("n", "gi", vim.lsp.buf.code_action, { desc = "Go to implementation LSP " .. icons.LSP })
      end

      local _, cancel_prev = nil, function() end
      vim.api.nvim_create_autocmd("CompleteChanged", {
        buffer = event.buf,
        callback = function()
          cancel_prev()
          local info = vim.fn.complete_info { "selected" }
          local completionItem = vim.tbl_get(vim.v.completed_item, "user_data", "nvim", "lsp", "completion_item")
          if nil == completionItem then
            return
          end
          _, cancel_prev = vim.lsp.buf_request(
            event.buf,
            vim.lsp.protocol.Methods.completionItem_resolve,
            completionItem,
            function(_, item, _)
              if not item then
                return
              end
              local docs = (item.documentation or {}).value
              local win = vim.api.nvim__complete_set(info["selected"], { info = docs })
              if win.winid and vim.api.nvim_win_is_valid(win.winid) then
                vim.treesitter.start(win.bufnr, "markdown")
                vim.wo[win.winid].conceallevel = 3
              end
            end
          )
        end,
      })
    end
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition LSP " .. icons.LSP })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol LSP " .. icons.LSP })
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "Code actions LSP " .. icons.LSP })
    vim.keymap.set("n", "grr", vim.lsp.buf.code_action, { desc = "Go to reference LSP " .. icons.LSP })
    -- vim.keymap.set("i", "<c-.>", vim.lsp.completion.trigger, { desc = "Go to reference LSP " .. icons.LSP })

    vim.opt.completeopt = "menuone,noselect,popup"

    if client ~= nil and not client:supports_method("textDocument/inlayHint", 0) then
      map("<leader>ih", function()
        local bufnr = 0
        local is_enabled = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
        vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
      end, "Toggle Inlay Hints")
    end

    vim.diagnostic.config { virtual_lines = { current_line = true } }
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    default_capabilities.textDocument.completion.completionItem.snippetSupport = true
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    client.capabilities = capabilities
  end,
})
