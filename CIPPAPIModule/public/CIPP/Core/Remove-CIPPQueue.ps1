<#
.SYNOPSIS
Removes an item from the CIPP queue.

.DESCRIPTION
The Remove-CIPPQueue function removes a specified item from the CIPP queue system.

.PARAMETER QueueId
Specifies the ID of the queue item to remove.

.EXAMPLE
Remove-CIPPQueue -QueueId "12345678-1234-1234-1234-1234567890AB"
Removes the specified item from the CIPP queue.

.NOTES
Requires appropriate permissions to manage queue items.
#>

function Remove-CIPPQueue {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$QueueId
    )

    Write-Verbose "Removing queue item $QueueId"

    $endpoint = '/api/RemoveCippQueue'
    $body = @{}

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}