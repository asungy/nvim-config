return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    -- Telescope-powered quick menu
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            -- Delete the entry under the cursor from the harpoon list
            local actions = require("telescope.actions")
            local state = require("telescope.actions.state")
            actions.select_default:replace(function(buf) -- Enter still opens the file
              local selection = state.get_selected_entry(buf)
              actions.close(prompt_bufnr)
              if selection then
                vim.cmd.edit(selection.value)
              end
            end)
            map("i", "<C-d>", function()
              local selection = state.get_selected_entry(prompt_bufnr)
              if not selection then
                return
              end
              local list = harpoon:list()
              for i, item in ipairs(list.items) do
                if item.value == selection.value then
                  list:remove_at(i) -- real API: deletes entry; harpoon persists it itself
                  break
                end
              end
              actions.close(prompt_bufnr)
              toggle_telescope(list) -- reopen to refresh the menu
            end)
            return true
          end,
        })
        :find()
    end

    local map = vim.keymap.set
    map("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon: add file" })
    map("n", "<leader>hd", function()
      harpoon:list():remove()
    end, { desc = "Harpoon: remove current file" })
    map("n", "<leader>hf", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    -- Jump to slots 1-4
    map("n", "<leader>hh", function()
      harpoon:list():select(1)
    end, { desc = "Jump to slot 1" })
    map("n", "<leader>ht", function()
      harpoon:list():select(2)
    end, { desc = "Jump to slot 2" })
    map("n", "<leader>hn", function()
      harpoon:list():select(3)
    end, { desc = "Jump to slot 3" })
    map("n", "<leader>hs", function()
      harpoon:list():select(4)
    end, { desc = "Jump to slot 4" })

    map("n", "<leader>hg", function()
      harpoon:list():prev()
    end, { desc = "Harpoon: previous file" })
    map("n", "<leader>hl", function()
      harpoon:list():next()
    end, { desc = "Harpoon: next file" })
  end,
}
