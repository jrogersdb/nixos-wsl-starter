{ pkgs }:

{
  starship = pkgs.stdenv.mkDerivation {
    name = "starship-config";
    src = ./starship;
    installPhase = ''
      mkdir -p $out/config
      cp * $out/config/
    '';
  };
  # Add other program configs here as needed
}
