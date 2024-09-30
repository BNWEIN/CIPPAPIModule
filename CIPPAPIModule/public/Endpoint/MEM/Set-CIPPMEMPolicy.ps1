<#
.SYNOPSIS
Sets the CIPP MEM policy for a customer.

.DESCRIPTION
The Set-CIPPMEMPolicy function is used to set the CIPP (Customer Identity and Protection Platform) MEM (Mobile Endpoint Management) policy for a customer. It allows you to specify the customer tenant ID, policy ID, display name, description, and assignment type.

.PARAMETER CustomerTenantID
The unique identifier of the customer tenant.

.PARAMETER ID
The unique identifier of the policy.

.PARAMETER DisplayName
The display name of the policy.

.PARAMETER Description
The description of the policy.

.PARAMETER AssignTo
The assignment type for the policy. Valid values are "allLicensedUsers", "AllDevices", and "AllDevicesAndUsers".

.EXAMPLE
Set-CIPPMEMPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -ID "Policy001" -DisplayName "Policy 1" -Description "This is policy 1" -AssignTo "AllDevices"

This example sets the CIPP MEM policy for a customer with the specified parameters.

#>
function Set-CIPPMEMPolicy {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$ID,
        [Parameter(Mandatory = $false)]
        [string]$DisplayName,
        [Parameter(Mandatory = $false)]
        [string]$Description,
        [ValidateSet('allLicensedUsers', 'AllDevices', 'AllDevicesAndUsers')]
        [string]$AssignTo
    )

    Write-Verbose "Getting app consent requests for customer: $CustomerTenantID"
    $Endpoint = '/api/editpolicy'

    $body = @{
        Tenant      = $CustomerTenantID
        ID          = $ID
        displayname = $DisplayName
        description = $Description
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method 'POST'

}