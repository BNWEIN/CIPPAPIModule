<#
.SYNOPSIS
Gets the CIPP notification configuration.

.DESCRIPTION
The Get-CIPPNotificationConfig function retrieves the notification configuration settings from CIPP, including log inclusion settings and severity levels.

.EXAMPLE
Get-CIPPNotificationConfig
Returns the current notification configuration.

.NOTES
Requires CIPP.AppSettings.Read permissions.
The configuration includes which logs to include and severity levels for notifications.
#>

function Get-CIPPNotificationConfig {
    [CmdletBinding()]
    param ()

    Write-Verbose 'Getting notification configuration'

    $endpoint = '/api/ListNotificationConfig'

    $result = Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET

    # Convert the result to a more friendly PowerShell object
    if ($result) {
        [PSCustomObject]@{
            LogsToInclude     = $result.logsToInclude
            Severity          = $result.Severity
            Email             = $result.email
            Webhook           = $result.webhook
            sendtoIntegration = $result.sendtoIntegration
            Schedule          = $result.schedule
            Type              = $result.type
        }
    } else {
        Write-Warning 'No notification configuration found'
        $null
    }
}