{
    description = "haxnix";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        home-manager = {
          url = "github:nix-community/home-manager/release-24.05";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    
    outputs = {self, nixpkgs, home-manager, ...}@inputs:
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        nixosConfigurations = {
          prayag-nix = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/prayag-nix/configuration.nix
                home-manager.nixosModules.home-manager {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = inputs;
                  home-manager.users.prayag = import ./hosts/prayag-nix/home;
                  home-manager.backupFileExtension = "backup";
                }
              ];
          };
        };
      };
}
