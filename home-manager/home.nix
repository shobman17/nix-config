# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      outputs.overlays.packages22

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  # Set your username
  home = {
    username = "shob";
    homeDirectory = "/home/shob";

    packages = with pkgs: [
      python3
      gcc
      libgcc
      libgccjit
      wget
      vim
      cmatrix
      sl
      pipes
      tenki
      lf
      fzf
      protonup
      distrobox
      neofetch
      bat
      obsidian
      kdePackages.okular
      sioyek
      lua
      docker
      brave
      # kicad
      wine
      winetricks
      protontricks
      pkgs22.quartus-prime-lite # hoo boy
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATH = "\${HOME}/.steam/root/compatibility.d";
      NIXPKGS_ALLOW_UNFREE=1;
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "terminator";
    };

    file = {
      ".config/nvim" = dotfiles/nvim; # neovim lua config
    };
  };

  # Add stuff for your user as you see fit:
  
  # NeoVim config lessgoo
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  # git config oof
  programs.git = {

    enable = true;
    userName = "shobman17";
    userEmail = "210070081@iitb.ac.in";

    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };

  };

  # gtk config (oh mah gawd he's ricing)
  gtk = {

    enable = true;

     /* theme = {
      package = pkgs.nightfox-gtk-theme;
      name = "Nightfox-Dark";
    };*/

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    /* iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-dark";
    };*/
    
    font = {
      package = pkgs.nerdfonts;
      name = "SauceCodeProNerdFont-Regular";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

  };

  programs.terminator = {
    
    enable = true;

    config = {

      global_config = {
        borderless = true;
        window_state = "maximise";
        handle_size = 0;
      };

      profiles.default = {
        copy_on_selection = true;
        # use_theme_colors = true;
        foreground_color = "#BBBBBB";
        background_color = "#000000";
        bold_is_bright = true;
        background_type = "transparent";
        background_darkness = 0.89;
        scrollbar_position = "hidden";
        show_titlebar = false;
        # use_system_font = false;
        # font = "SauceCodePro-Nerd-Font-Regular 11";
      };

    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      # Load __git_ps1 bash command.
      . ~/.nix-profile/share/git/contrib/completion/git-prompt.sh
      # Also load git command completions for bash.
      . ~/.nix-profile/share/git/contrib/completion/git-completion.bash

      # Show git branch status in terminal shell.
      export PS1='\[\e[36;1m\](\u)\[\e[38;5;104m\][\w]\[\e[0;38;5;213m\]$(__git_ps1 "(%s)")\[\e[0m\]\\$ '
    '';
  };
  
  

  # dconf settings for gnome
  dconf = {

    enable = true;

    settings = {
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminator" = {
        binding = "<Primary><Alt>t";
        command = "terminator";
        name = "open-terminator";
      };

      "org/gnome/shell" = {
        disable-user-extension = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          # idk about any extensions rn  
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/terminator/"
        ];
      };

    };
  }; 

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
