local M = {}
local Scan = require "plenary.scandir"

M.find_stylesheet = function(root)
  local files = Scan.scan_dir(root, { hidden = true, depth = 5 })
  for _, file in ipairs(files) do
    if file:match "index%.scss$" or file:match "index%.css$" then
      print("Found style sheet " .. file)
      return file
    end
  end
  return nil
end

return M
