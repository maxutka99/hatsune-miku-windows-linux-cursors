{
  description = "A nix package for hatsune miku cursors";

  inputs = {nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";};

  outputs = {
    self,
    nixpkgs,
  } @ inputs: let
    supportedSystems = ["x86_64-linux"];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    pkgsFor = nixpkgs.legacyPackages;
  in {
    packages = forAllSystems (system: {
      default = pkgsFor.${system}.callPackage ./package.nix {};
    });

    formatter.x86_64-linux = (import nixpkgs {system = "x86_64-linux";}).alejandra;
  };
}
