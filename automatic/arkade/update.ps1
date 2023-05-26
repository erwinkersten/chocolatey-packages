import-module au
# $global:au_Force = $true
# Using latest in te release url to prevent test releases being detected. 
$owner = 'alexellis'
$repo = 'arkade'
$artifact  = 'arkade.exe'
$releases = "https://github.com/$owner/$repo/releases/latest"

function global:au_SearchReplace {
    @{
        '.\legal\VERIFICATION.txt' = @{
            "(?i)(url:).*"       = "`$1'$($Latest.URL64)'"
            "(?i)(checksum:).*"  = "`$1'$($Latest.Checksum64)'"
            "(?i)(checksumType:).*"  = "`$1'$($Latest.ChecksumType64)'"
        } 
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase 'arkade' -NoSuffix}
function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = "\/$owner\/$repo\/releases\/tag\/\d{0,4}\.{0,1}\d{0,4}\.{0,1}\d{0,4}"
    $url = $download_page.links | Where-Object href -match $regex| Select-Object -First 1 -expand href
    $version = $url -split '\/' | Select-Object -Last 1
    $fileversion = $version.Split('+') 
    $ver= $fileversion[0] 
    $url = "https://github.com/$owner/$repo/releases/download/$version/$artifact"

    return @{ 
        URL64 = $url
        Version = $ver 
    }

}
Update-Package -ChecksumFor none