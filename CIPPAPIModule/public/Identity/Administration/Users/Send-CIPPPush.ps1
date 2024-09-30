<#
.SYNOPSIS
Sends a push notification to a user.

.DESCRIPTION
The Send-CIPPPush function sends a push notification to a user specified by their email address.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER UserEmail
The email address of the user to send the push notification to.

.EXAMPLE
Send-CIPPPush -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserEmail "user@example.com"
Sends a push notification to the user with the email address "user@example.com" in the tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Send-CIPPPush {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserEmail
    )
    
    Write-Verbose "Sending Push Notification to $UserEmail"

    $endpoint = '/api/execsendpush'
    $params = @{
        tenantfilter = $CustomerTenantID
        Useremail    = $UserEmail
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
