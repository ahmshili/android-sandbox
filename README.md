# Local Android Virtual Device (AVD) Sandbox

A portable, well-documented workspace for manually provisioning and running Android Virtual Devices (AVD) using official command-line tools. 

To prevent repository bloat, all heavy SDK binaries, JDKs, and system images are kept strictly out of version control. This project also incorporates custom ROM extraction tools via a Git Submodule.

## 📦 Architecture
* **Main Environment:** Manages the Android 11 (`x86_64`) emulator, hardware profiles, and SDK pathing.
* **Submodule (`rom-extractor/`):** An independent toolkit for unpacking `payload.bin` files and extracting partitions like `boot.img`.

## ⚙️ Environment Setup

### 1. Install Dependencies
Download and extract the following into the repository root (these directories are ignored by Git):
* **`jdk/`**: [OpenJDK 17](https://adoptium.net/temurin/releases/?version=17)
* **`cmdline-tools/`**: [Android Command Line Tools](https://developer.android.com/tools)

### 2. Configure Environment Variables
Ensure your terminal session points to the local directories:
* `JAVA_HOME` -> `./jdk`
* `ANDROID_HOME` -> `./`
* `ANDROID_AVD_HOME` -> `./.android/avd`

Add the `bin` directories of `jdk`, `cmdline-tools/latest`, and `emulator` to your system `PATH`.

### 3. Provisioning the Emulator
Use the SDK manager to fetch the system image and accept licenses:
```bash
sdkmanager --licenses
sdkmanager "system-images;android-30;google_apis_playstore;x86_64"
```
Create the AVD instance:

Bash
avdmanager create avd -n Android11_x64 -k "system-images;android-30;google_apis_playstore;x86_64"
4. Launching
Start the emulator with hardware acceleration enabled:

Bash
emulator -avd Android11_x64 -gpu auto -scale 0.6 -no-snapshot-load