$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/k0sproject/k0s/releases/download/v0.10.0/k0s-v0.10.0-amd64.exe'
$checksum64     = 'EA9B5BA939841D9F6C9FD711E8D74F663020D2FAB00AA1939720B97CC4FA2C92'
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
