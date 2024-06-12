function Get-CIPPMailboxPermissions {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    Write-Verbose "Getting mailbox permissions for $CustomerTenantID"
    $endpoint = "/api/listmailboxpermissions"
    $params = @{
        tenantfilter = $CustomerTenantID
        userid = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

