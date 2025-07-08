{ config, lib, ... }:
{
  programs.oh-my-posh = {
    enable = config.components.term.oh-my-posh.enable;
    enableZshIntegration = true;
    useTheme = "velvet";
  };
}
