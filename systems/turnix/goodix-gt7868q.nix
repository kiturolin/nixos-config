{
  lib,
  stdenv,
  kernel,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "goodix-gt7868q";
  version = "1.0.0";

  src = fetchFromGitHub{
    owner = "ty2";
    repo = "goodix-gt7868q-linux-driver";
    rev = "62f0d1898599c151a8245bc2fb7a7dcf931863b4";
    hash = "sha256-WukC3iK05eRmr/EalH75E4Y9dxOU2LIl2jtBB4lw1fg=";
  };

  patches = [
    ./report_fixup.patch
  ];

  nativeBuildInputs = kernel.moduleBuildDependencies;

  buildPhase = ''
    runHook preBuild
    make -C "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" M="$PWD" modules
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make -C "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" M="$PWD" INSTALL_MOD_PATH="$out" modules_install
    runHook postInstall
  '';

  postInstall = ''
    install -Dm644 local-overrides.quirks $out/etc/libinput/60-custom-thinkbookg6p2024imh.quirks
  '';

   meta = {
    description = "Goodix GT7868Q Linux Driver";
    homepage = "https://github.com/ty2/goodix-gt7868q-linux-driver";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ kituro ];
    platforms = lib.platforms.linux;
  };

}