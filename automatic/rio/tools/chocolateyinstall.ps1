$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/rancher/rio/releases/download/v0.8.0/rio-windows-amd64'
$checksum64     = '83dfb50c51ed5b5496b65332f9677e546cb7da953c21f3cb93feae06def8b7e7'
$checksumType64 = 'sha256' 

$packageArgs = @{
  softwareName   = 'rio'
  packageName    = 'rio'
  FileFullPath   = $toolsDir+'\rio.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

