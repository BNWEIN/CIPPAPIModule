function Get-CIPPContacts {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [GUID]$ContactID
        )
    
    if ($ContactID) {
        Write-Verbose "Getting Contact details for Contact: $ContactID"
    } else {
        Write-Verbose "Getting all Contacts for tenant $CustomerTenantID"
    }
    $endpoint = "/api/listcontacts"
    $params = @{
        tenantfilter = $CustomerTenantID
        contactid = $ContactID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params

}