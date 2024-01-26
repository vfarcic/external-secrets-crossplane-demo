let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
    gum
    git
    kubernetes-helm
    kubectl
    kind
    yq-go
    bat
    awscli2
  ];
  shellHook =
  ''
    curl -sL "https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh" | sh
    mkdir -p bin
    mv crossplane bin/.
    export PATH=$PWD/bin:$PATH
  '';
}
