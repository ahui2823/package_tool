@echo off

set project=%1
set apkname=%2
set version=%3
set originTag=%4
set destinationDir=%5

rem Ç©ÃûÓÃµÄkey
set apk_key=%6
set apk_keypass=%7
set apk_keystore=%8

pushd %project%

if exist TempAndroidManifest.xml del /Q TempAndroidManifest.xml

rename AndroidManifest.xml TempAndroidManifest.xml

popd

read_qudao_config.pl %apkname% %version% %project% %originTag% %apk_key% %apk_keypass% %apk_keystore%

if %errorlevel% NEQ 1 ( move /Y %project%\*.apk %destinationDir%)

if exist %apkname%_proguard.map ( move /Y %apkname%_proguard.map %destinationDir%)

pushd %project%

if exist TempAndroidManifest.xml (del /Q AndroidManifest.xml)

rename TempAndroidManifest.xml AndroidManifest.xml

popd