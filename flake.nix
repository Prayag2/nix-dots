{
  description = "haxnix";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "nixpkgs";
    };
  };
  
  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let
    system = "x86_64-linux";

    unstable-pkgs = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      ideapad-2023 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs unstable-pkgs; };
        modules = [
          ./hosts/ideapad-2023/configuration.nix
          ./users/prayag/global.nix
          # ./users/prayag_kde/global.nix

          inputs.nix-flatpak.nixosModules.nix-flatpak

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs unstable-pkgs;
            };

            home-manager.users.prayag.imports = [
              inputs.nix-flatpak.homeManagerModules.nix-flatpak
              ./users/prayag/local.nix
            ];

            # home-manager.users.prayag_kde.imports = [
            #   inputs.nix-flatpak.homeManagerModules.nix-flatpak
            #   ./users/prayag_kde/local.nix
            # ];

            home-manager.backupFileExtension = "bak";
          }
        ];
      };
    };
  };
}
