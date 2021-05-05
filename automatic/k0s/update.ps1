import-module au
# $global:au_Force = $true
# Using latest in te release url to prevent test releases being detected. 
$owner = 'k0sproject'
$repo = 'k0s' 
$releases = "https://github.com/"+$owner+"/"+$repo+"/releases/latest"
https://github.com/k0sproject/k0s/releases/download/v1.21.0%2Bk0s.0/k0s-v1.21.0+k0s.0-amd64.exe

function global:au_SearchReplace {
    @{
        '.\legal\VERIFICATION.txt' = @{
            "(?i)(url:).*"       = "`$1'$($Latest.URL64)'"
            "(?i)(checksum:).*"  = "`$1'$($Latest.Checksum64)'"
            "(?i)(checksumType:).*"  = "`$1'$($Latest.ChecksumType64)'"
        } 
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase 'k0s' -NoSuffix}
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = "\/$owner\/$repo\/releases\/tag\/v\d{1,4}\.{0,1}\d{0,4}\.{0,1}\d{0,4}\+k0s\.{0,1}\d{0,4}$"
    $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
    $version = $url -split '\/|v' | Select-Object -Last 1
    $url = "https://github.com/$owner/$repo/releases/download/v$version/k0s-v$version-amd64.exe"
    
    return @{ 
        URL64 = $url
        Version = $version 
    }

}

Update-Package -ChecksumFor none