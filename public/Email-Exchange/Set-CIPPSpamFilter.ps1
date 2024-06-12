function Set-CIPPSpamFilter {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [guid]$Guid,
            [Parameter(Mandatory = $true)]
            [string]$Name,
            [Parameter(Mandatory = $true)]
            [ValidateSet("Enable", "Disable")]
            [string]$State
        )
    
    Write-Verbose "Editing Spam Filter"
    $endpoint = "/api/editspamfilter"
    $params = @{
        tenantfilter = $CustomerTenantID
        guid = $Guid
        name = $Name
        state = $State
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

