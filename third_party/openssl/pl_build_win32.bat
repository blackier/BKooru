@echo off
call "D:\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

cd src

git clean -fxd

perl Configure VC-WIN32 no-tests no-asm no-fuzz-libfuzzer no-fuzz-afl shared zlib-dynamic --with-zlib-include=E:\Desktop\bkcode\BKooru\third_party\zlib\include\zlib --with-zlib-lib=E:\Desktop\bkcode\BKooru\Release\zlib.lib

nmake build_libs

set copyargs=/y
set pl_file=..\pl_file\
set platform=win32
set targetpath=%pl_file%%platform%\

xcopy crypto\buildinf.h %targetpath%crypto\buildinf.h %copyargs%
xcopy include\crypto\bn_conf.h %targetpath%include\crypto\bn_conf.h %copyargs%
xcopy include\crypto\dso_conf.h %targetpath%include\crypto\dso_conf.h %copyargs%
xcopy include\openssl\opensslconf.h %targetpath%include\openssl\opensslconf.h %copyargs%

xcopy libcrypto.def %pl_file%libcrypto.def %copyargs%
xcopy libssl.def %pl_file%libssl.def %copyargs%

pause