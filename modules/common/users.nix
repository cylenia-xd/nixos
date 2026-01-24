{ ... }: {
  users = {
    mutableUsers = false;
    users.cylenia = {
      isNormalUser = true;
      description = "Cylenia";
      shell = pkgs.bash;
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$y$j9T$gej56YvgGE.K/x4UOF/mZ1$W7EQoyuqICLE8uV1oIxM.cI180PXT9xERVXMzDdtAV0";
    };
    users.root = {
      hashedPassword = "$y$j9T$gej56YvgGE.K/x4UOF/mZ1$W7EQoyuqICLE8uV1oIxM.cI180PXT9xERVXMzDdtAV0";
    };
  };
}
