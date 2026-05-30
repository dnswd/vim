{
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv) hostPlatform;
in
{
  viAlias = true;
  vimAlias = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  clipboard = {
    providers = {
      # Linux clipboard providers
      wl-copy.enable = hostPlatform.isLinux; # For Wayland
      xsel.enable = hostPlatform.isLinux; # For X11
      pbcopy.enable = hostPlatform.isDarwin; # For MacOS
    };

    # Sync clipboard between OS and Neovim
    #  Remove this option if you want your OS clipboard to remain independent.
    register = "unnamedplus";
  };


  # Basic plugins
  plugins = {
    # Detect tabstop and shiftwidth automatically
    sleuth.enable = true;

    # comment block region/lines
    # comment.enable = true;

    # highlights todo, notes, etc
    todo-comments = {
      enable = true;
      settings.signs = true;
    };
  };

  opts = {
  number = true;
  relativenumber = true;

  # Mouse mode
  mouse = "a";

  # Don't show the mode, since it's already in the statusline
  # showmode = false;

  # Long running undo file
  # Undodir configured above using extraConfgLuaPre to resolve home path
  # undofile = true;

  wrap = false;

  # # Disable folding
  # foldenable = false;

  # Disable backup
  swapfile = false;
  backup = false;

  # Colors
  # termguicolors = true;
  };

  # diagnostic = {
  #   settings = {
  #     severity_sort = true;
  #     float = {
  #       border = "rounded";
  #       source = "if_many";
  #     };
  #     underline = {
  #       severity.__raw = "vim.diagnostic.severity.ERROR";
  #     };
  #     signs.__raw = ''
  #       vim.g.have_nerd_font and {
  #         text = {
  #           [vim.diagnostic.severity.ERROR] = '󰅚 ',
  #           [vim.diagnostic.severity.WARN] = '󰀪 ',
  #           [vim.diagnostic.severity.INFO] = '󰋽 ',
  #           [vim.diagnostic.severity.HINT] = '󰌶 ',
  #         },
  #       } or {}
  #     '';
  #     virtual_text = {
  #       source = "if_many";
  #       spacing = 2;
  #       format.__raw = ''
  #         function build_virtual_text(diagnostic)
  #           local diagnostic_message = {
  #             [vim.diagnostic.severity.ERROR] = diagnostic.message,
  #             [vim.diagnostic.severity.WARN] = diagnostic.message,
  #             [vim.diagnostic.severity.INFO] = diagnostic.message,
  #             [vim.diagnostic.severity.HINT] = diagnostic.message,
  #           }
  #           return diagnostic_message[diagnostic.severity]
  #         end
  #       '';
  #     };
  #   };
  # };

  # plugins = {
  # Enable lazy loading
  # lz-n.enable = true;

  # Enable error lens
  # trouble.enable = true;

  # Auto close bracket
  # nvim-autopairs.enable = true;

  # Lazygit integration
  # lazygit.enable = true;

  # # Git signs
  # gitsigns.enable = true;
  # gitsigns.settings.current_line_blame = true;

  # Icons
  # web-devicons.enable = true;

  # Guess ident
  # guess-indent.enable = true;
  # };

  # dependencies = {
  #   ripgrep.enable = true;
  # };

  # # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraplugins
  # extraPlugins = with pkgs; [
  #   # NOTE: This is where you would add a vim plugin that is not implemented in Nixvim, also see extraConfigLuaPre below
  #   vimPlugins.amp-nvim # ampcode to communicate with nvim
  # ];

  # https://nix-community.github.io/nixvim/NeovimOptions/index.html#extraconfigluapost
  # extraConfigLuaPost = ''
  #   -- vimPlugins.amp-nvim init
  #   require('amp').setup({ auto_start = true, log_level = "info" })
  # '';
}
