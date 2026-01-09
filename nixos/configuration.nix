{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  ## Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  ## Locale / Time
  time.timeZone = "Asia/Kolkata";

  ## Display / X11
  services.displayManager.ly.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "caps:swapescape";
    };

    windowManager.bspwm = {
      enable = true;
      configFile = "/home/jay/.config/bspwm/bspwmrc";
      sxhkd.configFile = "/home/jay/.config/sxhkd/sxhkdrc";
    };
  };

  services.libinput.enable = true;

  ## Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  ## Users
  users.users.jay = {
    isNormalUser = true;
    extraGroups = [ "wheel" "network" ];
    packages = with pkgs; [
      git
    ];
  };

  users.defaultUserShell = pkgs.zsh;

  ## Shell
  programs.zsh = {
    enable = true;
    promptInit = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };

  programs.starship.enable = true;
  services.picom.enable = true;

  nixpkgs.config.allowUnfree = true;

  ## System packages
  environment.systemPackages = with pkgs; [

    alacritty

    eza
    xclip
    brightnessctl
    bat
    htop

    rofi
    xwallpaper

    neovim
    emmylua-ls
    nil
    stylua
    nixfmt


    ripgrep
    fd
    fzf
    stow

    papirus-icon-theme
    colloid-gtk-theme
    apple-cursor
    nwg-look

    brave
    librewolf

    wget
  ];

  ## Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.victor-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.zed-mono

    roboto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];

  ## Utilities
  programs.mtr.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  ## Services
  services.openssh.enable = true;

  ## NixOS release
  system.stateVersion = "25.11";
}
