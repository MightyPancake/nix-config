{ inputs, pkgs, lib, config, ... }:
{
  imports = [
    # ./sound.nix
    # ./hyprland.nix
    # ./awesome
	# if options.useHyprland = true then ./hyprland.nix else ./awesome.nix;
	# lib.mkIf config.useHyprland ./hyprland.nix ./awesome.nix
	# ./sway.nix
  ];

  environment.variables = {
    EDITOR = "nvim";
    SHELL = "fish";
    KITTY_CONFIG_DIRECTORY = "/home/mightypancake/nix-config/home/programs/kitty";
  };

  fonts.packages = with pkgs; [
     monaspace
 #    noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-emoji
   ];

  nixpkgs = {
    config.allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
  	# xorg.xbacklight
  	# brightnessctl
  	# picom
  	# lua
    networkmanager
    networkmanagerapplet
   #  wget

  ];

  systemd.user.services = {
    nm-applet = {
      description = "Network manager applet";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig.ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
    };
  };

}
