<#
.SYNOPSIS
Sets the out of office settings for a user.

.DESCRIPTION
The Set-CIPPOOO function is used to set the out of office settings for a user in a customer's Exchange environment. It allows you to specify the customer tenant ID, user, auto reply state, external message, internal message, start time, and end time for the out of office settings.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER User
The user for whom the out of office settings should be set.

.PARAMETER autoreplystate
The auto reply state. Valid values are 'Scheduled', 'Disabled', or 'Enabled'.

.PARAMETER externalmessage
The external message to be sent as an auto reply.

.PARAMETER internalmessage
The internal message to be sent as an auto reply.

.PARAMETER endtime
The end time for the out of office settings. This parameter is mandatory when autoreplystate is 'Scheduled'.

.PARAMETER starttime
The start time for the out of office settings. This parameter is mandatory when autoreplystate is 'Scheduled'.

.EXAMPLE
Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Disabled"
Sets the out of office settings for the user "john.doe@contoso.onmicrosoft.com" in the customer's tenant with ID "contoso.onmicrosoft.com". The auto reply state is set to "Disable"

.EXAMPLE
Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Enabled"
Sets the out of office settings for the user "john.doe@contoso.onmicrosoft.com" in the customer's tenant with ID "contoso.onmicrosoft.com". The auto reply state is set to "Enabled"

.EXAMPLE
Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Enabled" -externalmessage "I'm currently out of office." -internalmessage "I'm currently out of office." -starttime 2024-06-21 14:00" -endtime "2024-06-21 14:30""
Sets the out of office settings for the user "john.doe@contoso.onmicrosoft.com" in the customer's tenant with ID "@contoso.onmicrosoft.com". The auto reply state is set to "Enabled" and the external and internal messages are set to "I'm currently out of office.". The out of office settings are scheduled to start on "2024-06-21 14:00" and end on "2024-06-21 14:30".

#>

function Set-CIPPOOO {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$User,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            'Scheduled',
            'Disabled',
            'Enabled'
        )]
        [string]$AutoreplyState,
        [Parameter(Mandatory = $false)]
        [string]$ExternalMessage,
        [Parameter(Mandatory = $false)]
        [string]$InternalMessage,
        [Parameter(Mandatory = $false)]
        [datetime]$EndTime,
        [Parameter(Mandatory = $false)]
        [datetime]$StartTime
    )

    Write-Verbose "Setting out of office for $User to $AutoreplyState"

    if ($AutoreplyState -eq 'Scheduled') {
        if (-not $PSBoundParameters.ContainsKey('starttime')) {
            throw "Start time is mandatory when autoreplystate is 'Scheduled'."
        }
        if (-not $PSBoundParameters.ContainsKey('endtime')) {
            throw "End time is mandatory when autoreplystate is 'Scheduled'."
        }
    }

    $endpoint = '/api/ExecSetOoO'
    $body = @{
        TenantFilter    = $CustomerTenantID
        User            = $User
        AutoReplyState  = $AutoreplyState
        ExternalMessage = $ExternalMessage
        InternalMessage = $InternalMessage
        endtime         = $EndTime
        starttime       = $StartTime
        input           = $Input
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
