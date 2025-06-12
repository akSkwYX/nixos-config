# ❄️ NixOS Configuration Flake ❄️

This repository contains a [Nix Flake](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html) for managing reproducible NixOS configurations across multiple hosts. It leverages Nix’s declarative, functional approach to system configuration, allowing you to easily version, share, and reproduce system setups.

## 📚 Table of Contents

* [Prerequisites](#prerequisites)
* [Repository Structure](#repository-structure)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Customization](#customization)
* [Updating Flake Inputs](#updating-flake-inputs)
* [Troubleshooting](#troubleshooting)
* [Contributing](#contributing)

## 🧰 Prerequisites

* **Nix**: Make sure Nix is installed on your system. For instructions, see the [official Nix installation guide](https://nixos.org/download.html).
* **Flakes support**: Enable flakes by adding the following to your Nix configuration (`~/.config/nix/nix.conf`):

  ```text
  experimental-features = nix-command flakes
  ```
* **NixOS**: This flake is intended for use with NixOS (tested on NixOS 22.11 and 23.05).

## 🗂️ Repository Structure

```plain
├── flake.nix           # Root flake defining NixOS configurations
├── flake.lock          # Locked inputs for reproducible builds
├── hosts/              # Host-specific configurations
│   ├── host1.nix       # Example: Host "host1"
│   └── host2.nix       # Example: Host "host2"
├── modules/            # Reusable NixOS modules
│   ├── desktop.nix     # Desktop environment settings
│   ├── networking.nix  # Network and firewall
│   └── services.nix    # Common services (e.g., SSH, UFW)
└── README.md           # This documentation
```

* **`flake.nix`**: Defines the flake inputs (Nixpkgs and other dependencies) and the NixOS configurations for each host under `nixosConfigurations`.
* **`hosts/`**: Contains host-specific Nix expressions. Each file in this directory corresponds to a machine you wish to configure.
* **`modules/`**: Contains reusable modules that encapsulate functionality (desktop setup, services, networking, etc.).

## 🚀 Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/akSkwYX/nixos-config.git
   cd nixos-config
   ```

2. **Choose or create a host file**

   * Modify one of the existing files under `hosts/`, or create a new file named `<your-hostname>.nix` that imports and configures the modules you need.

3. **Rebuild your system**
   Replace `<your-hostname>` with the filename (without extension) of your host configuration.

   ```bash
   sudo nixos-rebuild switch --flake .#<your-hostname>
   ```

## 🖥️ Usage

* **List available hosts**:

  ```bash
  nix flake show
  ```

  This displays all `nixosConfigurations` defined in `flake.nix`.

* **Switch to another host**:

  ```bash
  sudo nixos-rebuild switch --flake .#other-host
  ```

* **Dry-run** a rebuild without applying changes:

  ```bash
  sudo nixos-rebuild build --flake .#<your-hostname> --dry-run
  ```

## 🎨 Customization

* **Add new modules**: Drop new `.nix` files into `modules/`, and import them in your host configuration:

  ```nix
  # hosts/<your-hostname>.nix
  { config, pkgs, ... }:
  {
    imports = [
      ./../modules/desktop.nix
      ./../modules/services.nix
    ];
    # Additional host-specific settings...
  }
  ```

* **Override module options**: Pass arguments or use Nix overlays if deeper customization is needed.

* **Pin Nixpkgs**: Change the `nixpkgs` input in `flake.nix` to a different revision or channel for testing package versions.

## 🔄 Updating Flake Inputs

To update all flake inputs (e.g., a new Nixpkgs release):

```bash
nix flake update
```

This updates `flake.lock`. Review changes before committing.

## 🛠️ Troubleshooting

* **Syntax errors**: Run `nix repl flake.nix` or `nix build .#<host>` to catch errors in your Nix expressions.
* **Missing packages**: Ensure packages are available in the pinned `nixpkgs` revision.
* **Rebuild failures**: Check system logs (`journalctl -b`) for details.

## 🤝 Contributing

1. Fork this repository.
2. Create a topic branch (`git checkout -b feature/xyz`).
3. Commit your changes.
4. Open a pull request.
