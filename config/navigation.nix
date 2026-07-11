# config/navigation.nix
{ ... }: {
  # 1. Enable Bufferline
  plugins.bufferline = {
    enable = true;
  };

  # 2. Enable Harpoon
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };

  # 3. Custom keymaps
  keymaps = [
    # Harpoon navigation
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
      options.desc = "Harpoon: Add file";
    }
    {
      mode = "n";
      key = "<C-e>";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      options.desc = "Harpoon: Toggle menu";
    }
    {
      mode = "n";
      key = "<C-h>";
      action.__raw = "function() require'harpoon':list():select(1) end";
      options.desc = "Harpoon: Select file 1";
    }
    {
      mode = "n";
      key = "<C-t>";
      action.__raw = "function() require'harpoon':list():select(2) end";
      options.desc = "Harpoon: Select file 2";
    }
    {
      mode = "n";
      key = "<C-n>";
      action.__raw = "function() require'harpoon':list():select(3) end";
      options.desc = "Harpoon: Select file 3";
    }
    {
      mode = "n";
      key = "<C-s>";
      action.__raw = "function() require'harpoon':list():select(4) end";
      options.desc = "Harpoon: Select file 4";
    }

    # Bufferline navigation
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options = {
        desc = "Cycle to next buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options = {
        desc = "Cycle to previous buffer";
        silent = true;
      };
    }

    # Close current buffer
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options = {
        desc = "[B]uffer [D]elete";
        silent = true;
      };
    }

    # Combined LSP declaration/usages jump
    {
      mode = "n";
      key = "<leader>d";
      action.__raw = ''
        function()
          local params = vim.lsp.util.make_position_params()
          vim.lsp.buf_request(0, 'textDocument/declaration', params, function(err, result, ctx, _)
            if err or not result or vim.tbl_isempty(result) then
              vim.lsp.buf.references()
            else
              vim.lsp.util.jump_to_location(result[1], "utf-8")
            end
          end)
        end
      '';
      options = {
        desc = "LSP: Jump to declaration or find usages";
        silent = true;
      };
    }
  ];
}
