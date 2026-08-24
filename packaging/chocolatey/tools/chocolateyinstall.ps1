$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$url = 'https://github.com/jblaz6335/markmyvod-lite/releases/download/v1.0.0/MarkMyVOD-Lite-1.0-Windows-Final.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '7E904DAF0BAFEB1D60B08A3D9A93A03A501F9A67B6291FEB0DBF054EA2384EA6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$mainExe = Join-Path $toolsDir 'MarkMyVOD Lite 1.0\MarkMyVODLite.exe'
if (-not (Test-Path -LiteralPath $mainExe -PathType Leaf)) {
  throw "Expected MarkMyVOD executable was not found at '$mainExe'."
}

Get-ChildItem -LiteralPath $toolsDir -Filter '*.exe' -File -Recurse | ForEach-Object {
  if ($_.FullName -eq $mainExe) {
    New-Item -Path "$($_.FullName).gui" -ItemType File -Force | Out-Null
  } else {
    New-Item -Path "$($_.FullName).ignore" -ItemType File -Force | Out-Null
  }
}
