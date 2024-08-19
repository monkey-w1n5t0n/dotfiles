{
  description = "w1n5t0n's Blooper configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    stylix.url = "github:danth/stylix";
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      stylix,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        blooper = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          modules = [
            ./hardware-configuration.nix
            ./configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.w1n5t0n = import ./home.nix;
              # home-manager.extraSpecialArgs = {
              #   inherit inputs;
              # };
            }
          ];
        };
      };
    };
}
