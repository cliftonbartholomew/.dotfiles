return {
    "mfussenegger/nvim-dap",
    requires = {
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "Pocco81/DAPInstall.nvim",
    },
    config = function()
        require("clifton.lazy.nvim-dap")
    end,
}
