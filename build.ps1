git submodule update --init --recursive

pushd .\libraries\boost\
  .\bootstrap.bat
  .\b2 headers
  .\b2 install --prefix=..\..\ --without-python --layout=tagged address-model=32 toolset=msvc-14.0 variant=debug,release link=static threading=multi runtime-link=static
popd

7z a -tzip -mtc=off -mx=9 OpenMC2-libs-vc140.zip include lib
