<#
.SYNOPSIS
Starts the Managed Folder Assistant for a mailbox.

.DESCRIPTION
The Start-CIPPManagedFolderAssistant function starts a Managed Folder Assistant process for a specified mailbox 
in Exchange Online. This can be used to process retention policies and tags.

.PARAMETER Identity
The identity of the mailbox for which to start the Managed Folder Assistant. This can be the primary SMTP address 
or any other Exchange identity format.

.PARAMETER CustomerTenantID
The tenant ID where the mailbox resides. This is required to identify the correct Exchange Online environment.

.EXAMPLE
Start-CIPPManagedFolderAssistant -Identity "user@contoso.com" -CustomerTenantID "tenant-id"
Starts the Managed Folder Assistant for the specified mailbox in the specified tenant.

.NOTES
Requires Exchange.Mailbox.ReadWrite permissions.
The Managed Folder Assistant processes retention policies and tags on mailboxes.
#>

function Start-CIPPManagedFolderAssistant {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Identity,

        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Starting Managed Folder Assistant for mailbox: $Identity"

    $endpoint = '/api/ExecStartManagedFolderAssistant'
    $body = @{
        tenantFilter = $CustomerTenantID
        id           = $Identity
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST   
}