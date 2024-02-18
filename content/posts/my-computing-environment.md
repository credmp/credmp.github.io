+++
title = "My computing environment"
author = ["Arjen Wiersma"]
date = 2024-02-18T15:35:00+01:00
tags = ["emacs", "development"]
categories = ["writing"]
draft = false
+++

> This is a longer form article. I is relevant as of **February 18th 2023**. If the circumstances of my environment changes I will try to update this article to reflect the situation. You can find the full source code of my dotfiles on [Github](https://github.com/credmp/nixos-dotfiles/).

I like consistency and simplicity. I do not like to use many different tools to do different things, I rather spend my time learning to use a few tools very well then to follow the hype on the latest trend of tools for something we have been doing forever.

This philosophy I transfer to pretty much everything in life. I have been using the same laptop bag for ages, I have a small mechanical keyboard, and I run the same version of my OS on all my devices. One device for on the go, the other for at home. They look the same and act the same, courtesy of an Linux distribution called [NixOS](https://nixos.org/).

Below you will find 2 screenshots, one from my laptop, the other from my desktop. The only difference is the size of the screen.

<a id="figure--fig:desktop"></a>

{{< figure src="/ox-hugo/desktop.png" caption="<span class=\"figure-number\">Figure 1: </span>My Linux desktop on my laptop" >}}

<a id="figure--fig:desktop-large"></a>

{{< figure src="/ox-hugo/desktop-large.png" caption="<span class=\"figure-number\">Figure 2: </span>My Linux desktop on my desktop" >}}


## NixOS {#nixos}

I use the NixOS distribution of Linux. NixOS is a wonderful operating system that works by declaring what you want your environment to be and then applying that declaration to the current version of the environment. That sounds difficult, but let me explain.

Suppose you have just installed a Linux distribution and you want to install the wonderful Emacs editor. In most distributions you will go to the package manager, search for Emacs and click on install. A few seconds later, Emacs is installed. With NixOS you edit a file that _describes_ your environment, you will add a line to it saying that Emacs is part of your environment. When you have saved the file you will ask NixOS to create a new version of your environment, to do so it will install Emacs for you.

I say it will create a new version of your environment. This means there is an old version as well, right? Yes! NixOS has a concept of Generations. This means every change happens in its own version of the environment. So, if a change goes wrong, you just revert back to the previous version.

This sounds like a great deal of work, and it is. It is not for the new Linux user, that is for sure. If you spend some time learning NixOS I am sure you will be grateful for it. Just the other day I tried to use the _wayland_ system on Linux, my configuration went horribly wrong and I was left with an unusable system. I rebooted the machine, selected the previous generation, and I was back where I started before the change. It is that useful!

As I share my configuration over multiple machines I split up the configuration into a machine specific version to my desktop, laptop, and the things that should run on both:

-   [Desktop Configuration](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/nix/configuration-desktop.nix)
-   [Laptop Configuration](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/nix/configuration.nix)
-   [Shared Configuration](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/nix/shared.nix)

The shared configuration contains all the juice, it sets up the graphical user interface, creates users and assigns to groups. This means that when you run this configuration you will end up in a very barren [i3](https://i3wm.org/) tiling window manager. More on that later.

Most of my applications are courtesy of something called [home-manager](https://github.com/nix-community/home-manager). This is a user-space application that allows for easy changes to the environment. As none of these changes can actually wreck the environment I kept them outside of the default NixOS configuration.

My [home-manager configuration](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/home-manager/home.nix) takes care of installing all the user-space tools that I use. It also sets up my shell and configures the Emacs daemon.

You might wonder, do you create a configuration file every time you need a tool? No! When I just need a one-off tool I use something called `nix-shell`. In the screenshots above you will notice that I run `neo-fetch`. This program is not part of my normal system as I only use it for screenshots as the one above. Within a terminal I run it as follows: `nix-shell -p neofetch --run neofetch`. This will temporarily install `neo-fetch` and run it. Afterwards it can be cleaned up. I also do this for most of the tools, such as `unzip`. I only install then when I need them. This keeps everything that is installed very clean.

You might also notice that there are not programming language toolchains in my configuration. That is correct. When I have a programming project I use something called `direnv`, see the [direnv webpage](https://direnv.net/) for some background.

Whenever I start a new programming project I run the following command in the project root: `nix --extra-experimental-features "nix-command flakes" flake new -t github:nix-community/nix-direnv .`. This will create a `flake.nix` file in which I can declare what this project needs as dependencies. As the rest of my environment is extremely clean, I will need to specify precisely what is needed. Take the listing below, it is part of a programming project in which I use Rust, Golang, Python and Java. Whenever I move into this project, all the tools will be installed. This also means that it works exactly the same on every single system where I use this setup.

<a id="code-snippet--lst:direnv"></a>
```nix
{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          pkg-config
          openssl.dev
          cargo
          rustc
          rustfmt
          clippy
          rust-analyzer
          aoc-cli
          go
          gopls
          gotools
          govulncheck
          pkgs.jdk
          pkgs.jdt-language-server
          pkgs.python311
        ];
        # Environment variable specifying the plugin directory of
        # the language server 'jdtls'.
        JDTLS_PATH = "${pkgs.jdt-language-server}/share/java";
      };
    });
}
```
<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--lst:direnv">Code Snippet 1</a>:</span>
  A nix-direnv declaration for a polyglot programming project
</div>

This might seem like a hassle. It is true, it is more work then just installing Golang on Ubuntu and _"just having it"_. But once you use multiple systems or work together in groups you will start appreciating it, trust me.


## i3 {#i3}

As I like simplicity I tend to not use elaborate windowing environments, such as Gnome or KDE. I try them out every once in a while, but I also go back to i3. Back in the day I ran enlightenment, but now I have been using i3 WM for quite some years. My configuration is quite mature and I generally only change it when I want to add a new tool to my daily use, or when tools get good updates such as [polybar](https://github.com/polybar/polybar). The configuration is part of my [dotfiles](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/i3/config).

When I boot my system all I have is a top bar that contains the following information:

-   💻 Active workspaces (each has its own icon and use)
-   💾 Current fill state of my disks
-   🛡️ VPN status
-   🔊 Sound and its volume percentage
-   🛜 Wifi state (laptop only)
-   🔋 Battery state (laptop only)
-   ⏰ Time
-   📥 Tray icons (flameshot, bluetooth and nextcloud)

That is it. After all those years working with computers, that is all I really need. If I could I would write a toggle for the bar as well, to only show up when needed.
The very appealing thing about i3 is its tiling feature. I will never have windows that overlap. Everything is neatly ordered in workspaces and within workspaces in columns or rows. As I create dedicated workspaces everything has a specific place:

1.  Terminal ([alacritty](https://alacritty.org/) with [tmux](https://github.com/tmux/tmux))
2.  [Emacs](/posts/22-years-of-emacs/)
3.  Virtual Machines
4.  Firefox
5.  Chrome

From workspace 6 on I consider them "throw-away" workspaces. The things I will store there will be used only shortly. The exception is workspace 10 (or 0). This contains my Spotify.

To launch applications I use something called [Rofi](https://github.com/davatorium/rofi). It is a window switcher, application launcher and menu replacement tool. It is very easy to customize and you can make it exactly what you want. My configuration is [available on github](https://github.com/credmp/nixos-dotfiles/blob/a7eca01bb7a091fef0f0b76276917f081d1161ea/.config/rofi/config.rasi).

{{< figure src="/ox-hugo/rofi.png" caption="<span class=\"figure-number\">Figure 3: </span>Rofi launching applications in i3" >}}

You can configure your environment exactly as you want. Take a look at [r/unixporn](https://www.reddit.com/r/unixporn/) for some more extreme versions of customized desktops.
