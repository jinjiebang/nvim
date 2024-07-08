local vscode = require("vscode-neovim")
local function vscode_action(cmd)
  return function()
    vscode.action(cmd)
  end
end
-- Editor: buffers
vim.keymap.set("n", "H", vscode_action("workbench.action.previousEditorInGroup"), { desc = "Previous Editor" })
vim.keymap.set("n", "L", vscode_action("workbench.action.nextEditorInGroup"), { desc = "Next Editor" })
vim.keymap.set("n", "<Leader>bo", vscode_action("workbench.action.closeOtherEditors"), { desc = "Close Other Editors" })
vim.keymap.set(
  "n",
  "<Leader>bh",
  vscode_action("workbench.action.closeEditorsToTheLeft"),
  { desc = "Close Left Editors" }
)
vim.keymap.set(
  "n",
  "<Leader>bl",
  vscode_action("workbench.action.closeEditorsToTheRight"),
  { desc = "Close Right Editors" }
)
-- Scroll
vim.keymap.set("n", "zl", vscode_action("scrollRight"), { desc = "Scroll Right" })
vim.keymap.set("n", "zh", vscode_action("scrollLeft"), { desc = "Scroll Left" })
-- Motion: basic move
local function moveCursor(direction)
    if (vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
        return ('g' .. direction)
    else
        return direction
    end
end

vim.keymap.set('n', 'k', function() return moveCursor('k') end, { expr = true, remap = true })
vim.keymap.set('n', 'j', function() return moveCursor('j') end, { expr = true, remap = true })
vim.keymap.set("c", "<C-A>", "<C-B>", { desc = "Start Of Line" })
vim.keymap.set("i", "<C-A>", "<Home>", { desc = "Start Of Line" })
vim.keymap.set("i", "<C-E>", "<End>", { desc = "End Of Line" })
-- Motion: diagnostic
vim.keymap.set("n", "]g", function()
  vscode.action("workbench.action.editor.nextChange")
  vscode.action("workbench.action.compareEditor.nextChange")
end, { desc = "Next Git Diff" })
vim.keymap.set("n", "[g", function()
  vscode.action("workbench.action.editor.previousChange")
  vscode.action("workbench.action.compareEditor.previousChange")
end, { desc = "Prev Git Diff" })
vim.keymap.set("n", "]d", vscode_action("editor.action.marker.next"), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vscode_action("editor.action.marker.prev"), { desc = "Prev Diagnostic" })
-- Search: code navigation
vim.keymap.set("n", "gy", vscode_action("editor.action.goToTypeDefinition"), { desc = "Go To Type Definition" })
vim.keymap.set("n", "gr", vscode_action("editor.action.goToReferences"), { desc = "Go To References" })
vim.keymap.set("n", "gi", vscode_action("editor.action.goToImplementation"), { desc = "Go To Implementations" })
-- Folding
vim.keymap.set("n", "zM", vscode_action('editor.foldAll'), { desc = "fold all" })
vim.keymap.set("n", "zR", vscode_action('editor.unfoldAll'), { desc = "unfold all" })
vim.keymap.set("n", "zc", vscode_action('editor.fold'), { desc = "fold" })
vim.keymap.set("n", "zC", vscode_action('editor.foldRecursively'), { desc = "fold recursively" })
vim.keymap.set("n", "zo", vscode_action('editor.unfold'), { desc = "unfold" })
vim.keymap.set("n", "zO", vscode_action('editor.unfoldRecursively'), { desc = "unfold recursively" })
vim.keymap.set("n", "za", vscode_action('editor.toggleFold'), { desc = "toggle fold" })
-- Motion: bookmark
vim.keymap.set({ "n" }, "m;", vscode_action("bookmarks.toggle"), { desc = "Toogle Bookmark" })
vim.keymap.set({ "n" }, "m:", vscode_action("bookmarks.toggleLabeled"), { desc = "Toogle Bookmark Label" })
vim.keymap.set({ "n" }, "m/", vscode_action("bookmarks.listFromAllFiles"), { desc = "List All Bookmarks" })