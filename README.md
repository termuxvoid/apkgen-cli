# apkgen-cli

CLI tool for Termux to quickly generate Android APKs from a template.

## Prerequisites

- Termux (from F-Droid, not Play Store)
- [TermuxVoid](https://termuxvoid.github.io) repository configured

## Installation

```bash
apt install apkgen-cli -y
```

## Quick Start

```bash
# Scaffold a new project
apkgen create myapp

# Enter the project directory
cd myapp

# Build a debug APK
apkgen build debug

# Output: app/build/outputs/myapp-debug.apk
```

## Commands

### `create <directory>`

Clones the project template into a new directory and prompts for app name and package name.

```bash
apkgen create myapp
```

### `build debug`

Compiles a debug APK with debug signing enabled.

```bash
apkgen build debug
```

### `build release`

Compiles an unsigned release APK. Sign manually with `apksigner` or `jarsigner`.

```bash
apkgen build release
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
| `create <dir>` | Scaffold project with custom app name and package |
| `build debug` | Build debug-signed APK |
| `build release` | Build unsigned release APK |
| `clean` | Remove build outputs |
| `help` | Show help text |

## Output

Built APKs are placed in:

```
app/build/outputs/
├── myapp-debug.apk
└── myapp-release-unsigned.apk
```

## Repository

Available via the [TermuxVoid repository](https://termuxvoid.github.io).

---

Made for Termux — [TermuxVoid](https://termuxvoid.github.io)
