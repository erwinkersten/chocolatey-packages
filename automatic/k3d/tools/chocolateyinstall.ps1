$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://github.com/rancher/k3d/releases/download/v3.3.0/k3d-windows-amd64.exe'
$checksum    = '6f14a3b415ef38e527957f7aa0c82b3ff8b1f7b9589b9ca2615ad42bbbf51831'
$checksumType = 'sha256' 

$packageArgs = @{
  softwareName   = 'k3d'
  packageName    = 'k3d'
  FileFullPath   = $toolsDir+'\k3d.exe'  
  url            = $url
  checksum       = $checksum
  checksumType   = $checksumType 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
