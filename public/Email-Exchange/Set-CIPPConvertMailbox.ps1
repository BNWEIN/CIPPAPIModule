function Set-CIPPConvertMailbox {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $false)]
            [switch]$ConvertToUserMailbox
        )
    
    
    Write-Verbose "Converting Mailbox $userID"
    
    $endpoint = "/api/execconverttosharedmailbox"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $UserID
        ConvertToUser = if ($ConvertToUserMailbox) { "true" } else { "false" }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

