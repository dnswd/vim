{ ... }: {
  plugins.blink-pairs = {
    enable = true;
    settings = {
      highlights = {
        cmdline = true;
        enabled = true;
        groups = [
          "rainbow1"
          "rainbow2"
          "rainbow3"
          "rainbow4"
          "rainbow5"
          "rainbow6"
        ];
        matchparen = {
          enabled = true;
          cmdline = false;
          group = "BlinkPairsMatchParen";
          include_surrounding = false;
          priority = 250;
        };
        unmatched_group = "BlinkPairsUnmatched";
      };
      mappings = {
        enabled = true;
        cmdline = true;
        wrap = {
          "<C-b>" = "motion";
          "<C-S-b>" = "motion_reverse";
        };
      };
    };
  };
}
