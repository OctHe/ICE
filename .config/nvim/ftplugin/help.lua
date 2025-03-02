vim.o.number = true
if vim.fn.winwidth("%d") > 180
    vim.cmd[[ wincmd L ]]
    vim.cmd[[ vertical resize 90 ]]
endif
