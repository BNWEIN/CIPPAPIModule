<#
.SYNOPSIS
Starts the Managed Folder Assistant for a mailbox.

.DESCRIPTION
The Start-CIPPManagedFolderAssistant function starts a Managed Folder Assistant process for a specified mailbox
in Exchange Online. This can be used to process retention policies and tags. The function supports identifying
the mailbox either by its Exchange identity (like SMTP address) or by UserPrincipalName.

.PARAMETER Identity
The identity of the mailbox for which to start the Managed Folder Assistant. This can be the primary SMTP address
or any other Exchange identity format. This parameter is part of the Identity parameter set.

.PARAMETER UserPrincipalName
The UserPrincipalName of the mailbox user. This parameter is part of the UPN parameter set.

.PARAMETER CustomerTenantID
The tenant ID where the mailbox resides. This is required to identify the correct Exchange Online environment.

.EXAMPLE
Start-CIPPManagedFolderAssistant -Identity "user@contoso.com" -CustomerTenantID "tenant-id"
Starts the Managed Folder Assistant for the specified mailbox using its SMTP address.

.EXAMPLE
Start-CIPPManagedFolderAssistant -UserPrincipalName "user@contoso.com" -CustomerTenantID "tenant-id"
Starts the Managed Folder Assistant for the specified mailbox using the user's UPN.

.NOTES
Requires Exchange.Mailbox.ReadWrite permissions.
The Managed Folder Assistant processes retention policies and tags on mailboxes.
#>

function Start-CIPPManagedFolderAssistant {
    [CmdletBinding(DefaultParameterSetName = 'Identity')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true, ParameterSetName = 'Identity')]
        [string]$Identity,
        
        [Parameter(Mandatory = $true, ParameterSetName = 'UPN')]
        [string]$UserPrincipalName
    )

    $mailboxIdentifier = if ($PSCmdlet.ParameterSetName -eq 'UPN') { $UserPrincipalName } else { $Identity }
    Write-Verbose "Starting Managed Folder Assistant for mailbox: $mailboxIdentifier"

    $endpoint = '/api/ExecStartManagedFolderAssistant'
    $body = @{
        tenantFilter      = $CustomerTenantID
        id                = $Identity
        UserPrincipalName = $UserPrincipalName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST   
}