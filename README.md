# Local Android Virtual Device (AVD) Sandbox

A portable, well-documented workspace for manually provisioning and running Android Virtual Devices (AVD) without requiring a full Android Studio installation. 

To ensure clean version control and rapid repository cloning, all heavy SDK binaries, JDKs, and system images are kept strictly out of Git tracking. This project also integrates a custom ROM extraction toolkit via a Git Submodule.

## 📦 Project Architecture
* **Root Environment:** Manages the Android 11 (`x86_64`) emulator, hardware profiles, and local SDK path execution via batch scripts.
* **Submodule (`platform-tools/`):** An independent repository linked here for unpacking `payload.bin` files and extracting partitions like `boot.img`.

## ⚙️ Environment Setup

### 1. Install External Dependencies
Download and extract the following into the repository root (these directories are ignored by Git):
* **`jdk/`**: [OpenJDK 17](https://adoptium.net/temurin/releases/?version=17)
* **`cmdline-tools/`**: [Android Command Line Tools](https://developer.android.com/tools)

### 2. Provisioning the Emulator
Open your terminal (PowerShell/CMD) in the repository root and set your temporary paths to authenticate the SDK and download the Android 11 image:

```cmd
set JAVA_HOME=%cd%\jdk
set ANDROID_HOME=%cd%
set ANDROID_AVD_HOME=%cd%\.android\avd
set PATH=%JAVA_HOME%\bin;%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\emulator;%PATH%

sdkmanager --licenses
sdkmanager "system-images;android-30;google_apis_playstore;x86_64"
avdmanager create avd -n Android11_x64 -k "system-images;android-30;google_apis_playstore;x86_64"