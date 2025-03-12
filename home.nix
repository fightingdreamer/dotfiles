# note: custom module
# link: https://github.com/nix-community/home-manager/issues/333
#
# note: custom package
# link: https://discourse.nixos.org/t/how-to-run-derivations-from-home-manager/20505
#
# note: overlays / packages
# link: https://nixos-and-flakes.thiscute.world/nixpkgs/callpackage
#
# note: python packaging
# link: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/python.section.md#buildpythonpackage-function
{ config, pkgs, ... }:
let
  master = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/master
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "c19dedbc7407d4d15c16b6dc0e5ef530597ce7aa";
    sha256 = "sha256-zt4zxXxiifpIZe24yJqpltSnxxpW+/EhtZdi6ClUGec=";
  }) { };
  podman = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/master
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "e752b73238588a9959a3d89697e408cf90dca606";
    sha256 = "sha256-I9k5DmEOmunX2hdSrCIXNKX/+zUTqZsFSIClFXx6vco=";
  }) { };
  unstable = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "b3fcfcfabd01b947a1e4f36622bbffa3985bdac6";
    sha256 = "";
  }) { };
  kubectl_1_26 = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "5de3ce4de5f474f8e56e459abd9cd3d0ecef9d92";
    sha256 = "sha256-GGfysxcKsNkbZtZjfEmWEAA5uRQI5sL+R9eMo38gFwI=";
  }) { };
  kubectl_1_27 = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "3a3b8c94a5890bdbbd54fdb87fe42df68d54b5dc";
    sha256 = "sha256-Mh7kFF8PaziMakvO7L5qdhh7pp5kgiWMTtxErFZT2Yg=";
  }) { };
  kubectl_1_28 = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "ffb4d9542a9fab7cc5fe34fdaa5378d398ab3a99";
    sha256 = "sha256-9OcqkzkcExqkBGnvzdkn/VtaYlRj07zjHMqCFc+bvcQ=";
  }) { };
  kubectl_1_29 = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "6f59495cf3bde2eb600c7b2c97b30da89a07a0bf";
    sha256 = "sha256-2ZaJKr989yH/IuYsulUsff7aBgvqv9Uc/Ysn6z/0bPE=";
  }) { };
  kubectl_1_30 = import (pkgs.fetchFromGitHub {
    # https://github.com/NixOS/nixpkgs/tree/nixpkgs-unstable
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "2289df20856e5e4cf6ef89be1a340a4f288e9d28";
    sha256 = "sha256-eIpU++1GkrDncHCDEUli4fKH69TWjXKAVs6LTU2UwzE=";
  }) { };
in {
  nixpkgs.overlays = import ./overlays;
  nixpkgs.config = {
    # allowBroken = true;
    # allowUnsupportedSystem = true;
    permittedInsecurePackages = [ "python-2.7.18.7" ];
  };

  home = {
    username = "patryk";
    homeDirectory = "/Users/patryk";
    stateVersion = "23.05";
    sessionPath = [ "$HOME/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      EZA_COLORS =
        "reset:ur=0:uw=0:ux=0:ue=0:gr=0:gw=0:gx=0:tr=0:tw=0:tx=0:su=0:sf=0:sn=0:uu=0:uR=0:un=0:gu=0:gR=0:gn=0:da=0";
    };
    shellAliases = {
      c = "clear";
      t = "tree --dirsfirst";
      f = "fg";
      b = "bat";
      e =
        "eza --long --group --time-style long-iso --git --group-directories-last";
      v = "vim";
      l = "ls -lh --time-style=long-iso";
      ll = "ls -lh --time-style=long-iso";
      n = "nvim";
      r = "rye";
      z = "zellij";
      g = "lazygit";
      k = "kubectl";
      i = "ipython";
    };
    packages = with pkgs; [
      # headers
      # openssl

      # note: binary
      # dc3dd
      # dcfldd

      # note: serial
      picocom

      ## fonts
      freetype
      freetype.dev
      nerd-font-patcher

      ## shell upload
      asciinema

      ## perf
      ali
      oha
      cassowary
      hyperfine

      ## shell local
      # poop
      master.nushell
      unixtools.watch
      hwatch
      master.watchexec
      parallel
      aria2
      master.eza
      envsubst
      fd
      #git-local
      tig
      graphviz
      git
      git-cliff
      git-filter-repo
      lazygit # unstable
      lazydocker # unstable
      pv
      zf
      fzf
      fzy
      nnn
      btop
      htop
      # teetty
      faketty
      gnused
      diffr
      icdiff
      colordiff
      difftastic
      delta
      emacs29-nox
      #kakoune
      master.neovim # master
      # helix
      master.ranger # master
      ripgrep
      ncurses
      # mbuffer # fails on darwin
      tmux
      master.zellij
      tree
      master.vim
      zstd
      p7zip
      brotli
      #git-bug
      entr
      master.ncdu
      coreutils
      watchman

      ## nvim related
      universal-ctags

      ## lsp related
      tree-sitter

      # fish
      # fishPlugins.fzf-fish
      # fishPlugins.foreign-env
      # fishPlugins.forgit
      # fishPlugins.pure
      fishPluginsPure
      fishPlugins.colored-man-pages
      fishPlugins.sponge

      ## packages
      msgpack-tools
      yaml2json

      ## shell network
      bandwhich
      curlie
      httpie
      httpstat
      bombardier
      iperf3
      caddy
      xh

      ## virtual env
      # direnv
      sshfs

      ## kube
      kubectl_1_30.cmctl # cert-manager
      master.k3d
      # master.minikube
      kubectl_1_30.kubectl
      # kubectl_1_30.kubernetes-helm
      # kubectl_1_30.cilium-cli
      # kubectl_1_30.hubble

      # docker-registry
      skopeo

      ## virtualization
      master.qemu
      master.lima
      master.dive
      podman.podman
      podman.podman-tui

      ## network
      mtr
      nmap
      rsync
      rclone

      # note: vpn
      wireguard-tools
      wireguard-go
      openvpn
      easyrsa

      # build tools
      # pkg-config
      # freetype

      ## servers
      #caddy

      # note: db
      # master.redis
      master.redict
      master.valkey
      master.sqlite
      litecli
      postgresql

      # note: nix
      nixfmt
      statix
      deadnix
      alejandra
      master.nix-du
      master.nix-tree

      # note: cpp
      conan
      cmake
      meson
      ninja
      # gcc
      # ld
      # lld
      # libcxx
      # libcxxabi
      # clang_16
      clang-tools_16

      # note: lua
      master.luajit

      # note: zig
      # master.zig_0_13 # master
      master.zig_0_14 # master

      # note: go
      go

      # note: rust
      master.rustc
      master.cargo
      # dprint
      pastel
      numbat

      # note: json
      master.jq
      jiq # interactive jq
      master.hurl
      gron

      # note: yaml
      yq

      ## js
      master.web-ext
      master.biome
      master.bun # master
      #node2nix
      htmlq
      master.tailwindcss
      prettierd # unstable
      nodePackages.prettier # unstable

      ## spark
      # master.spark

      ## python
      master.uv
      master.rye
      master.ruff # master
      pypy3
      poetry
      blackd
      # pyflyby
      poethepoet
      # pylyzer
      # python27
      python311
      python311Packages.boost
      python311Packages.ipython
      python311Packages.poetry-core
      python311Packages.python-dotenv
      python311Packages.psycopg2

      #mypy

      # ruby
      ruby
      rbenv
      #shadowenv
      #rubyPackages.rubocop
      #rubyPackages.standardrb
      #rubyPackages.ruby-lsp
      #rubyPackages.solargraph
      #rubyPackages.syntax_tree

      ## systemd
      systemdlint

      ## javascript
      # nodejs
      nodePackages_latest.nodejs
      nodePackages.pnpm
      nodePackages.rollup

      ## image
      master.qoi
      imagemagick
      master.graphicsmagick

      ## audio
      #audacity

      ## browser
      # master.ladybird

      ## video
      # mpv
      mediainfo
      yt-dlp
      ffmpeg
      # libav_12

      ## ebooks
      ## calibre
    ];
  };

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    fish = {
      enable = true;
      loginShellInit = ''
        if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
          source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        end
      '';
      interactiveShellInit = ''
        set --export SHELL $HOME/.nix-profile/bin/fish
        set --universal pure_threshold_command_duration 0
        set --universal pure_show_subsecond_command_duration true
        set --universal pure_reverse_prompt_symbol_in_vimode true

        # fish_vi_key_bindings default
        fish_vi_key_bindings insert
        fish_vi_cursor

        # for mode in default insert visual
        #     bind -M $mode \r -m default execute
        # end

        set fish_cursor_default block
        set fish_cursor_insert line
        set fish_cursor_replace_one underscore
        set fish_cursor_visual block

        set sponge_allow_previously_successful true
        set sponge_purge_only_on_exit false
        set sponge_delay 300

        #rbenv init - fish | source

        # pnpm
        set -gx PNPM_HOME "/Users/patryk/Library/pnpm"
        if not string match -q -- $PNPM_HOME $PATH
          set -gx PATH "$PNPM_HOME" $PATH
        end
        # pnpm end
      '';
    };
    fzf = {
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableVteIntegration = true;
      enableAutosuggestions = true;
      initExtra = ''
        #eval "$(rbenv init - zsh)"
        #export TERM=xterm-256color
        PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
      '';
    };
    tmux = {
      enable = true;
      extraConfig = ''
        set -g mouse on
        set -g default-terminal xterm-256color
      '';
    };
    bat = {
      enable = true;
      config = {
        theme = "Solarized (light)";
        style = "plain";
      };
    };
    zellij = {
      enable = false;
      package = master.zellij;
      # enableZshIntegration = true;
      # enableFishIntegration = true;
      settings = {
        pane_frames = true;
        theme = "solarized-light-fixed";
        # theme = "mellow";
        session_serializatien = false;
        keybinds = {
          unbind = "Ctrl q";
          tab = { unbind = "s"; };
        };
        default_layout = "compact";
        themes = {
          "solarized-light-fixed" = {
            fg = [ 147 161 161 ];
            bg = [ 253 246 227 ];
            black = [ 240 237 236 ];
            red = [ 220 50 47 ];
            green = [ 133 153 0 ];
            yellow = [ 181 137 0 ];
            blue = [ 38 139 210 ];
            magenta = [ 211 54 130 ];
            cyan = [ 42 161 152 ];
            white = [ 88 110 117 ];
            orange = [ 203 75 22 ];
          };
          "mellow" = {
            bg = "#161617";
            fg = "#c9c7cd";
            red = "#f5a191";
            green = "#90b99f";
            blue = "#aca1cf";
            yellow = "#dcc27a";
            magenta = "#e29eca";
            orange = "#e6b99d";
            cyan = "#ea83a5";
            black = "#27272a";
            white = "#c1c0d4";
          };
        };
        # theme = "rose-pine-moon";
        # theme = "tokyo-night-dark";
        # theme "tokyo-night-dark"
        # theme "catppuccin-mocha"
        # theme "mellow"
      };
    };
    neovim = {
      #enable = true;

      #viAlias = true;
      #vimAlias = true;
      #vimDiffAlias = true;
    };
  };
}
