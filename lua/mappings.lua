require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local fzf = require "fzf-lua"
local scretch = require "scretch"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("n", "<leader>sk", ":Telescope keymaps<cr>", { desc = "Search keymaps" })
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Find Project" })
-- map("n", "<leader>fw", "<cmd>telescope egrepify<cr>", { desc = "telescope live grep *improved*" })

map("n", "<leader>fw", function()
  fzf.live_grep()
end, { desc = "fzf live grep" })

map("n", "<leader>sn", scretch.new, { desc = "Create new Scratchfile" })
map("n", "<leader>snn", scretch.new_named, { desc = "Create new named Scratchfile" })
map("n", "<leader>sft", scretch.new_from_template, { desc = "Create new from template Scratchfile" })
map("n", "<leader>sl", scretch.last, { desc = "Last Scratchfile" })
map("n", "<leader>sf", scretch.search, { desc = "Search in Scratchfile" })
map("n", "<leader>st", scretch.edit_template, { desc = "Edit Scratchfile" })
map("n", "<leader>sg", scretch.grep, { desc = "Grep in Scratchfiles" })
map("n", "<leader>sv", scretch.explore, { desc = "Explore Scratchfiles" })
map("n", "<leader>sat", scretch.save_as_template, { desc = "Save new Scratchfile" })

map(
  "n",
  "<leader>fa",
  ":Telescope find_files search_dir={~},--hidden<CR>",
  { desc = "Telescope find all files from home directory" }
)

map("n", "<leader>grr", function()
  require("telescope.builtin").lsp_references()
end, { noremap = true, silent = true, desc = "Telescope find reference LSP" })

map(
  "n",
  "<leader>oi",
  "<cmd>lua vim.lsp.buf.execute_command({ command = '_pyright.organizeimports', arguments = {vim.api.nvim_buf_get_name(0)} })<CR>",
  { noremap = true, silent = true }
)

map("n", "<leader>mp", ":PeekOpen<CR>", { desc = "Open Readme file" })

map("n", "<M-j>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd "lnext"
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd "cnext"
  end
end, { noremap = true, silent = true, desc = "Next quickfix list or loclist" })
map("n", "<M-k>", function()
  if vim.fn.getloclist(0, { size = 0 }).size > 0 then
    vim.cmd "lprev"
  elseif vim.fn.getqflist({ size = 0 }).size > 0 then
    vim.cmd "cprev"
  end
end, { noremap = true, silent = true, desc = "Next quickfix list or loclist" })

map("n", "<leader>gq", ":q<CR>", { desc = "Close current buffer" })

map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Gitsigns preview hunk changes" })

map("n", "<leader>gB", ":Git blame<CR>", { desc = "Git blame" })
map("n", "<leader>gcm", function()
  local branches = vim.fn.systemlist "git branch --list main master"
  if vim.tbl_contains(branches, "  main") then
    vim.cmd "Git checkout main"
  elseif vim.tbl_contains(branches, "  master") then
    vim.cmd "Git checkout master"
  else
    print "Neither 'main' nor 'master' branch found."
  end
end, { noremap = true, silent = true, desc = "Git checkout main/master" })

map("n", "<leader>gcb", function()
  local branch_name = vim.fn.input("New branch name (prefix 'dev-'): ", "dev-")
  if branch_name ~= "" then
    vim.cmd("Git checkout -b " .. branch_name)
  end
end, { noremap = true, silent = true, desc = "Git checkout new dev-* branch" })

map("n", "<leader>gco", function()
  require("telescope.builtin").git_branches {
    attach_mappings = function(prompt_bufnr, _)
      local function checkout_branch()
        local selection = require("telescope.actions.state").get_selected_entry()
        local branch_name = selection.value
        vim.cmd("Git checkout " .. branch_name)
        require("telescope.actions").close(prompt_bufnr)
      end

      map("i", "<CR>", checkout_branch)
      return true
    end,
  }
end, { noremap = true, silent = true, desc = "Git checkout to existing branch" })

local actions = require "telescope.actions"
require("telescope").setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
}

map({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
map({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")

-- Testing
map("n", "<leader>tt", ":lua require('neotest').run.run()<CR>", { desc = "Run nearest Test" })
map("n", "<leader>tT", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run all tests in file" })
map("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "Toggle test summary" })

map("n", "<leader>to", function()
  require("neotest").output.open { enter = true, short = true }
end, { desc = "Open test output" })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    map("t", "<C-n>", [[<C-\><C-n>]], { buffer = true, desc = "Exit terminal mode" })
  end,
})

-- Debugging mappings

local dap = require "dap"

map("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
map("n", "<leader>do", dap.step_over, { desc = "Step Over" })
map("n", "<leader>di", dap.step_into, { desc = "Step Into" })
map("n", "<leader>dO", dap.step_out, { desc = "Step Out" })
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Set Conditional Breakpoint" })

map("n", "<leader>7", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Set Log Point" })

map("n", "<leader>8", dap.terminate, { desc = "Terminate Debugging" })
map("n", "<leader>9", dap.restart, { desc = "Restart Debugging" })

map("n", "<leader>on", function()
  require("mini.notify").show_history()
end, { desc = "Show MiniNotify history" })

map({ "n", "v" }, "<leader>dt", function()
  require("dap-python").test_method()
end, { desc = "Debug nearest test" })
map(
  { "n", "v" },
  "<leader>dr",
  ":lua require('dapui').open({reset = true})<CR>",
  { noremap = true, desc = "Reload debugger UI" }
)

require("telescope").load_extension "refactoring"

map({ "n", "x" }, "<leader>rr", function()
  require("telescope").extensions.refactoring.refactors()
end, { desc = "Telescope refactor code" })
map(
  "n",
  "<Leader>nc",
  ":lua require('neogen').generate({ type = 'func' })<CR>",
  { noremap = true, silent = true, desc = "Generate function docstring" }
)

map("n", "gx", function()
  local word = vim.fn.expand "<cWORD>"
  if not word:match "^https?://" then
    word = "http://" .. word
  end
  vim.fn.jobstart({ "powershell.exe", "/c", "start", word }, { detach = true })
end, { desc = "Open URL in Windows browser (WSL2)" })

map({ "n", "x" }, "<leader>ar", function()
  require("grug-far").open {
    prefills = { search = vim.fn.expand "<cword>" },
  }
end, { desc = "Grug far on cursor word" })

map({ "n", "x" }, "<leader>as", function()
  local search = vim.fn.getreg "/"
  -- surround with \b if "word" search (such as when pressing `*`)
  if search and vim.startswith(search, "\\<") and vim.endswith(search, "\\>") then
    search = "\\b" .. search:sub(3, -3) .. "\\b"
  end
  require("grug-far").open {
    prefills = {
      search = search,
    },
  }
end, { desc = "grug-far: Search using @/ register value or visual selection" })

map("n", "<leader>ss", require("fzf-lua").lsp_document_symbols, { desc = "LSP Symbols (current file)" })

map("n", "<leader>r5", ":NvimTreeResize 50<CR>", { desc = "Resize NERDTree to 50" })
map("n", "<leader>r3", ":NvimTreeResize 30<CR>", { desc = "Resize NERDTree to 30" })
map("v", "<leader>rv", "!tac<CR>", { noremap = true, silent = true, desc = "Reverses selected text" })
