{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    flake-parts,
    nixpkgs,
    self,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];

      perSystem = {
        pkgs,
        system,
        ...
      }: {
        _module.args.pkgs = import nixpkgs {inherit system;};

        devShells.default = pkgs.mkShell {
          buildInputs = [pkgs.flutter];
        };
      };
    };
}
