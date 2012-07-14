@echo off

set currentDir=%~dp0

set toolsDir=%currentDir%tools

set PATH=%toolsDir%;%PATH%

pushd %toolsDir%

clickMeToCompile.pl

popd