REM Download vcpkg to build dependencies
git clone https://github.com/Microsoft/vcpkg.git
set triplet=x86-windows-static

pushd vcpkg
  REM Build vcpkg
  call .\bootstrap-vcpkg.bat
  REM Build dependencies
  call .\vcpkg.exe install boost-algorithm:%triplet% boost-conversion:%triplet% boost-core:%triplet% boost-dll:%triplet% boost-filesystem:%triplet% boost-lexical-cast:%triplet% boost-predef:%triplet% boost-preprocessor:%triplet% boost-program-options:%triplet% boost-property-tree:%triplet% boost-range:%triplet% boost-timer:%triplet% boost-tokenizer:%triplet% boost-variant:%triplet% boost-scope-exit:%triplet% boost-utility:%triplet%
popd

call 7z a -tzip -mtc=off -mx=9 OpenMC2-libs-v141.zip .\vcpkg\installed\x86-windows-static\include .\vcpkg\installed\x86-windows-static\lib .\vcpkg\installed\x86-windows-static\debug
