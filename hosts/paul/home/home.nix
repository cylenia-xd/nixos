{ pkgs, inputs, ... }: {
  imports = [
    "${inputs.self}/modules/h/helix.nix"
  ];
  
  home.packages = with pkgs; [
    git
  ];

  # don't change this!
  home.stateVersion = "25.11";
}
