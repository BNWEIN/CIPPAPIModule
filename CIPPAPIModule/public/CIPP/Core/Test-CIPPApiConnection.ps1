<#
.SYNOPSIS
Tests connectivity to the CIPP API.

.DESCRIPTION
The Test-CIPPApiConnection function sends a test request to the CIPP API and returns the response, 
which can be used to verify connectivity and examine request/response details.

.EXAMPLE
Test-CIPPApiConnection
Returns the API response with request details.

.NOTES
Requires CIPP.Core.Read permissions.
This is a diagnostic function that echoes back request details.
#>

function Test-CIPPApiConnection {
    [CmdletBinding()]
    param()

    Write-Verbose 'Testing API connectivity'

    $endpoint = '/api/ListApiTest'
    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}