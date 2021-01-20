$ErrorActionPreference = 'Stop';
# https://github.com/rancher/k3d/releases/download/v(semver)/k3d-windows-amd64.exe

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/k3d/releases/download/v4.0.0/k3d-windows-amd64.exe'
$checksum64     = '02253801D8DB92E51FA67D47E5C8B07CEC477B2131FCB0D2490F53435142CDCA'
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
