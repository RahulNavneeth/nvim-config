local cmd = vim.cmd

cmd([[
 :command -nargs=1 Temp :read !head -1000 ~/projects/templates/template.<q-args>
]])

