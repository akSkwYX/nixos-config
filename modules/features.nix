{ lib, ... }:
{
  options.my = {
    gameDev.enable = lib.mkEnableOption "game dev apps";
  };
}
