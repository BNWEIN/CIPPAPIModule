<#
.SYNOPSIS
Manages CSP licenses for a tenant.

.DESCRIPTION
The Set-CIPPCSPLicense function manages Cloud Solution Provider (CSP) licenses for a specified tenant in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER SKU
Specifies the SKU of the license to manage.

.PARAMETER SubscriptionIds
Specifies an array of subscription IDs to manage.

.PARAMETER Action
Specifies the action to perform on the license. Valid values are 'Add', 'Remove', 'Update', or 'Cancel'.

.PARAMETER Quantity
Specifies the number of licenses to add or update. Only applicable for 'Add' or 'Update' actions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -SKU "O365_BUSINESS_PREMIUM" -SubscriptionIds @("sub-1", "sub-2") -Action Add -Quantity 5
Adds 5 licenses of the specified SKU to the tenant for the specified subscriptions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -SKU "O365_BUSINESS_PREMIUM" -SubscriptionIds @("sub-1") -Action Cancel
Cancels the specified subscription.

.NOTES
Requires appropriate permissions to manage CSP licenses.
#>

function Set-CIPPCSPLicense {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$SKU,

        [Parameter(Mandatory = $true)]
        [string[]]$SubscriptionIds,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add', 'Remove', 'Update', 'Cancel')]
        [string]$Action,

        [Parameter(Mandatory = $false)]
        [int]$Quantity
    )

    Write-Verbose "Managing CSP license SKU: $SKU for tenant $CustomerTenantID with action $Action"

    $endpoint = '/api/ExecCSPLicense'
    $body = @{
        tenantFilter    = $CustomerTenantID
        SKU             = $SKU
        subscriptionIds = $SubscriptionIds
        action          = $Action
    }

    if ($Action -in @('Add', 'Update')) {
        $body['quantity'] = $Quantity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}<#
.SYNOPSIS
Manages CSP licenses for a tenant.

.DESCRIPTION
The Set-CIPPCSPLicense function manages Cloud Solution Provider (CSP) licenses for a specified tenant in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER LicenseId
Specifies the ID of the CSP license to manage.

.PARAMETER SKU
Specifies the SKU of the license to manage.

.PARAMETER SubscriptionIds
Specifies an array of subscription IDs to manage.

.PARAMETER Action
Specifies the action to perform on the license. Valid values are 'Add', 'Remove', 'Update', or 'Cancel'.

.PARAMETER Quantity
Specifies the number of licenses to add or update. Only applicable for 'Add' or 'Update' actions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -SKU "O365_BUSINESS_PREMIUM" -SubscriptionIds @("sub-1", "sub-2") -Action Add -Quantity 5
Adds 5 licenses of the specified type to the tenant for the specified subscriptions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -SKU "O365_BUSINESS_PREMIUM" -SubscriptionIds @("sub-1") -Action Cancel
Cancels the specified subscription.

.NOTES
Requires appropriate permissions to manage CSP licenses.
#>

function Set-CIPPCSPLicense {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$LicenseId,

        [Parameter(Mandatory = $true)]
        [string]$SKU,

        [Parameter(Mandatory = $true)]
        [string[]]$SubscriptionIds,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add', 'Remove', 'Update', 'Cancel')]
        [string]$Action,

        [Parameter(Mandatory = $false)]
        [int]$Quantity
    )

    Write-Verbose "Managing CSP license $LicenseId (SKU: $SKU) for tenant $CustomerTenantID with action $Action"

    $endpoint = '/api/ExecCSPLicense'
    $body = @{
        tenantFilter    = $CustomerTenantID
        LicenseId       = $LicenseId
        SKU             = $SKU
        SubscriptionIds = $SubscriptionIds
        Action          = $Action
    }

    if ($Action -in @('Add', 'Update')) {
        $body['Quantity'] = $Quantity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}<#
.SYNOPSIS
Manages CSP licenses for a tenant.

.DESCRIPTION
The Set-CIPPCSPLicense function manages Cloud Solution Provider (CSP) licenses for a specified tenant in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER LicenseId
Specifies the ID of the CSP license to manage.

.PARAMETER Action
Specifies the action to perform on the license. Valid values are 'Add', 'Remove', or 'Update'.

.PARAMETER Quantity
Specifies the number of licenses to add or update. Only applicable for 'Add' or 'Update' actions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Add -Quantity 5
Adds 5 licenses of the specified type to the tenant.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Remove
Removes the specified license from the tenant.

.NOTES
Requires appropriate permissions to manage CSP licenses.
#>

function Set-CIPPCSPLicense {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$LicenseId,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add', 'Remove', 'Update', 'Cancel')]
        [string]$Action,

        [Parameter(Mandatory = $false)]
        [int]$Quantity
    )

    Write-Verbose "Managing CSP license $LicenseId for tenant $CustomerTenantID with action $Action"

    $endpoint = '/api/ExecCSPLicense'
    $body = @{
        tenantFilter = $CustomerTenantID
        licenseId    = $LicenseId
        action       = $Action
    }

    if ($Action -in @('Add', 'Update')) {
        $body['quantity'] = $Quantity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}<#
.SYNOPSIS
Manages CSP licenses for a tenant.

.DESCRIPTION
The Set-CIPPCSPLicense function manages Cloud Solution Provider (CSP) licenses for a specified tenant in the CIPP system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER LicenseId
Specifies the ID of the CSP license to manage.

.PARAMETER Action
Specifies the action to perform on the license. Valid values are 'Add', 'Remove', or 'Update'.

.PARAMETER Quantity
Specifies the number of licenses to add or update. Only applicable for 'Add' or 'Update' actions.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Add -Quantity 5
Adds 5 licenses of the specified type to the tenant.

.EXAMPLE
Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Remove
Removes the specified license from the tenant.

.NOTES
Requires appropriate permissions to manage CSP licenses.
#>

function Set-CIPPCSPLicense {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$LicenseId,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Add', 'Remove', 'Update', 'Cancel')]
        [string]$Action,

        [Parameter(Mandatory = $false)]
        [int]$Quantity
    )

    Write-Verbose "Managing CSP license $LicenseId for tenant $CustomerTenantID with action $Action"

    $endpoint = '/api/ExecCSPLicense'
    $body = @{
        tenantFilter = $CustomerTenantID
        licenseId    = $LicenseId
        action       = $Action
    }

    if ($Action -in @('Add', 'Update')) {
        $body['quantity'] = $Quantity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}