function Get-CIPPEnabledSharedMailboxes {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting shared mailboxes with account enabled for $CustomerTenantID"
    $endpoint = "/api/listsharedmailboxaccountenabled"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

