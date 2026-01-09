return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    -- Files / Buffers
    { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
        {
      "<leader>fd", -- open dotfiles
      function()
        require("fzf-lua").files({ cwd = "~/dotfiles"})
      end,
      desc = "Find dotfiles"
    },
    { "<leader>fn", function() require("fzf-lua").files({cwd = "~/.config/nvim"}) end, desc = "Find files in Nvim config" },
    { "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "Buffers" },
    { "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },

    -- Search
    { "<leader>fg", function() require("fzf-lua").grep() end, desc = "Grep" },
    { "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Grep word under cursor" },

    -- Help / Commands
    { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Help tags" },
    { "<leader>fc", function() require("fzf-lua").commands() end, desc = "Commands" },
    { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },

    -- Resume 
    { "<leader>fr", function() require("fzf-lua").resume() end, desc = "Resume last picker" },
  },
  opts = {
	  winopts = {
		  border = "single",
	  preview = {
		  border = "single"
	  },
	  },
  },
}
