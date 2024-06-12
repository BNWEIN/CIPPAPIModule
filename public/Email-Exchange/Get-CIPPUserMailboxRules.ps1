function Get-CIPPUserMailboxRules {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    
        Write-Verbose "Getting user Mailbox Rules for $userID"
    
    $endpoint = "/api/listusermailboxrules"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

