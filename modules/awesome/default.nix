{ inputs, pkgs, ... }: {
	services = {
		xserver = {
			xkb.layout = "pl";
			xkb.variant = "";
			enable = true;
			displayManager = {
				lightdm.greeters.slick = {
					enable = true;
					# user = "mightypancake";
					# background-color = "#000000"
					# window-color = "#000000"
					# border-color = "#000000"
					# background-image = "/usr/share/backgrounds/justice.png";
					# show-password-label = false
					# password-alignment = center
					# [greeter-theme]
					# font = "MonaspaceNeon"
					extraConfig = ''
[Greeter]
background=/usr/share/backgrounds/justice.png
draw-user-backgrounds = true
					'';
				};
			};
			windowManager.awesome = {
				enable = true;
				luaModules = with pkgs.luaPackages; [
					#luarocks
					#luadbi-mysql
				];
			};
		};
		displayManager.defaultSession = "none+awesome";
	};
}
