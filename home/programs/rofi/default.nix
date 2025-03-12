{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    theme = ./themes/spotlight-dark-Kypton.rasi;
  };
}
