function Get-CIPPDomainHealth {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$DomainName,
            [Parameter(Mandatory = $true)]
            [ValidateSet("ReadWhoisRecord", "ReadNSRecord", "ReadMXRecord", "ReadSpfRecord", "ReadDmarcPolicy", "ReadDkimRecord", "TestDNSSEC", "TestMtaSts")]
            [string]$Action
        )
    
    Write-Verbose "Getting Domain Health for $DomainName with action $Action"

    $endpoint = "/api/listdomainhealth"
    $params = @{
        Domain = $DomainName
        Action = $action
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}