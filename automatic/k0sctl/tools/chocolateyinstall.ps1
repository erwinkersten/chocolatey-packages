$ErrorActionPreference = 'Stop';

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://github.com/k0sproject/k0sctl/releases/download/v0.4.0/k0sctl-win-x64.exe'
$checksum64     = '03FA8C7C0E2F810B107FB39E4D3E8CD570699B83FE6F57306A90407D64CB8049'
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
