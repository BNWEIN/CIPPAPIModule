function Get-CIPPMailboxRestores {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$Identity,
            [Parameter(Mandatory = $false)]
            [switch]$Includereport,
            [Parameter(Mandatory = $false)]
            [switch]$Statistics

        )
    
    Write-Verbose "Getting mailbox restores for $CustomerTenantID"
    $endpoint = "/api/listmailboxrestores"
    $params = @{
        tenantfilter = $CustomerTenantID
        identity = $Identity
    }

    if ($Includereport) {
        $params.IncludeReport = "true"
    }

    if ($Statistics) {
        $params.Statistics = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

