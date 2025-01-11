+++
date = '2025-01-11T14:31:20+01:00'
title = 'The joy of NixOS'
tags = ['linux', 'nixos']
categories = ['programming', 'operating systems']
+++

In July 2023, I installed NixOS as my daily operating system. NixOS is a Linux distribution that emphasizes a declarative approach to system management. This means you define your desired operating system configuration in a file (e.g., KDE with Emacs 30 and Firefox), and the Nix package manager uses that file to create your OS. Every change generates a new version, allowing you to revert to a previous version if anything goes wrong.

Prior to NixOS, I used various Ubuntu and Debian-based distributions, with POP_OS! being my favorite. I often encountered package conflicts or misconfigurations during updates. NixOS has resolved these issues for me.

Since switching in 2023, I've experienced zero problems with upgrades or stability. While experimenting with different desktop environments posed some challenges, the ability to reboot into a prior OS version (or "generation") has provided a safety net I didn't realize I needed.

My NixOS configuration primarily revolves around three files: `/etc/nixos/configuration.nix`, created during installation and tailored to my chosen desktop (currently KDE for my work laptop); `/etc/nixos/shared.nix`, which contains shared services and settings for my laptop, desktop, and work laptop, encompassing everything from Bluetooth to sound configurations. This setup ensures I have a consistent and functional desktop environment across all my systems.

The last file I manage is `~/.config/home-manager/home.nix`, which contains all the programs I want, such as Emacs, wl-clipboard, and Firefox, along with user services like the Emacs daemon. Essentially, I only need to edit `home.nix` as a user and run `home-manager switch` to deploy new programs on my system. 

During the biannual update cycle in May and November, I update the `nixos` and `home-manager` channels and run `sudo nixos-rebuild switch --upgrade` for a system upgrade. While there can be occasional breaking changes, Nix alerts me to these. I can easily run upgrades before important meetings, confident it will work smoothly, and if issues arise, I can simply reboot into a previous generation.

It's a delightful experience! Although there's a learning curve for newcomers, I highly recommend investing time in a VM to grasp the basics; it's well worth it over time.

In my `home.nix`, I include only the essential programs I use regularly, like Emacs. For my development projects, I rely on [nix-direnv](https://github.com/nix-community/nix-direnv), which manages project-specific dependencies, such as compilers. Each {{< backlink "clojure" "Clojure">}} project, for instance, contains a `flake.nix` file in the root that specifies its dependencies.

```nix
{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ 
            pkgs.clojure
            pkgs.clojure-lsp
            pkgs.clj-kondo
            pkgs.cljfmt
            pkgs.nodejs
            pkgs.jdk23
            pkgs.unzip
          ];
        };
      });
}
```

The `packages` list above establishes a complete development environment for users. When I share my project with others using NixOS (nix-direnv), it seamlessly works for them, as it has no external dependencies. For my {{< backlink "rust" "Rust">}} projects, like [hed](https://github.com/credmp/hed/blob/main/flake.nix), I utilize a similar `flake.nix` specific to that project. Moving it to a new machine and entering the directory automatically builds a new (complete) development environment via `nix-direnv`, allowing me to dive right in. 🏝️
