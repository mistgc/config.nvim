local keys = {
  {
    "s",
    function()
      require("flash").jump()
    end,
    mode = { "n", "x", "o" },
    desc = "Flash",
  },
  {
    "S",
    function()
      require("flash").treesitter()
    end,
    mode = { "n", "x", "o" },
    desc = "Flash Treesitter",
  },
  {
    "r",
    function()
      require("flash").remote()
    end,
    mode = { "o" },
    desc = "Remote Flash",
  },
  {
    "R",
    function()
      require("flash").treesitter_search()
    end,
    mode = { "o", "x" },
    desc = "Treesitter Search",
  },
}

local function config()
  local flash = require("flash")
  flash.setup({
    mode = {
      char = {
        enable = false,
      },
    },
  })
end

return {
  "folke/flash.nvim",
  config = config,
  keys = keys,
}
