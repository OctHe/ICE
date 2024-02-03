-- ---------------------------------------------------------------------
--
-- Build, debug and run programs
-- Author: OctHe
-- Copyright (C): 2024
--
-- ---------------------------------------------------------------------

return {

    {
        'akinsho/toggleterm.nvim',
        config = function()
            require("toggleterm").setup{}
        end,
        keys = {
            { "<Leader>tt", "<CMD>ToggleTerm<CR>", mode = {"n", "v"}, desc = "Terminal" },
        },
    },

    -- Directly run part of codes
    {
         'michaelb/sniprun',
         build = "bash ./install.sh",
    },

}
