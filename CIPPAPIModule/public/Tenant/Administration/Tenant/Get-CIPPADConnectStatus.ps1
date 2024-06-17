<#
.SYNOPSIS
Retrieves the AD Connect status, AD Connect settings, or AD objects in error for a specified customer tenant.

.DESCRIPTION
The Get-CIPPADConnectStatus function retrieves information about the AD Connect status, AD Connect settings, or AD objects in error for a specified customer tenant. It makes a REST API call to retrieve the data from the CIPP API.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which the AD Connect information is to be retrieved.

.PARAMETER dataToReturn
Specifies the type of data to be returned. Valid values are "AzureADConnectSettings" to retrieve AD Connect settings, "AzureADObjectsInError" to retrieve AD objects in error, or leave empty to retrieve the AD Connect status.

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -dataToReturn "AzureADConnectSettings"
Retrieves the AD Connect settings for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -dataToReturn "AzureADConnectSettings"
Retrieves the AD Connect settings for the customer tenant "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -dataToReturn "AzureADObjectsInError"
Retrieves the AD objects in error for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -dataToReturn "AzureADObjectsInError"
Retrieves the AD objects in error for the customer tenant "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the AD Connect status for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the AD Connect status for the customer tenant "7ced1621-b8f7-4231-868c-bc6b1a2f1778".
#>

function Get-CIPPADConnectStatus {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet("AzureADConnectSettings", "AzureADObjectsInError")]
        [string]$dataToReturn
    )

    if ($dataToReturn -eq "AzureADConnectSettings") {
        Write-Verbose "Getting AD Connect Settings for: $CustomerTenantID"
    } elseif ($dataToReturn -eq "AzureADObjectsInError") {
        Write-Verbose "Getting AD Objects in Error for: $CustomerTenantID"
    } else {
        Write-Verbose "Getting AD Connect Status for: $CustomerTenantID"
    }
        $Endpoint = "/api/listazureadconnectstatus"
        $Params = @{
            tenantfilter = $CustomerTenantID
            datatoreturn = $dataToReturn
        }
        Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}