{ lib, ... }:
let
  modulePath = [ "programs" "tor-browser" ];
  mkFirefoxModule = import ./firefox/mkFirefoxModule.nix;
in {
  meta.maintainers = [ lib.hm.maintainers.HeitorAugustoLN ];

  imports = [
    (mkFirefoxModule {
      inherit modulePath;
      name = "Zen Browser";
      unwrappedPackageName = "tor-browser";

      platforms = {
        linux = {
          configPath = ".tor";
        };
        darwin = { configPath = "Library/Application Support/TorBrowser-Data"; };
      };
    })
  ];
}
