local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    print("Error: Could not find nvim-autopairs (nvim_autopairs.lua)")
    return
end

-- Treesitter configuration
npairs.setup {
    check_ts = true,
    ts_config = {
        -- lua = { "string" }, -- it will not add a pair on that treesitter node
        -- javascript = { "template_string" },
        -- java = false, -- don't check treesitter on Java
    },
    disable_filetype = { "TelescopePrompt", "toggleterm", },
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment',
    },
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local ok, cmp = pcall(require, "cmp")
if not ok then
    print("Error: Could not find cmp (nvim_autopairs.lua)")
    return
end
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

