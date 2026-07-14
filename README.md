<div align="center">
  <img alt="apkgen-cli" height="180" src="lib/apkgen.png">
  <h1>apkgen-cli</h1>
  <p><b>⚡ A CLI tool to quickly generate Android APKs from local templates</b></p>

  <div>
    <a href="https://github.com/TermuxVoid/repo/stargazers">
      <img src="https://img.shields.io/github/stars/TermuxVoid/repo?style=for-the-badge&logo=github&color=ffd700&labelColor=0d1117" alt="GitHub Stars">
    </a>
    <a href="https://github.com/TermuxVoid/repo/blob/main/LICENSE">
      <img src="https://img.shields.io/badge/License-BSD_3--Clause-blue?style=for-the-badge&logo=opensourceinitiative" alt="License">
    </a>
    <a href="https://github.com/TermuxVoid/repo/issues">
      <img src="https://img.shields.io/github/issues/TermuxVoid/repo?style=for-the-badge&logo=github&color=orange&labelColor=0d1117" alt="GitHub Issues">
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
# Scaffold a new Java project
apkgen create myapp

# Enter the project directory
cd myapp

# Build a debug APK
apkgen build debug

# Output: app/build/outputs/myapp-debug.apk
```

---

## 🔧 Commands

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

Compiles a debug APK with debug signing enabled (Android).

```bash
apkgen build debug
```

### `build release`

Compiles an unsigned release APK (Android). Sign manually with `apksigner` or `jarsigner`.

```bash
apkgen build release
```

### `build flutter`

Builds a debug APK for Flutter projects with split ABI outputs.

```bash
apkgen build flutter
```

### `clean`

Removes all build artifacts from the project directory.

```bash
apkgen clean
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
| `create <dir>` | Scaffold Java project (default) |
| `create <dir> --kotlin` | Scaffold Kotlin project |
| `create <dir> --flutter` | Scaffold Flutter project |
| `create <dir> --nativecpp` | Scaffold Native C++ project |
| `create <dir> --nativec` | Scaffold Native C project |
| `build debug` | Build debug-signed APK (Android) |
| `build release` | Build unsigned release APK (Android) |
| `build flutter` | Build debug APK (Flutter, split ABI) |
| `clean` | Remove build outputs |
| `help` | Show help text |

</div>

---

## 📂 Output

### Android (Java/Kotlin/Native C/C++)

Built APKs are placed in:

```
app/build/outputs/
├── myapp-debug.apk
└── myapp-release-unsigned.apk
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
cd myflutter && apkgen build flutter

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
