$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://github.com/rancher/k3d/releases/download/v3.3.0/k3d-windows-amd64.exe'
$checksum    = '6F14A3B415EF38E527957F7AA0C82B3FF8B1F7B9589B9CA2615AD42BBBF51831'
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
