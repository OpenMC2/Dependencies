#git submodule update --init --recursive

# boost is setup as a subset using the following command:
# $ bcp algorithm conversion dll filesystem lexical_cast predef preprocessor program_options property_tree range timer tokenizer tuple variant scope_exit core utility build ../Dependencies/libraries/boost
pushd .\libraries\boost\
  .\bootstrap.bat
  #.\b2 headers
  .\b2 install --prefix=..\..\ -j2 --layout=tagged address-model=32 toolset=msvc-14.0 variant=debug,release link=static threading=multi runtime-link=static
popd

7z a -tzip -mtc=off -mx=9 OpenMC2-libs-vs140.zip include lib
