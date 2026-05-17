{
  pkgs ? import <nixpkgs> {
    inherit system;
    config = { };
    overlays = [ ];
  },
  system ? builtins.currentSystem,
  halcyon-vim,
  ...
}:

pkgs.mkShellNoCC {
  packages =
    with pkgs;
    [
      fastfetch
    ]
    ++ [
      halcyon-vim
    ];

  shellHook = /* bash */ ''
    echo ""
    echo "Halcyon's Vim"
    echo "-------------"
    echo "Execute \"just run\" to run"
    echo ""
  '';
}
