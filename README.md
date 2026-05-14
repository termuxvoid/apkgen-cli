# apkgen-cli

A CLI tool to quickly generate Android APKs from local templates.

## Prerequisites

- Termux (from F-Droid, not Play Store)
- [TermuxVoid](https://termuxvoid.github.io) repository configured

## Installation

```bash
apt install apkgen-cli -y
```

## Quick Start

```bash
# Scaffold a new Java project
apkgen create myapp

# Enter the project directory
cd myapp

# Build a debug APK
apkgen build debug

# Output: app/build/outputs/myapp-debug.apk
```

## Commands

### `create <directory> [--kotlin|--flutter]`

Clones the project template into a new directory and prompts for app name and package name. Defaults to Java if no flag is specified.

```bash
# Java project (default)
apkgen create myapp

# Kotlin project
apkgen create myapp --kotlin

# Flutter project
apkgen create myapp --flutter
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

## Command Reference

| Command | Description |
|---|---|
| `create <dir>` | Scaffold Java project (default) |
| `create <dir> --kotlin` | Scaffold Kotlin project |
| `create <dir> --flutter` | Scaffold Flutter project |
| `build debug` | Build debug-signed APK (Android) |
| `build release` | Build unsigned release APK (Android) |
| `build flutter` | Build debug APK (Flutter, split ABI) |
| `clean` | Remove build outputs |
| `help` | Show help text |

## Output

### Android (Java/Kotlin)

Built APKs are placed in:

```
app/build/outputs/
├── myapp-debug.apk
└── myapp-release-unsigned.apk
```

### Flutter

Built APKs (split by ABI) are placed in the Flutter build output directory.

## Examples

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

# Clean build artifacts
apkgen clean
```

## Repository

Available via the [TermuxVoid repository](https://termuxvoid.github.io).

---

Made for Termux — [TermuxVoid](https://termuxvoid.github.io)
