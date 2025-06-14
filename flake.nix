{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    flake-parts.url = "github:hercules-ci/flake-parts";
    
    disko = {
      url = "github:nix-community/disko";
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
       		home-manager.users.kituro= import ./home.nix;

	      }
            ];
          };
        };
      };
    };
}
