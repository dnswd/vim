{ ... }:
let
  # Define our standard textobjects list
  # Standard ones are mapped to outer/inner automatically
  standardObjects = [
    { key = "m"; name = "function"; }
    { key = "l"; name = "class"; }
    { key = "b"; name = "block"; }
    { key = "f"; name = "call"; }
    { key = "d"; name = "conditional"; }
    { key = "o"; name = "loop"; }
    { key = "a"; name = "parameter"; }
    { key = "r"; name = "frame"; }
    { key = "t"; name = "attribute"; }
  ];

  # Specialized ones with customized inner/outer rules
  specialObjects = [
    { key = "c"; name = "comment"; outer = "@comment.outer"; inner = null; }
    { key = "e"; name = "scopename"; outer = "@scopename.inner"; inner = "@scopename.inner"; }
    { key = "s"; name = "statement"; outer = "@statement.outer"; inner = "@statement.outer"; }
  ];

  # Combine them into a single list of textobjects
  allObjects = (builtins.map (obj: obj // {
    outer = "@${obj.name}.outer";
    inner = "@${obj.name}.inner";
  }) standardObjects) ++ specialObjects;

  # Helper to resolve uppercase for END navigation keys
  toUpper = k: {
    "m" = "M"; "l" = "L"; "b" = "B"; "f" = "F"; "d" = "D"; "o" = "O";
    "s" = "S"; "c" = "C"; "a" = "A"; "r" = "R"; "t" = "T"; "e" = "E";
  }.${k};

  # 1. Generate Selection Keymaps (am/im, ac/ic, etc.)
  makeSelectKeymaps = obj:
    let
      outerMap = if obj.outer != null then [
        {
          mode = [ "x" "o" ];
          key = "a${obj.key}";
          action.__raw = "function() require('nvim-treesitter-textobjects.select').select_textobject('${obj.outer}', 'textobjects') end";
          options.desc = "Select outer ${obj.name}";
        }
      ] else [];
      innerMap = if obj.inner != null then [
        {
          mode = [ "x" "o" ];
          key = "i${obj.key}";
          action.__raw = "function() require('nvim-treesitter-textobjects.select').select_textobject('${obj.inner}', 'textobjects') end";
          options.desc = "Select inner ${obj.name}";
        }
      ] else [];
    in
      outerMap ++ innerMap;

  # 2. Generate Movement Keymaps (]m / ]]m / ]M / ]]M, etc.)
  makeMoveKeymaps = obj:
    let
      upKey = toUpper obj.key;
      outerStart = if obj.outer != null then [
        { mode = [ "n" "x" "o" ]; key = "]${obj.key}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_next_start('${obj.outer}') end"; options.desc = "Next ${obj.name} outer start"; }
        { mode = [ "n" "x" "o" ]; key = "[${obj.key}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_previous_start('${obj.outer}') end"; options.desc = "Previous ${obj.name} outer start"; }
      ] else [];
      innerStart = if obj.inner != null then [
        { mode = [ "n" "x" "o" ]; key = "]]${obj.key}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_next_start('${obj.inner}') end"; options.desc = "Next ${obj.name} inner start"; }
        { mode = [ "n" "x" "o" ]; key = "[[${obj.key}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_previous_start('${obj.inner}') end"; options.desc = "Previous ${obj.name} inner start"; }
      ] else [];
      outerEnd = if obj.outer != null then [
        { mode = [ "n" "x" "o" ]; key = "]${upKey}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_next_end('${obj.outer}') end"; options.desc = "Next ${obj.name} outer end"; }
        { mode = [ "n" "x" "o" ]; key = "[${upKey}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_previous_end('${obj.outer}') end"; options.desc = "Previous ${obj.name} outer end"; }
      ] else [];
      innerEnd = if obj.inner != null then [
        { mode = [ "n" "x" "o" ]; key = "]]${upKey}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_next_end('${obj.inner}') end"; options.desc = "Next ${obj.name} inner end"; }
        { mode = [ "n" "x" "o" ]; key = "[[${upKey}"; action.__raw = "function() require('nvim-treesitter-textobjects.move').goto_previous_end('${obj.inner}') end"; options.desc = "Previous ${obj.name} inner end"; }
      ] else [];
    in
      outerStart ++ innerStart ++ outerEnd ++ innerEnd;

  # 3. Generate Swap Keymaps
  swapList = [
    { key = "m"; desc = "function"; target = "@function.outer"; }
    { key = "c"; desc = "comment"; target = "@comment.outer"; }
    { key = "a"; desc = "parameter"; target = "@parameter.inner"; }
    { key = "b"; desc = "block"; target = "@block.outer"; }
    { key = "C"; desc = "class"; target = "@class.outer"; }
  ];

  makeSwapKeymaps = swap: [
    {
      mode = [ "n" ];
      key = ")${swap.key}";
      action.__raw = "function() require('nvim-treesitter-textobjects.swap').swap_next('${swap.target}') end";
      options.desc = "Swap next ${swap.desc}";
    }
    {
      mode = [ "n" ];
      key = "(${swap.key}";
      action.__raw = "function() require('nvim-treesitter-textobjects.swap').swap_previous('${swap.target}') end";
      options.desc = "Swap previous ${swap.desc}";
    }
  ];

  # Repeatable movement mappings (builtins and custom)
  repeatableKeymaps = [
    {
      mode = [ "n" "x" "o" ];
      key = ";";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move";
      options.desc = "Repeat last move";
    }
    {
      mode = [ "n" "x" "o" ];
      key = ",";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_opposite";
      options.desc = "Repeat last move opposite";
    }
    {
      mode = [ "n" "x" "o" ];
      key = "f";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_f_expr";
      options = { expr = true; desc = "Find forward (repeatable)"; };
    }
    {
      mode = [ "n" "x" "o" ];
      key = "F";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_F_expr";
      options = { expr = true; desc = "Find backward (repeatable)"; };
    }
    {
      mode = [ "n" "x" "o" ];
      key = "t";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_t_expr";
      options = { expr = true; desc = "Till forward (repeatable)"; };
    }
    {
      mode = [ "n" "x" "o" ];
      key = "T";
      action.__raw = "require('nvim-treesitter-textobjects.repeatable_move').builtin_T_expr";
      options = { expr = true; desc = "Till backward (repeatable)"; };
    }
  ];

  # Flatten all generated mappings
  allSelectKeymaps = builtins.concatLists (builtins.map makeSelectKeymaps allObjects);
  allMoveKeymaps = builtins.concatLists (builtins.map makeMoveKeymaps allObjects);
  allSwapKeymaps = builtins.concatLists (builtins.map makeSwapKeymaps swapList);

in {
  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        lookahead = true;
        selection_modes = {
          "@function.outer" = "V";
        };
      };
      move = {
        set_jumps = true;
      };
    };
  };

  # Register keymaps
  keymaps = allSelectKeymaps ++ allMoveKeymaps ++ allSwapKeymaps ++ repeatableKeymaps;
}
