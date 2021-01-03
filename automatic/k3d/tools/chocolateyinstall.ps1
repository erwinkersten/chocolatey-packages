$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/k3d/releases/download/v3.4.0/k3d-windows-amd64.exe'
$checksum64     = '4ABF345922AA9B8F206813D70D5EBC6EEC6190A334476471A05011F48297B475'
$checksumType64 = 'sha256' 

$packageArgs = @{
  softwareName   = 'k3d'
  packageName    = 'k3d'
  FileFullPath   = $toolsDir+'\k3d.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
