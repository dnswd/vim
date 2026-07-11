{
  pkgs,
  inputs,
  system,
  my,
  ...
}:

inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule {
  inherit pkgs;
  extraSpecialArgs = { inherit inputs my; };
  module = {
    imports = my.importFrom ./config;
  };
}
