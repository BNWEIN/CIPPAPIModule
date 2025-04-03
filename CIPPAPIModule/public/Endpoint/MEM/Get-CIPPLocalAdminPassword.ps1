<#
.SYNOPSIS
Retrieves the local admin password for a specified computer.

.DESCRIPTION
The Get-CIPPLocalAdminPassword function retrieves the local admin password for a specified computer in the CIPP project. It makes a REST API request to the CIPP API endpoint to fetch the password.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER guid
The GUID of the computer for which to retrieve the local admin password.

.EXAMPLE
Get-CIPPLocalAdminPassword -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -guid "abcdefg"
This example retrieves the local admin password for the computer with the specified GUID in the CIPP project.

.INPUTS
None.

.OUTPUTS
None.

.NOTES
Author: Your Name
Date:   Current Date

.LINK
https://cipp-project.com/documentation/get-cipplocaladminpassword

#>
Function Get-CIPPLocalAdminPassword {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$guid
    )

    Write-Verbose "Getting local admin password for computer: $guid"
    
    # Define the endpoint and parameters
    $endpoint = '/api/ExecGetLocalAdminPassword'
    $Body = @{
        tenantFilter = $CustomerTenantID
        GUID         = $guid 
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $Body -Method POST -Body $Body
}