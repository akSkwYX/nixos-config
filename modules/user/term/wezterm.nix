{ config, pkgs, lib, ... }:
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = {
      "return {
         font = wezterm.font(\"JetBrains Mono\"),
         font-size = 24.0,
         color_scheme = \"Catppuccin Mocha\",
         hide_tab_bar_if_only_one_tab = true,
         tab_bar_at_bottom = true,
         use_fancy_tab_bar = true,
         window_background_opacity = 0.8,
       }"
    };
  };
}
