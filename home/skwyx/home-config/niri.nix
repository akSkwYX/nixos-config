{ config, pkgs, ... }:
{
	wayland.windowManager.niri = {
		enable = true;
		checkConfig = true;
		xwaylandSatellitePackage = pkgs.xwayland-satellite;
		settings = {

			input = {

				keyboard = {
					xkb = {
						layout = "fr";
					};
					numlock = {};
				};

				touchpad = {
					tap = {};
					dwt = {};
					drag = true;
					natural-scroll = {};
					accel-profile = "flat";
					scroll-method = "two-finger";
					disabled-on-external-mouse = {};
				};

				mouse = {
					accel-profile = "flat";
				};

				disable-power-key-handling = {};
				mod-key = "Super";
			};

			layout = {
				gaps = 16;

				center-focused-column = "on-overflow";

				preset-column-widths._children = [
					{ proportion = 0.33; }
					{ proportion = 0.5; }
					{ proportion = 0.66; }
					{ proportion = 1.0; }
				];

				preset-window-heights._children = [
					{ proportion = 0.33; }
					{ proportion = 0.5; }
					{ proportion = 0.66; }
					{ proportion = 1.0; }
				];

				default-column-width._children = [
					{ proportion = 1.0; }
				];

				focus-ring = {
					off = {};
				};

				border = {
					width = 4;

					active-color = "#95318C";
					inactive-color = "#501A4B";
					urgent-color = "#FF9939";
				};

				tab-indicator = {
					hide-when-single-tab = {};
					
					gaps-between-tabs = 0;
					corner-radius = 2;
				};

				background-color = "transparent";
			};

			output = {
				_args = ["HDMI-A-1"];
				position._props = { x=-1920; y=0; };
			};

			window-rule = {
				geometry-corner-radius = 12;
				clip-to-geometry = true;
			};

			hotkey-overlay = {
				skip-at-startup = {};
			};

			overview = {
				workspace-shadow = {
					off = {};
				};
			};

			layer-rule = {
				match._props = { namespace="^wallpaper$"; };
				place-within-backdrop = true;
			};

			prefer-no-csd = {};

      spawn-at-startup = ["swaybg" "-i" "/home/skwyx/.config/wallpaper/current"
      "-o" "\"*\""];

			binds = {
				"Mod+Q".spawn = ["wezterm"];
				"Mod+A".spawn = ["qutebrowser"];

				"XF86AudioRaiseVolume".spawn = ["wpctl" "set-volume" "@DEFAULT_SINK" "5%+"];
				"XF86AudioLowerVolume".spawn = ["wpctl" "set-volume" "@DEFAULT_SINK" "5%-"];
				"XF86AudioMute".spawn = ["wpctl" "set-mute" "@DEFAULT_SINK" "toggle"];

				"Mod+O" = {
					_props.repeat = false;
					toggle-overview = {};
				};
				"Mod+C" = {
					_props.repeat = false;
					close-window = {};
				};

				"Mod+H".focus-column-left = {};
				"Mod+L".focus-column-right = {};
				"Mod+J".focus-window-or-workspace-down = {};
				"Mod+K".focus-window-or-workspace-up = {};

				"Mod+Shift+H".move-column-left = {};
				"Mod+Shift+L".move-column-right = {};
				"Mod+Shift+J".move-window-down-or-to-workspace-down = {};
				"Mod+Shift+K".move-window-up-or-to-workspace-up = {};

				"Mod+Ctrl+H".focus-monitor-left = {};
				"Mod+Ctrl+L".focus-monitor-right = {};
				"Mod+Ctrl+J".focus-monitor-down = {};
				"Mod+Ctrl+K".focus-monitor-up = {};

				"Mod+Ctrl+Shift+H".move-column-to-monitor-left = {};
				"Mod+Ctrl+Shift+L".move-column-to-monitor-right = {};
				"Mod+Ctrl+Shift+J".move-column-to-monitor-down = {};
				"Mod+Ctrl+Shift+K".move-column-to-monitor-up = {};
				
        "Mod+W".toggle-column-tabbed-display = {};
				"Mod+Comma".consume-window-into-column = {};
				"Mod+Semicolon".expel-window-from-column = {};

				"Mod+T".switch-preset-column-width = {};
				"Mod+Shift+T".switch-preset-window-height = {};
				"Mod+F".maximize-column = {};
				"Mod+Shift+F".fullscreen-window = {};

				"Ctrl+Shift+E".quit = {};
			};
		};
	};
}
