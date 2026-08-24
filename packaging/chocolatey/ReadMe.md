# MarkMyVOD Lite Chocolatey package

This directory contains the community Chocolatey package source for MarkMyVOD Lite.

Build it from this directory with:

```powershell
choco pack markmyvod-lite.nuspec
```

The install script downloads the public vendor ZIP, verifies its SHA-256 checksum, extracts it into the Chocolatey package tools directory, creates a GUI shim only for `MarkMyVODLite.exe`, and suppresses shims for bundled runtime executables.
