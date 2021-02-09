$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'x'
$checksum64     = 'X'
$checksumType64 = 'sha256' 

$packageArgs = @{
  softwareName   = 'k0s'
  packageName    = 'k0s'
  FileFullPath   = $toolsDir+'\k0s.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
