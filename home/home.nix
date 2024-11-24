{ inputs, pkgs, user, ... }: {

  imports = [
    # inputs.hyprland.homeManagerModules.default
  	./programs/fish.nix
  	./programs/rofi
  	# ./programs/nixvim
  	# ./programs/starship
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    sessionVariables = {
      EDITOR = "hx";
      TERMINAL = "kitty";

      PATH_FLAKE_CONFIG = "$HOME/config_flake";
      PATH_SCRIPTS = "$PATH_FLAKE_CONFIG/scripts";
      PATH_WALLPAPERS = "/home/${user}/OneDrive/images/wallpapers";
      PATH_PROGRAMS = "$PATH_FLAKE_CONFIG/home/programs";
    };
  };

  home.file = {
    ".config/awesome" = {
      source = ../modules/awesome;
    };
  };

  home.packages = (with pkgs; [
    vim 
    picom
    feh 
    
    # display manager
    lightdm
    # picom (fancy shmancy blur)
    picom
    # text editor
    helix
    # utils
    wget
    neofetch
    bottom
    bat
    onedrive
    
    # terminal
    oh-my-fish
    kitty
    tree
    # dev
    gcc
    bison
    flex
    # lua
    luarocks
    luajit
    love
    gnumake
    # media
    firefox
    # cava
    spotify
    # comms
    discord
    # games
    wine
    # I/O
    pulseaudio
    alsa-lib
    bluetuith
    blueman
    # Run app images
    appimage-run
  ]);

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userName = "MightyPancake";
    userEmail = "amightypancake@gmail.com";
	extraConfig = {
		core = {
			askpass = "";
		};
	};
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.05";
}
