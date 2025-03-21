<#
.SYNOPSIS
    Creates a new Temporary Access Pass for a user in a Microsoft 365 tenant.

.DESCRIPTION
    The New-CIPPTemporaryAccessPass function creates a Temporary Access Pass (TAP) for a specified user
    in a given Microsoft 365 tenant. This provides temporary, time-limited access without requiring a
    permanent password.

.PARAMETER CustomerTenantID
    The tenant ID of the Microsoft 365 customer where the TAP will be created.

.PARAMETER UserID
    The ID of the user for whom the TAP will be created.

.EXAMPLE
    New-CIPPTemporaryAccessPass -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@contoso.onmicrosoft.com"

.EXAMPLE
    New-CIPPTemporaryAccessPass -CustomerTenantID "1a2b3c4d-1234-1234-1234-1a2b3c4d5e6f" -UserID "1a2b3c4d-1234-1234-1234-1a2b3c4d5e6f"

.NOTES
    The function uses the CIPP API endpoint '/api/ExecCreateTAP' to create the Temporary Access Pass.

.LINK
    Set-CIPPCreateTAP (Alias)
#>
function New-CIPPTemporaryAccessPass {
    [CmdletBinding()]
    [Alias('Set-CIPPCreateTAP')]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Creating TAP for User: $userID"

    $endpoint = '/api/ExecCreateTAP'
    $Body = @{
        tenantFilter = $CustomerTenantID
        Id           = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method POST
}
