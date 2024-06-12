function Set-CIPPCopyToSent {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $false)]
            [ValidateSet(
                "true",
                "false" 
                )]
            [string]$MessageCopyForSentAsEnabled = "true"
        )
    
    
    Write-Verbose "Copy Sent Items to Shared Mailbox for $userID $MessageCopyForSentAsEnabled"
    
    $endpoint = "/api/execcopyforsent"
    $params = @{
        tenantfilter                    = $CustomerTenantID
        id                              = $UserID
        MessageCopyForSentAsEnabled     = $MessageCopyForSentAsEnabled
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

