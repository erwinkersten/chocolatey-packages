$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/k3d/releases/download/v3.3.0/k3d-windows-amd64.exe'
$checksum64     = '6F14A3B415EF38E527957F7AA0C82B3FF8B1F7B9589B9CA2615AD42BBBF51831'
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
