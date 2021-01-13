$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/astefanutti/kubebox/releases/download/v0.9.0/kubebox-windows.exe'
$checksum64     = 'CA615F9A918DA4FCE563B6820FCEB9AEBA50EE0C2B708C595A690ADA3B1B8CB1'
$checksumType64 = 'sha256' 

$packageArgs = @{
  softwareName   = 'kubebox'
  packageName    = 'kubebox'
  FileFullPath   = $toolsDir+'\kubebox.exe'  
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = $checksumType64 
  validExitCodes = @(0)
}

Get-ChocolateyWebFile @packageArgs
