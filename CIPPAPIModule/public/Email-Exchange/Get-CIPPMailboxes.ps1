<#
.SYNOPSIS
Retrieves a list of mailboxes for a specific customer tenant.

.DESCRIPTION
The Get-CIPPMailboxes function retrieves a list of mailboxes for a specific customer tenant by making a REST API call to the "/api/ListMailboxes" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the mailbox list.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the mailbox list for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPMailboxes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Mailbox List for $CustomerTenantID"
    $endpoint = "/api/ListMailboxes"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
