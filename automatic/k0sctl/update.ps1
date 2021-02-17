import-module au
# $global:au_Force = $true
# Using latest in te release url to prevent test releases being detected. 
$owner = 'k0sproject'
$repo = 'k0sctl' 
$releases = "https://github.com/"+$owner+"/"+$repo+"/releases"

function global:au_SearchReplace {
    @{
        '.\legal\VERIFICATION.txt' = @{
            "(?i)(url:).*"       = "`$1'$($Latest.URL64)'"
            "(?i)(checksum:).*"  = "`$1'$($Latest.Checksum64)'"
            "(?i)(checksumType:).*"  = "`$1'$($Latest.ChecksumType64)'"
        } 
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase 'k0sctl' -NoSuffix}
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = "\/$owner\/$repo\/releases\/tag\/v\d{1,4}\.{0,1}\d{0,4}\.{0,1}\d{0,4}$"
    $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
    $version = $url -split '\/|v' | Select-Object -Last 1
    $url = "https://github.com/$owner/$repo/releases/download/v$version/k0sctl-win-x64.exe"
    
    return @{ 
        URL64 = $url
        Version = $version 
    }

}

Update-Package -ChecksumFor none