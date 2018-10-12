param([string]$parseSite="default")

function Invoke-SiteParse {
    $sites = Get-SPOSite
    foreach ($site in $sites) {
        #Write-Host -ForegroundColor Red $site.url -nonewline
        #Write-Host -ForegroundColor Red $site.Id -NoNewline
        #Write-Host -ForegroundColor Yellow "|"

        if($site.url -eq $parseSite) {
            Get-SPWWeb -Identity $site.url
            Get-SPWList
        }
    }
}

function Get-SPWSiteSite {
    Write-Host -ForegroundColor $_
}

function Get-SPWWeb ([string]$Identity) {
    #param([string]$Identity)

    Write-Host -ForegroundColor Green $Identity

    Disconnect-PnPOnline
    Connect-PnPOnline -Url $Identity -UseWebLogin
}

function Get-SPWList {
    foreach ($list in Get-PnPList) {
        if($list.ItemCount -gt 0) {
            Write-Host -ForegroundColor Blue "$($list.Title) $($list.ItemCount)" -NoNewline
            #Write-Host -ForegroundColor Blue $list.ItemCount
        }

    }
}
#function Get-
#Get-SPWWeb 
Invoke-SiteParse
