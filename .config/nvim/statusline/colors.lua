local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#ffffff", "#ff0088")
highlight("StatusBranch", "#ff0088", "#ffffff")
highlight("StatusFile", "#ff0088", "#000000")
highlight("StatusSaved", "#ff0088", "#000000")
highlight("StatusWarnings", "#ffffff", "#ff0088")
highlight("StatusErrors", "#ff0088", "#ffffff")
