<#
.SYNOPSIS
Retrieves a list of mailboxes for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMailboxes function retrieves a list of mailboxes for a specified customer tenant ID. It can also include soft-deleted mailboxes if the -SoftDeletedMailboxes switch is used.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the mailbox list.

.PARAMETER SoftDeletedMailboxes
Indicates whether to include soft-deleted mailboxes in the result. By default, this parameter is set to $false.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the list of mailboxes for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
Get-CIPPMailboxes -CustomerTenantID "contoso.onmicrosoft.com" -SoftDeletedMailboxes
Retrieves the list of soft-deleted mailboxes for the "contoso.onmicrosoft.com" tenant.
#>

function Get-CIPPMailboxes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$SoftDeletedMailboxes
    )

    Write-Verbose "Getting Mailbox List for $CustomerTenantID"
    $endpoint = '/api/ListMailboxes'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    if ($SoftDeletedMailboxes) {
        $params.Add('SoftDeletedMailbox', 'true')
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
