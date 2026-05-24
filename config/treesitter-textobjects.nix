{ ... }: {
  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        lookahead = true;
        include_surrounding_whitepsace = false;
        selection_modes = {
          "@function.outer" = "V"; # linewise
        };
      };
      move = {
        set_jumps = true;
      };
    };
  };

  keymaps = [
    # Text object selections (visual/operator-pending modes)
    # Functions
    {
      mode = ["x" "o"];
      key = "am";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end'';
      options.desc = "Select outer function";
    }
    {
      mode = ["x" "o"];
      key = "im";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end'';
      options.desc = "Select inner function";
    }
    
    # Classes
    {
      mode = ["x" "o"];
      key = "al";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end'';
      options.desc = "Select outer class";
    }
    {
      mode = ["x" "o"];
      key = "il";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end'';
      options.desc = "Select inner class";
    }
    
    # Blocks
    {
      mode = ["x" "o"];
      key = "ab";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@block.outer', 'textobjects') end'';
      options.desc = "Select outer block";
    }
    {
      mode = ["x" "o"];
      key = "ib";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@block.inner', 'textobjects') end'';
      options.desc = "Select inner block";
    }
    
    # Conditionals
    {
      mode = ["x" "o"];
      key = "ad";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@conditional.outer', 'textobjects') end'';
      options.desc = "Select outer conditional";
    }
    {
      mode = ["x" "o"];
      key = "id";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@conditional.inner', 'textobjects') end'';
      options.desc = "Select inner conditional";
    }
    
    # Loops
    {
      mode = ["x" "o"];
      key = "ao";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@loop.outer', 'textobjects') end'';
      options.desc = "Select outer loop";
    }
    {
      mode = ["x" "o"];
      key = "io";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@loop.inner', 'textobjects') end'';
      options.desc = "Select inner loop";
    }
    
    # Parameters
    {
      mode = ["x" "o"];
      key = "aa";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects') end'';
      options.desc = "Select outer parameter";
    }
    {
      mode = ["x" "o"];
      key = "ia";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects') end'';
      options.desc = "Select inner parameter";
    }
    
    # Function calls
    {
      mode = ["x" "o"];
      key = "af";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@call.outer', 'textobjects') end'';
      options.desc = "Select outer call";
    }
    {
      mode = ["x" "o"];
      key = "if";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@call.inner', 'textobjects') end'';
      options.desc = "Select inner call";
    }
    
    # Comments
    {
      mode = ["x" "o"];
      key = "ac";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@comment.outer', 'textobjects') end'';
      options.desc = "Select outer comment";
    }
    
    # Frames
    {
      mode = ["x" "o"];
      key = "ar";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@frame.outer', 'textobjects') end'';
      options.desc = "Select outer frame";
    }
    {
      mode = ["x" "o"];
      key = "ir";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@frame.inner', 'textobjects') end'';
      options.desc = "Select inner frame";
    }
    
    # Attributes
    {
      mode = ["x" "o"];
      key = "at";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@attribute.outer', 'textobjects') end'';
      options.desc = "Select outer attribute";
    }
    {
      mode = ["x" "o"];
      key = "it";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@attribute.inner', 'textobjects') end'';
      options.desc = "Select inner attribute";
    }
    
    # Scopenames
    {
      mode = ["x" "o"];
      key = "ae";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@scopename.inner', 'textobjects') end'';
      options.desc = "Select scopename";
    }
    {
      mode = ["x" "o"];
      key = "ie";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@scopename.inner', 'textobjects') end'';
      options.desc = "Select scopename";
    }
    
    # Statements
    {
      mode = ["x" "o"];
      key = "as";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@statement.outer', 'textobjects') end'';
      options.desc = "Select statement";
    }
    {
      mode = ["x" "o"];
      key = "is";
      action.__raw = ''function() require('nvim-treesitter-textobjects.select').select_textobject('@statement.outer', 'textobjects') end'';
      options.desc = "Select statement";
    }

    # WAP OPERATIONS (normal mode only)
    # Swap next
    {
      mode = "n";
      key = ")m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_next('@function.outer') end'';
      options.desc = "Swap next function";
    }
    {
      mode = "n";
      key = ")c";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_next('@comment.outer') end'';
      options.desc = "Swap next comment";
    }
    {
      mode = "n";
      key = ")a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner') end'';
      options.desc = "Swap next parameter";
    }
    {
      mode = "n";
      key = ")b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_next('@block.outer') end'';
      options.desc = "Swap next block";
    }
    {
      mode = "n";
      key = ")C";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_next('@class.outer') end'';
      options.desc = "Swap next class";
    }
    
    # Swap previous
    {
      mode = "n";
      key = "(m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_previous('@function.outer') end'';
      options.desc = "Swap previous function";
    }
    {
      mode = "n";
      key = "(c";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_previous('@comment.outer') end'';
      options.desc = "Swap previous comment";
    }
    {
      mode = "n";
      key = "(a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner') end'';
      options.desc = "Swap previous parameter";
    }
    {
      mode = "n";
      key = "(b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_previous('@block.outer') end'';
      options.desc = "Swap previous block";
    }
    {
      mode = "n";
      key = "(C";
      action.__raw = ''function() require('nvim-treesitter-textobjects.swap').swap_previous('@class.outer') end'';
      options.desc = "Swap previous class";
    }

    # MOVE OPERATIONS (normal, visual, operator-pending)
    # Next start (outer)
    {
      mode = ["n" "x" "o"];
      key = "]m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer') end'';
      options.desc = "Next function start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]f";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@call.outer') end'';
      options.desc = "Next call start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]d";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@conditional.outer') end'';
      options.desc = "Next conditional start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]o";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@loop.outer') end'';
      options.desc = "Next loop start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]s";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@statement.outer') end'';
      options.desc = "Next statement start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.outer') end'';
      options.desc = "Next parameter start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]c";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@comment.outer') end'';
      options.desc = "Next comment start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@block.outer') end'';
      options.desc = "Next block start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]l";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer') end'';
      options.desc = "Next class start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]r";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@frame.outer') end'';
      options.desc = "Next frame start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]t";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@attribute.outer') end'';
      options.desc = "Next attribute start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]e";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@scopename.outer') end'';
      options.desc = "Next scopename start";
    }
    
    # Next start (inner)
    {
      mode = ["n" "x" "o"];
      key = "]]m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.inner') end'';
      options.desc = "Next function inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]f";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@call.inner') end'';
      options.desc = "Next call inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]d";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@conditional.inner') end'';
      options.desc = "Next conditional inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]o";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@loop.inner') end'';
      options.desc = "Next loop inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@parameter.inner') end'';
      options.desc = "Next parameter inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@block.inner') end'';
      options.desc = "Next block inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]l";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.inner') end'';
      options.desc = "Next class inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]r";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@frame.inner') end'';
      options.desc = "Next frame inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]t";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@attribute.inner') end'';
      options.desc = "Next attribute inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]e";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_start('@scopename.inner') end'';
      options.desc = "Next scopename inner start";
    }

    # Next end (outer)
    {
      mode = ["n" "x" "o"];
      key = "]M";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer') end'';
      options.desc = "Next function end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]F";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@call.outer') end'';
      options.desc = "Next call end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]D";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@conditional.outer') end'';
      options.desc = "Next conditional end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]O";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@loop.outer') end'';
      options.desc = "Next loop end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]S";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@statement.outer') end'';
      options.desc = "Next statement end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]A";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@parameter.outer') end'';
      options.desc = "Next parameter end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]C";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@comment.outer') end'';
      options.desc = "Next comment end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]B";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@block.outer') end'';
      options.desc = "Next block end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]L";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer') end'';
      options.desc = "Next class end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]R";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@frame.outer') end'';
      options.desc = "Next frame end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]T";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@attribute.outer') end'';
      options.desc = "Next attribute end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]E";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@scopename.outer') end'';
      options.desc = "Next scopename end";
    }

    # Next end (inner)
    {
      mode = ["n" "x" "o"];
      key = "]]M";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@function.inner') end'';
      options.desc = "Next function inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]F";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@call.inner') end'';
      options.desc = "Next call inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]D";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@conditional.inner') end'';
      options.desc = "Next conditional inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]O";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@loop.inner') end'';
      options.desc = "Next loop inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]A";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@parameter.inner') end'';
      options.desc = "Next parameter inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]B";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@block.inner') end'';
      options.desc = "Next block inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]L";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@class.inner') end'';
      options.desc = "Next class inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]R";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@frame.inner') end'';
      options.desc = "Next frame inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]T";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@attribute.inner') end'';
      options.desc = "Next attribute inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "]]E";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_next_end('@scopename.inner') end'';
      options.desc = "Next scopename inner end";
    }

    # Previous start (outer)
    {
      mode = ["n" "x" "o"];
      key = "[m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer') end'';
      options.desc = "Previous function start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[f";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@call.outer') end'';
      options.desc = "Previous call start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[d";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@conditional.outer') end'';
      options.desc = "Previous conditional start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[o";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@loop.outer') end'';
      options.desc = "Previous loop start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[s";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@statement.outer') end'';
      options.desc = "Previous statement start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.outer') end'';
      options.desc = "Previous parameter start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[c";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@comment.outer') end'';
      options.desc = "Previous comment start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@block.outer') end'';
      options.desc = "Previous block start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[l";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer') end'';
      options.desc = "Previous class start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[r";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@frame.outer') end'';
      options.desc = "Previous frame start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[t";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@attribute.outer') end'';
      options.desc = "Previous attribute start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[e";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@scopename.outer') end'';
      options.desc = "Previous scopename start";
    }

    # Previous start (inner)
    {
      mode = ["n" "x" "o"];
      key = "[[m";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.inner') end'';
      options.desc = "Previous function inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[f";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@call.inner') end'';
      options.desc = "Previous call inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[d";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@conditional.inner') end'';
      options.desc = "Previous conditional inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[o";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@loop.inner') end'';
      options.desc = "Previous loop inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[a";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@parameter.inner') end'';
      options.desc = "Previous parameter inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[b";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@block.inner') end'';
      options.desc = "Previous block inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[l";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.inner') end'';
      options.desc = "Previous class inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[r";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@frame.inner') end'';
      options.desc = "Previous frame inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[t";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@attribute.inner') end'';
      options.desc = "Previous attribute inner start";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[e";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_start('@scopename.inner') end'';
      options.desc = "Previous scopename inner start";
    }

    # Previous end (outer)
    {
      mode = ["n" "x" "o"];
      key = "[M";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer') end'';
      options.desc = "Previous function end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[F";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@call.outer') end'';
      options.desc = "Previous call end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[D";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@conditional.outer') end'';
      options.desc = "Previous conditional end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[O";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@loop.outer') end'';
      options.desc = "Previous loop end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[S";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@statement.outer') end'';
      options.desc = "Previous statement end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[A";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@parameter.outer') end'';
      options.desc = "Previous parameter end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[C";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@comment.outer') end'';
      options.desc = "Previous comment end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[B";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@block.outer') end'';
      options.desc = "Previous block end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[L";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer') end'';
      options.desc = "Previous class end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[R";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@frame.outer') end'';
      options.desc = "Previous frame end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[T";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@attribute.outer') end'';
      options.desc = "Previous attribute end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[E";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@scopename.outer') end'';
      options.desc = "Previous scopename end";
    }

    # Previous end (inner)
    {
      mode = ["n" "x" "o"];
      key = "[[M";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@function.inner') end'';
      options.desc = "Previous function inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[F";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@call.inner') end'';
      options.desc = "Previous call inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[D";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@conditional.inner') end'';
      options.desc = "Previous conditional inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[O";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@loop.inner') end'';
      options.desc = "Previous loop inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[A";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@parameter.inner') end'';
      options.desc = "Previous parameter inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[B";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@block.inner') end'';
      options.desc = "Previous block inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[L";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@class.inner') end'';
      options.desc = "Previous class inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[R";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@frame.inner') end'';
      options.desc = "Previous frame inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[T";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@attribute.inner') end'';
      options.desc = "Previous attribute inner end";
    }
    {
      mode = ["n" "x" "o"];
      key = "[[E";
      action.__raw = ''function() require('nvim-treesitter-textobjects.move').goto_previous_end('@scopename.inner') end'';
      options.desc = "Previous scopename inner end";
    }

    # REPEATABLE MOVEMENT
    # Vim-style repeat (semicolon repeats last direction)
    {
      mode = ["n" "x" "o"];
      key = ";";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move'';
      options.desc = "Repeat last move";
    }
    {
      mode = ["n" "x" "o"];
      key = ",";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').repeat_last_move_opposite'';
      options.desc = "Repeat last move opposite";
    }

    # Make builtin f/F/t/T repeatable with semicolon/comma
    {
      mode = ["n" "x" "o"];
      key = "f";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').builtin_f_expr'';
      options = {
        expr = true;
        desc = "Find forward (repeatable)";
      };
    }
    {
      mode = ["n" "x" "o"];
      key = "F";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').builtin_F_expr'';
      options = {
        expr = true;
        desc = "Find backward (repeatable)";
      };
    }
    {
      mode = ["n" "x" "o"];
      key = "t";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').builtin_t_expr'';
      options = {
        expr = true;
        desc = "Till forward (repeatable)";
      };
    }
    {
      mode = ["n" "x" "o"];
      key = "T";
      action.__raw = ''require('nvim-treesitter-textobjects.repeatable_move').builtin_T_expr'';
      options = {
        expr = true;
        desc = "Till backward (repeatable)";
      };
    }
  ];
}
