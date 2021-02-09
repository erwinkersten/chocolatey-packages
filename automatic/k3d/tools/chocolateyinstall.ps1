$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/k3d/releases/download/v4.2.0/k3d-windows-amd64.exe'
$checksum64     = '372DC3F40830B47ADA445D234BF2FC1B2037F5B4F205868E41DF36CC2126DAB2'
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
