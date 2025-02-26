<#
.SYNOPSIS
Retrieves generic test function information for a specific customer.

.DESCRIPTION
The Test-CIPPGenericFunction function retrieves generic test function information for a specific customer identified by their tenant ID.

.EXAMPLE
Get-TestCIPPGenericFunction
Retrieves the generic test function information for the customer.

.NOTES
Requires appropriate permissions to access generic test function information.
#>

function Test-CIPPGenericFunction {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Testing Generic Test Function'
    $endpoint = '/api/ListGenericTestFunction'
    $params = @{}
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}