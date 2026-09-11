@echo off
TITLE Android AVD Launcher

:: Set temporary environment variables scoped only to this script run
set JAVA_HOME=%~dp0jdk
set ANDROID_HOME=%~dp0
set ANDROID_AVD_HOME=%~dp0.android\avd

:: Prepend the local tools to the Windows PATH
set PATH=%JAVA_HOME%\bin;%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\emulator;%PATH%

echo [*] Starting Android 11 x86_64 Emulator...
emulator -avd Android11_x64 -gpu auto -scale 0.6 -no-snapshot-load

pause