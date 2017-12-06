REM git submodule update --init --recursive

REM boost is setup as a subset using the following command:
REM $ bcp algorithm conversion dll filesystem lexical_cast predef preprocessor program_options property_tree range timer tokenizer variant scope_exit core utility build ../Dependencies/libraries/boost
pushd .\libraries\boost\
  call bootstrap
  REM b2 headers
  call b2 install --prefix=..\..\ -j2 --layout=tagged address-model=32 toolset=msvc-15.0 variant=debug,release link=static threading=multi runtime-link=static
popd

call 7z a -tzip -mtc=off -mx=9 OpenMC2-libs-vs150.zip include lib
