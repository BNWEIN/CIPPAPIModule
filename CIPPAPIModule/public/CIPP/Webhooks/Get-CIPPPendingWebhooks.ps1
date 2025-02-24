<#
.SYNOPSIS
Gets pending webhooks.

.DESCRIPTION
The Get-CIPPPendingWebhook function retrieves a list of pending webhooks from CIPP.
Each webhook's content is automatically deserialized from JSON where applicable.

.EXAMPLE
Get-CIPPPendingWebhook
Returns all pending webhooks in the system.

.NOTES
Requires CIPP.Alert.Read permissions.
The function automatically deserializes any JSON content in the webhook data.
#>

function Get-CIPPPendingWebhooks {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting pending webhooks'

    $endpoint = '/api/ListPendingWebhooks'

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}