$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = '-'
$checksum64     = '-'
$checksumType64 = '-' 

$packageArgs = @{
  softwareName   = 'rio'
  packageName    = 'rio'
  FileFullPath   = $toolsDir+'\rio.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
