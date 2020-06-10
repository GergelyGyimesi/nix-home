{ config, pkgs, ... }:

{
  home = {
    username = "pwm";
    homeDirectory = "/Users/pwm";
    stateVersion = "20.03";

    packages = with builtins; with pkgs.lib;
      (map (n: getAttrFromPath [n] pkgs) (fromJSON (readFile ./pkgs.json)));

    file = { 
      ".config/fish/config.fish".source = fish/config.fish;
      ".config/fish/functions/fish_prompt.fish".source = fish/functions/fish_prompt.fish;
    };
  };

  programs = {
    home-manager.enable = true;

    bat.enable = true;
    direnv.enable = true;

    # fish = {
    #   enable = true;
    #   shellAliases = {
    #     hm = "home-manager";
    #     ne = "nix-env";
    #     ll = "exa -la --git";
    #     cat = "bat -p --paging=never";
    #     grep = "rg";
    #     rgh = "rg -g '*.{hs}'";
    #     tf = "terraform";
    #     ar = "assume-role";
    #   };
    # };

    git = {
      enable = true;
      userName = "Zsolt Szende";
      userEmail = "zsolt@artificial.io";
      ignores = [
        ".DS_Store"
        "*.niu"
        ".envrc"
        ".local"
      ];
      aliases = {
        co = "checkout";
        ci = "commit";
        b = "branch";
        d = "icdiff";
        s = "status";
      };
      extraConfig = {
        icdiff.options = "--highlight --line-numbers";
        branch.autosetuprebase = "always";
      };
    };

    htop.enable = true;
    jq.enable = true;
  };
}
