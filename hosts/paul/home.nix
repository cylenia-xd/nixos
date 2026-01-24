{ pkgs, inputs, ... }: {
  imports = [
    "${inputs.self}/modules/home/editor"
    "${inputs.self}/modules/home/shell.nix"
  ];
  
  home.packages = with pkgs; [
    git
  ];

  # don't change this!
  home.stateVersion = "25.11";
}
