<#
.SYNOPSIS
    Performs a BEC (Business Email Compromise) check for a user.

.DESCRIPTION
    The Get-CIPPBECCheck function performs a BEC check for a user by making a REST API call to the specified endpoint.
    It waits for the check to complete and returns the response.

.PARAMETER CustomerTenantID
    The ID of the customer's tenant.

.PARAMETER UserID
    The ID of the user.

.PARAMETER UserName
    The name of the user.

.EXAMPLE
    Get-CIPPBECCheck -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserName "JohnDoe"
    This example performs a BEC check for the user with the specified CustomerTenantID, UserID, and UserName.

#>

function Get-CIPPBECCheck {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    Write-Verbose "Running BEC Check for $Username"

    $endpoint = '/api/execbeccheck'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
        username     = $UserName
    }

    $initialResponse = Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    $GUID = $initialResponse.guid

    Write-Verbose "Initial check complete. GUID returned: $GUID"
    $params.guid = $GUID

    do {
        Start-Sleep -Seconds 10
        $response = Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params

        if ($response.waiting -eq 'True') {
            Write-Verbose 'BEC Check Still Running.'
        } else {
            Write-Verbose 'BEC Check complete'
            return $response
        }
    } while ($response.waiting -eq 'True')
}
