{ config, pkgs, inputs, ... }:

{
  # Dependencies
  #
  # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp.html
  plugins.cmp-nvim-lsp = {
    enable = true;
  };

  # Useful status updates for LSP.
  # https://nix-community.github.io/nixvim/plugins/fidget/index.html
  plugins.fidget = {
    enable = true;
  };

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugi#extraplugins 
  extraPlugins = with pkgs.vimPlugins; [
    # NOTE: This is how you would ad a vim plugin that is not implemented in Nixvim, also see extraConfigLuaPre below
    # `neodev` configure Lua LSP for your Neovim config, runtime and plugins
    # used for completion, annotations, and signatures of Neovim apis
    neodev-nvim
  ];

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugi#extraconfigluapre
  extraConfigLuaPre = ''
    require('neodev').setup {}
  '';

  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    "kickstart-lsp-attach" = {
      clear = true;
    };
  };

  
  # LSP server as plugin
  # Typescript
  plugins.typescript-tools = {
    enable = true;
  };
  # Java
  plugins.java = {
    enable = true;
    settings = {
      checks = {
        nvim_version = true;
        nvim_jdtls_conflict = true;
      };

      jdtls.version = "1.43.0";
      jdk = {
        auto_install = true;
        version = "17";
      };

      # plugins
      lombok = {
        enable = true;
        version = "1.18.40";
      };

      java_test = {
        enable = true;
        version = "0.40.1";
      };

      java_debug_adapter = {
        enable = true;
        version = "0.58.2";
      };

      spring_boot_tools.enable = false;
    };
  };

  # https://nix-community.github.io/nixvim/plugins/lsp/index.html
  plugins.lsp = {
    enable = true;

    # Enable the following language servers
    #  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    #
    #  Add any additional override configuration in the following tables. Available keys are:
    #  - cmd: Override the default command used to start the server
    #  - filetypes: Override the default list of associated filetypes for the server
    #  - capabilities: Override fields in capabilities. Can be used to disable certain LSP features.
    #  - settings: Override the default settings passed when initializing the server.
    #        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    servers = {
      clangd = {
        enable = true;
      };

      gopls = {
        enable = true;
      };

      pyright = {
        enable = true;
      };

      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };

      jdtls = {
        enable = true;
      };

      lua_ls = {
        enable = true;
        settings = {
          completion = {
            callSnippet = "Replace";
          };
        };
      };

      nixd = {
        enable = true;
      };
    };

    keymaps = {
      # Diagnostic keymaps
      diagnostic = {
        "[d" = {
          action = "goto_prev";
          desc = "Go to previous [D]iagnostic message";
        };
        "]d" = {
          action = "goto_next";
          desc = "Go to next [D]iagnostic message";
        };
        "<leader>e" = {
          action = "open_float";
          desc = "Show diagnostic [E]rror messages";
        };
        "<leader>q" = {
          action = "setloclist";
          desc = "Open diagnostic [Q]uickfix list";
        };
      };

      lspBuf = {
        # Rename the variable under your cursor.
        #  Most Language Servers support renaming across files, etc.
        "<leader>rn" = {
          action = "rename";
          desc = "LSP: [R]e[n]ame";
        };
        # Execute a code action, usually your cursor needs to be on top of an error
        # or a suggestion from your LSP for this to activate.
        "<leader>ca" = {
          action = "code_action";
          desc = "LSP: [C]ode [A]ction";
        };
        # Opens a popup that displays documentation about the word under your cursor
        #  See `:help K` for why this keymap.
        "K" = {
          action = "hover";
          desc = "LSP: Hover Documentation";
        };
        # WARN: This is not Goto Definition, this is Goto Declaration.
        #  For example, in C this would take you to the header.
        "gD" = {
          action = "declaration";
          desc = "LSP: [G]oto [D]eclaration";
        };
      };

      extra = [
        # Jump to the definition of the word under your cusor.
        #  This is where a variable was first declared, or where a function is defined, etc.
        #  To jump back, press <C-t>.
        {
          mode = "n";
          key = "gd";
          action.__raw = "require('telescope.builtin').lsp_definitions";
          options = {
            desc = "LSP: [G]oto [D]efinition";
          };
        }
        # Find references for the word under your cursor.
        {
          mode = "n";
          key = "gr";
          action.__raw = "require('telescope.builtin').lsp_references";
          options = {
            desc = "LSP: [G]oto [R]eferences";
          };
        }
        # Jump to the implementation of the word under your cursor.
        #  Useful when your language has ways of declaring types without an actual implementation.
        {
          mode = "n";
          key = "gI";
          action.__raw = "require('telescope.builtin').lsp_implementations";
          options = {
            desc = "LSP: [G]oto [I]mplementation";
          };
        }
        # Jump to the type of the word under your cursor.
        #  Useful when you're not sure what type a variable is and you want to see
        #  the definition of its *type*, not where it was *defined*.
        {
          mode = "n";
          key = "<leader>D";
          action.__raw = "require('telescope.builtin').lsp_type_definitions";
          options = {
            desc = "LSP: Type [D]efinition";
          };
        }
        # Fuzzy find all the symbols in your current document.
        #  Symbols are things like variables, functions, types, etc.
        {
          mode = "n";
          key = "<leader>ds";
          action.__raw = "require('telescope.builtin').lsp_document_symbols";
          options = {
            desc = "LSP: [D]ocument [S]ymbols";
          };
        }
        # Fuzzy find all the symbols in your current workspace.
        #  Similar to document symbols, except searches over your entire project.
        {
          mode = "n";
          key = "<leader>ws";
          action.__raw = "require('telescope.builtin').lsp_dynamic_workspace_symbols";
          options = {
            desc = "LSP: [W]orkspace [S]ymbols";
          };
        }
        {
          mode = "n";
          key = "<leader>ch";
          action.__raw = "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
          options = {
            desc = "Toggle Inlay Hints";
          };
        }

      ];
    };

    # This function gets run when an LSP attaches to a particular buffer.
    #   That is to say, every time a new file is opened that is associated with
    #   an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    #   function will be executred to configure the current buffer
    # NOTE: This is an example of an attribute that takes raw lua
    onAttach = ''
      -- The following two autocommands are used to highlight references of the
      -- word under the cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).

      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          end,
        })
      end
    '';
  };
}

