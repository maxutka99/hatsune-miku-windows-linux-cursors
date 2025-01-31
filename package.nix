{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "hatsune-miku-cursors";
  version = "1.2.6";

  src = fetchFromGitHub {
    owner = "supermariofps";
    repo = "hatsune-miku-windows-linux-cursors";
    rev = version;
    sha256 = "sha256-OQjjOc9VnxJ7tWNmpHIMzNWX6WsavAOkgPwK1XAMwtE=";
  };

  installPhase = ''
    install -dm 755 $out/share/icons
    mv miku-cursor-linux $out/share/icons/miku-cursor
  '';
}
