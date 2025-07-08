## NixOS Configuration

This repository contains my personal NixOS configuration, which you can use as a template or starting point for your own setup.

## Overview

* **Purpose**: Provide a reusable, modular NixOS configuration that can be adapted for different machines and user environments.
* **Hosts**: Three predefined configurations:

  * **light**: Minimal, non-graphical setup (for headless or server environments).
  * **medium**: Basic graphical desktop (ideal for laptops).
  * **large**: Full-featured desktop (for workstations or gaming PCs).

## Prerequisites

1. Install NixOS following the official manual: [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation).
2. Ensure your `configuration.nix` enables Git support.

## Getting Started

1. Clone this repository to your preferred location:

   ```bash
   git clone https://github.com/akSkwYX/nixos-config.git <path-to-config>
   ```
2. Replace `hardware-configuration.nix` in the `hosts/` directory with your own hardware configuration:

   ```bash
   mv <your-hardware-config> hosts/hardware-configuration.nix
   ```
3. Apply the desired host configuration:

   ```bash
   sudo nixos-rebuild switch --flake <path-to-config>#<host>
   ```

   Replace `<host>` with `light`, `medium`, or `large`.

## User Management

All user definitions are located in the `users/` directory.

### Adding a New User

1. Create a folder for the new user:

   ```bash
   mkdir users/<newuser>
   ```
2. Copy the template files:

   ```bash
   cp users/skwyx/home.nix users/skwyx/user.nix users/<newuser>/
   ```
3. In `users/user_declaration.nix`, add:

   ```nix
   users.<newuser>.enable = lib.mkEnableOption "Enable <newuser>";
   ```
4. In `users/user_activation.nix`, add the new user import:

   ```nix
   imports = [
     ./<newuser>/user.nix
   ];
   ```
5. Enable the user in your host file (e.g., `hosts/medium.nix`):

   ```nix
   users = {
     <newuser>.enable = true;
   };
   ```
6. Customize `users/<newuser>/user.nix` (shell, groups, permissions) and `users/<newuser>/home.nix` (home-environment options, username, home directory).

### Removing a User

Disable the user in your host configuration:

```nix
users = {
  <user>.enable = false;
};
```

## Modules and Packages

System-wide and user-specific modules are located within the `modules/` directory:

* **System modules**: `modules/system/*` (services, system packages)
* **User modules**: `modules/user/*` (user applications, tools)

To add or remove functionality, modify the relevant module and update `components.nix` and activation files (e.g., in `users/<user>/home.nix`).

## Managing Dotfiles

This configuration supports multiple dotfile management strategies:

### 1. Flakes-based Dotfiles (Recommended)

1. Edit `flake.nix` to point to your dotfile repository:

   ```nix
   nvim-dotfiles.url = "github:YourUser/your-dotfiles-repo";
   ```
2. Update the import location in your user configuration (e.g., `users/<user>/home.nix`).
3. Rebuild your system and update flakes:

   ```bash
   nix flake update --flake .
   sudo nixos-rebuild switch --flake .#<host>
   ```

### 2. Home Manager

1. Remove flakes configurations.
2. Add your Home Manager configuration under `users/<user>/home.nix` (or split across multiple files).
3. Import your Home Manager files accordingly and rebuild.

### 3. Non-declarative Dotfiles

*Not recommended.*

1. Disable flakes usage.
2. Ensure required packages are installed via Nix.
3. Place your dotfiles in `~/.config/` manually.

## TODO

* **Testing**

  * Deactivate a previously enabled component
  * Verify the installation workflow end-to-end

* **Modules**

  * Add more modules with preconfigured settings

---

*Feel free to open an issue or submit a pull request for suggestions and improvements!*
 NixOS configuration
