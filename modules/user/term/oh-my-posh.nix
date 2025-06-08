{ config, lib, ... }:
{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "velvet";
  };
}
