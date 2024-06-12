function Get-CIPPMessageTrace {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$Days,
            [Parameter(Mandatory = $false)]
            [string]$Sender,
            [Parameter(Mandatory = $false)]
            [string]$Recipient
        )
    
    Write-Verbose "Getting message trace for $CustomerTenantID"
    $endpoint = "/api/listmessagetrace"
    $params = @{
        tenantfilter = $CustomerTenantID
        days = $Days
        sender = $Sender
        recipient = $Recipient
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}