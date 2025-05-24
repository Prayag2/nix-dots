{
    description = "haxnix";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable-zen-kernel.url = "github:nixos/nixpkgs/5757bbb8bd7c0630a0cc4bb19c47e588db30b97c";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

        home-manager = {
          url = "github:nix-community/home-manager/release-24.11";
          # url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };
        hypr-dynamic-cursors = {
            url = "github:VirtCode/hypr-dynamic-cursors";
            inputs.hyprland.follows = "nixpkgs";
        };
        # stylix.url = "github:danth/stylix";
    };
    
    outputs = {self, nixpkgs, home-manager, ...}@inputs:
    let
      system = "x86_64-linux";
    in {
        nixosConfigurations = {
          ideapad-2023 = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs; };
              modules = [
                ./hosts/ideapad-2023/configuration.nix
                ./users/prayag/global.nix
                inputs.nix-flatpak.nixosModules.nix-flatpak
                # inputs.stylix.nixosModules.stylix
                home-manager.nixosModules.home-manager {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.extraSpecialArgs = {inherit inputs;};
                  home-manager.users.prayag.imports = [
                    inputs.nix-flatpak.homeManagerModules.nix-flatpak
                    ./users/prayag/local.nix
                  ];
                  home-manager.backupFileExtension = "backup";
                }
              ];
          };
        };
      };
}
