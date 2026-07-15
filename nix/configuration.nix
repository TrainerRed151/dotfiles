{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.UTF-8";

  # User
  users.users.brian = {
    isNormalUser = true;
    description = "Brian";

    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];

    shell = pkgs.fish;
  };

  # Available shells (Fish is default, Bash is also installed)
  environment.shells = with pkgs; [
    bash
    fish
  ];

  programs.fish.enable = true;

  # Wayland / Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.xwayland.enable = true;

  # Start Sway directly via greetd
  services.greetd = {
    enable = true;

    settings.default_session = {
      command = "${pkgs.sway}/bin/sway";
      user = "brian";
    };
  };

  # Audio
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    pulse.enable = true;
  };

  security.rtkit.enable = true;

  # SSH
  services.openssh.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # GPG / pass
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    # Shells
    bash
    fish

    # Development / CLI
    neovim
    mise
    ledger
    sqlite
    git
    openssh
    tmux
    kitty

    # Password manager
    pass
    gnupg

    # Utilities
    curl
    wget
    unzip
    htop

    # Build tools
    gcc
    gnumake

    # Sway / Wayland
    swaybg
    swayidle
    swaylock
    waybar
    bemenu
    mako
    wl-clipboard
    brightnessctl
  ];

  # Enable flakes and the modern Nix CLI
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # NixOS release compatibility
  system.stateVersion = "26.05";
}
