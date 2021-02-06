$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/k3d/releases/download/v4.1.0/k3d-windows-amd64.exe'
$checksum64     = 'B8A1E3B613002060A5064E447F04DB73061719B6F88F1FB9022C90E0493EAE27'
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
