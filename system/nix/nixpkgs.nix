{pkgs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (final: prev: {
        rocmPackages =
          prev.rocmPackages
          // {
            llvm =
              prev.rocmPackages.llvm
              // {
                compiler-rt = prev.rocmPackages.llvm.compiler-rt.overrideAttrs (new: old: {
                  nativeBuildInputs =
                    old.nativeBuildInputs
                    ++ [
                      (prev.python3Packages.python.withPackages (p: [p.setuptools p.looseversion]))
                    ];
                  postPatch =
                    old.postPatch
                    + ''
                                # Replace deprecated distutils.version.LooseVersion
                      substituteInPlace ../compiler-rt/test/lit.common.cfg.py \
                        --replace "from distutils.version import LooseVersion" "from looseversion import LooseVersion"

                    '';
                });
              };
          };
      })
    ];
  };
}
