import-module au
$global:au_Force = $true

# Using latest in te release url to prevent test releases being detected. 
$releases = 'https://github.com/rancher/k3d/releases/latest'

function global:au_SearchReplace {
    @{
        '.\tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $artifact  = "k3d-windows-amd64.exe"
    $url = $download_page.links | Where-Object href -match $artifact | Select-Object -First 1 -expand href
    $version = ([regex]::Match($url,'/rancher/k3d/releases/download/v(.+)/'+$artifact)).Captures.Groups[1].value
    $url = 'https://github.com' + $url

    return @{ 
        URL64 = $url
        Version = $version 
    }

}
if ($MyInvocation.InvocationName -ne '.') {
    update -ChecksumFor 64
}