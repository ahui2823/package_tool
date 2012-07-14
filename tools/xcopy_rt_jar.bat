@echo off
set originFilePath=%1
set batDir=%~dp0

xcopy %originFilePath%  %batDir% /Y/K