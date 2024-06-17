<#
.SYNOPSIS
Retrieves contact details for a specific contact or all contacts for a given tenant.

.DESCRIPTION
The Get-CIPPContacts function retrieves contact details for a specific contact or all contacts for a given tenant in the CIPP system. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve the contacts. This parameter is mandatory.

.PARAMETER ContactID
Specifies the ID of the contact to retrieve details for. If not provided, details for all contacts in the specified tenant will be retrieved. This parameter is optional.

.EXAMPLE
Get-CIPPContacts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ContactID "65be49bb-85cb-4d92-9e34-9e855d0c830c"
Retrieves contact details for the contact with ID "65be49bb-85cb-4d92-9e34-9e855d0c830c" in the tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPContacts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves contact details for all contacts in the tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
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