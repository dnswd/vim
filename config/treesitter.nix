{ config, ... }:
{
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;

    # Install all grammars
    grammarPackages = config.plugins.treesitter.package.allGrammars;
  };
}
