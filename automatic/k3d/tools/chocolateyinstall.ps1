$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v3.2.0/k3d-windows-amd64.exe

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'au-update'
$checksum    = 'au-update'
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