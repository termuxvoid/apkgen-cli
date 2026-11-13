<div align="center">
  <img alt="apkgen-cli" height="180" src="lib/apkgen.png">
  
  ---
  <p><b>⚡ A CLI tool to quickly generate Android APKs from local templates</b></p>

  <div>
    <a href="https://github.com/TermuxVoid/apkgen-cli/stargazers">
      <img src="https://img.shields.io/github/stars/TermuxVoid/apkgen-cli?style=for-the-badge&logo=github&color=ffd700&labelColor=0d1117" alt="GitHub Stars">
    </a>
    <a href="https://github.com/TermuxVoid/apkgen-cli/blob/main/LICENSE">
      <img src="https://img.shields.io/badge/License-BSD_3--Clause-blue?style=for-the-badge&logo=opensourceinitiative" alt="License">
    </a>
    <a href="https://github.com/TermuxVoid/apkgen-cli/issues">
      <img src="https://img.shields.io/github/issues/TermuxVoid/apkgen-cli?style=for-the-badge&logo=github&color=orange&labelColor=0d1117" alt="GitHub Issues">
    </a>
  </div>
</div>

## 📖 Table of Contents

- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Quick Start](#-quick-start)
- [Commands](#-commands)
- [Command Reference](#-command-reference)
- [Output](#-output)
- [Examples](#-examples)
- [Support & Community](#-support--community)

---

## 📋 Prerequisites

Before using apkgen-cli, ensure your environment meets these requirements:

- **Termux** installed from [F-Droid](https://f-droid.org/en/packages/com.termux/) (recommended) or GitHub
- **[TermuxVoid](https://termuxvoid.github.io)** repository configured
- **Android 7+** with ~1GB free storage
- **Working internet connection** for initial setup

---

## 🚀 Installation

Getting started is seamless. Run the following in your Termux terminal:

```bash
apt install apkgen-cli -y
```

> [!TIP]
> After installation, run `apkgen help` to verify everything is working correctly.

---

## ⚡ Quick Start

```bash
# Open the interactive menu
apkgen

# Or run commands directly:

# Scaffold a new Java project
apkgen create myapp

# Enter the project directory
cd myapp

# Build a debug APK
apkgen build debug

# Output: app/build/outputs/apk/debug/app-debug.apk
```

---

## 🔧 Commands

### `apkgen`

Launches an interactive menu for creating, building and cleaning projects. If there is no TTY (or `gum` is unavailable), it prints help instead, so scripts never get stuck in a prompt.

```bash
apkgen
```

### `create <directory> [--kotlin|--flutter|--nativec|--nativecpp]`

Clones the project template into a new directory and prompts for app name and package name. Defaults to Java if no flag is specified.

```bash
# Java project (default)
apkgen create myapp

# Kotlin project
apkgen create myapp --kotlin

# Flutter project
apkgen create myapp --flutter

# Native C++ project
apkgen create myapp --nativecpp

# Native C project
apkgen create myapp --nativec
```

### `build debug`

Compiles a debug APK. The project type is auto-detected: Flutter projects get split ABI outputs, everything else uses Gradle.

```bash
apkgen build debug
```

### `build release`

Compiles a release APK. Flutter projects produce a universal APK signed with the debug key (testing only); Gradle projects produce an unsigned APK you sign manually with `apksigner` or `jarsigner`.

```bash
apkgen build release
```

### `build flutter`

Legacy alias for Flutter projects. Defaults to debug; accepts `debug` or `release`.

```bash
apkgen build flutter
apkgen build flutter release
```

### `clean`

Removes all build artifacts from the project directory.

```bash
apkgen clean
```

### `version`

Prints the apkgen version.

```bash
apkgen version
```

### `help`

Prints usage information.

```bash
apkgen help
```

---

## 📊 Command Reference

<div align="center">

| Command | Description |
| :--- | :--- |
| `apkgen` | Open the interactive menu |
| `create <dir>` | Scaffold Java project (default) |
| `create <dir> --kotlin` | Scaffold Kotlin project |
| `create <dir> --flutter` | Scaffold Flutter project |
| `create <dir> --nativecpp` | Scaffold Native C++ project |
| `create <dir> --nativec` | Scaffold Native C project |
| `build debug` | Build debug APK (auto-detects Flutter/Gradle) |
| `build release` | Build release APK (auto-detects Flutter/Gradle) |
| `build flutter` | Legacy Flutter alias (debug by default) |
| `clean` | Remove build outputs |
| `version` | Show the apkgen version |
| `help` | Show help text |

</div>

---

## 📂 Output

### Android (Java/Kotlin/Native C/C++)

Built APKs are placed in:

```
app/build/outputs/apk/
├── debug/app-debug.apk
└── release/app-release-unsigned.apk
```

### Flutter

```
build/app/outputs/flutter-apk/
├── app-<abi>-debug.apk   # one per ABI (debug)
└── app-release.apk       # universal (release, debug-signed)
```

---

## 💡 Examples

```bash
# Create and build a Java app
apkgen create myapp
cd myapp && apkgen build debug

# Create and build a Kotlin app
apkgen create myapp --kotlin
cd myapp && apkgen build debug

# Create and build a Flutter app
apkgen create myflutter --flutter
cd myflutter && apkgen build debug
cd myflutter && apkgen build release

# Create a Native C++ app
apkgen create myapp --nativecpp
cd myapp && apkgen build debug

# Create a Native C app
apkgen create myapp --nativec
cd myapp && apkgen build debug

# Clean build artifacts
apkgen clean
```

---

## 🌐 Support & Community

Join the TermuxVoid community for support and updates.

<div align="center">
  <a href="https://telegram.me/nullxvoid">
    <img src="https://img.shields.io/badge/Telegram-Join_Group-2CA5E0?style=for-the-badge&logo=telegram" alt="Telegram">
  </a>
  <a href="https://github.com/TermuxVoid/repo">
    <img src="https://img.shields.io/badge/GitHub-Source_Code-181717?style=for-the-badge&logo=github" alt="GitHub">
  </a>
</div>

---

<div align="center">
  <sub>Built with ❤️ for security researchers by <a href="https://github.com/Anon4You">Alienkrishn</a> | Termux-optimized builds</sub>
</div>
