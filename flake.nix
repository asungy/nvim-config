{
  description = "Neovim config — dev shell with a Lua formatter for the whole repo";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              stylua # Lua formatter the app below runs
              nixfmt-rfc-style # keep the .nix files fetching themselves tidy
            ];
          };
        }
      );

      # `nix run .`  →  format every Lua file in this repo
      apps = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = {
            type = "app";
            program = toString (
              pkgs.writeShellScript "format-repo" ''
                cd "$(git rev-parse --show-toplevel)" || exit 1
                exec stylua init.lua lua/
              ''
            );
          };
        }
      );

      nixConfig = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        extra-substituters = "https://nix-community.cachix.org";
        extra-trusted-public-keys = "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=";
      };
    };
}
