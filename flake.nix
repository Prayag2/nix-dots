{
    description = "haxnix";
    
    inputs = {
        # nixpkgs.url = "github:NixOS/nixpkgs/0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb";
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
          # url = "github:nix-community/home-manager/release-24.05";
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = {self, nixpkgs, home-manager, ...}@inputs:
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        nixosConfigurations = {
          ideapad-2023 = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/ideapad-2023/configuration.nix
                ./users/prayag/global.nix
                home-manager.nixosModules.home-manager {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = {inherit inputs;};
                  home-manager.users.prayag = import ./users/prayag/local.nix;
                  home-manager.backupFileExtension = "backup";
                }
              ];
          };
        };
      };
}
