{
  description = "Flake of a Dark Moon";
  # Updaing only one input
  # nix flake lock --update-input nixvim 
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
     # nixvim = {
     #   url = "github:Free-Rat/nixvim";
     #   inputs.nixpkgs.follows = "nixpkgs";
     # };
  };


  outputs = { self, nixpkgs, home-manager, nix-darwin, nixos-hardware, ... }@inputs:
    let
      lib = nixpkgs.lib;
      user = "mightypancake";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        #laptop
        juliette = lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs user; };
          modules = [
            nixos-hardware.nixosModules.asus-zephyrus-ga401
            ./hosts/juliette
            ./modules
      	    ./modules/awesome
             home-manager.nixosModules.home-manager {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
               home-manager.users."${user}" = import ./home/home.nix;
               home-manager.extraSpecialArgs = { inherit user inputs; };
             }
          ];
        };
      };
    };
}
