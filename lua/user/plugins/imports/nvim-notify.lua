-- Notification floats
return {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
        require('notify').setup{}
    end,
}
