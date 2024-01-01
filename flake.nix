{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.anne2protools = {
    url = "github:hitsmaxft/nix-annepro2-tools/master";
  };

  outputs = { self, nixpkgs, flake-utils, anne2protools }:
  flake-utils.lib.eachDefaultSystem( system:
  let
    overlay = final: prev: {
      #anne2pro-tools = anne2protools.packages.${system}.anneprot2-tools;
      anne2pro-tools = anne2protools.defaultPackage.${system};
    };

    # overlays tools into pkgs
    pkgs = import nixpkgs {
      inherit system;
      overlays = [overlay];
    };
  in
  {
    devShells.default = import ./shell.nix { inherit pkgs; };
  }
  );
}
