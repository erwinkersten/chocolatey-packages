import-module au
# $global:au_Force = $true
# Using latest in te release url to prevent test releases being detected. 
$releases = 'https://github.com/alexellis/arkade/releases/latest'
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
    $artifact  = "arkade.exe"
    $url = $download_page.links | Where-Object href -match $artifact | Select-Object -First 1 -expand href
    $version = ([regex]::Match($url,'/alexellis/arkade/releases/download/(.+)/'+$artifact)).Captures.Groups[1].value
    $url = 'https://github.com' + $url

    return @{ 
        URL64 = $url
        Version = $version 
    }

}
Update-Package -ChecksumFor none