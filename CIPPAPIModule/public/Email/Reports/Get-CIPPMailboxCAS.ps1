<#
.SYNOPSIS
Retrieves the Mailbox Client Access Settings for a specific customer tenant.

.DESCRIPTION
The Get-CIPPMailboxCAS function retrieves the Mailbox Client Access Settings for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the '/api/listmailboxcas' endpoint and returns the results.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve the Mailbox Client Access Settings. This parameter is mandatory.

.EXAMPLE
Get-CIPPMailboxCAS -CustomerTenantID "d25d58b0-7f7e-4b81-af6c-b5e6451dafcc"
Retrieves the Mailbox Client Access Settings for the customer tenant with the ID "d25d58b0-7f7e-4b81-af6c-b5e6451dafcc".

.INPUTS
None. You cannot pipe input to this function.

.OUTPUTS
System.Object. The function returns an object representing the Mailbox Client Access Settings.

.NOTES
This function requires the Invoke-CIPPRestMethod function to be available.

.LINK
Invoke-CIPPRestMethod
#>

function Get-CIPPMailboxCAS {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Mailbox Client Access Settings for $CustomerTenantID"
    $endpoint = '/api/ListMailboxCAS'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
