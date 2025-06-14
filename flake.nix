{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko";
      # `disko` Flake 内部如果也需要 `nixpkgs` 这个依赖，
      # 那么它应该使用当前 Flake 已经定义的 `nixpkgs` 输入（即 "github:NixOS/nixpkgs/nixos-unstable-small"）。
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      flake-parts,
      disko,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake = {
        nixosConfigurations = {
          turnix = nixpkgs.lib.nixosSystem {
            modules = [
              ./systems/turnix
              disko.nixosModules.default
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.kituro = import ./home.nix;
              }
            ];
          };
        };
      };
    };
}
