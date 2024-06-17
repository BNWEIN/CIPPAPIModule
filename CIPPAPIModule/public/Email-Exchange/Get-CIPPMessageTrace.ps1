<#
.SYNOPSIS
    Retrieves the message trace for a specific customer tenant ID.

.DESCRIPTION
    The Get-CIPPMessageTrace function retrieves the message trace for a specific customer tenant ID within a specified number of days. 
    It can also filter the results based on the sender and recipient email addresses.

.PARAMETER CustomerTenantID
    Specifies the customer tenant ID for which the message trace needs to be retrieved. This parameter is mandatory.

.PARAMETER Days
    Specifies the number of days within which the message trace needs to be retrieved. This parameter is mandatory.

.PARAMETER Sender
    Specifies the sender email address to filter the message trace results. This parameter is optional.

.PARAMETER Recipient
    Specifies the recipient email address to filter the message trace results. This parameter is optional.

.EXAMPLE
    Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 7
    Retrieves the message trace for the customer tenant ID "contoso.onmicrosoft.com" within the last 7 days.

.EXAMPLE
    Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 30 -Sender "john.doe@contoso.com"
    Retrieves the message trace for the customer tenant ID "contoso.onmicrosoft.com" within the last 30 days, 
    filtering the results to include only messages sent by "john.doe@contoso.com".

.EXAMPLE
    Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 14 -Recipient "jane.smith@contoso.com"
    Retrieves the message trace for the customer tenant ID "contoso.onmicrosoft.com" within the last 14 days, 
    filtering the results to include only messages received by "jane.smith@contoso.com".
#>
function Get-CIPPMessageTrace {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$Days,
            [Parameter(Mandatory = $false)]
            [string]$Sender,
            [Parameter(Mandatory = $false)]
            [string]$Recipient
        )
    
    Write-Verbose "Getting message trace for $CustomerTenantID"
    $endpoint = "/api/listmessagetrace"
    $params = @{
        tenantfilter = $CustomerTenantID
        days = $Days
        sender = $Sender
        recipient = $Recipient
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}