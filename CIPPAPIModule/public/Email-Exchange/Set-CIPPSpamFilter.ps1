<#
.SYNOPSIS
Sets the state of a spam filter for a customer's tenant.

.DESCRIPTION
The Set-CIPPSpamFilter function is used to edit the state of a spam filter for a customer's tenant. It takes the customer's tenant ID, a unique identifier (optional), the name of the spam filter, and the desired state (Enable or Disable) as parameters.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER Guid
A unique identifier for the spam filter. This parameter is optional.

.PARAMETER Name
The name of the spam filter.

.PARAMETER State
The desired state of the spam filter. Valid values are "Enable" or "Disable".

.EXAMPLE
Set-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com" -Name "SpamFilter1" -State "Enable"
Sets the state of the spam filter named "SpamFilter1" to "Enable" for the customer's tenant with ID "contoso.onmicrosoft.com".

.EXAMPLE
Set-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com" -Guid "abcdefg" -Name "SpamFilter2" -State "Disable"
Sets the state of the spam filter named "SpamFilter2" to "Disable" for the customer's tenant with ID "contoso.onmicrosoft.com" using the unique identifier "abcdefg".

#>
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
