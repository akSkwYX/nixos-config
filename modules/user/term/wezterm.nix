{ config, pkgs, lib, ... }:
{
  programs.wezterm = {
    enable = config.components.term.wezterm.enable;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = "
local config = wezterm.config_builder()

config.font = wezterm.font(\"JetBrains Mono\")
config.font_size = 14
config.color_scheme = \"Catppuccin Mocha\"
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.window_background_opacity = 0.8
config.window_padding = {
  left = \"0px\",
  right = \"0px\",
  top = \"0px\",
  bottom = \"0px\",
}

return config
";
  };
}
