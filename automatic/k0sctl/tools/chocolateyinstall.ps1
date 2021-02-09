$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'x'
$checksum64     = 'x'
$checksumType64 = 'sha256' 

$packageArgs = @{
  softwareName   = 'k0sctl'
  packageName    = 'k0sctl'
  FileFullPath   = $toolsDir+'\k0sctl.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
