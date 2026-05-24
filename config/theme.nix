{ ... }:
{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavor = "mocha";
      default_integrations = true;
      integrations = {
        cmp = true;
        treesitter = true;
        harpoon = true;
      };
      transparent_background = true;
    };
  };

}
