<#
.SYNOPSIS
Adds an Exchange Connector for a specified tenant using a template.

.DESCRIPTION
The Add-CIPPExchConnector function adds an Exchange Connector for a specified tenant using either a template GUID or template name. 
If neither the TemplateGuid nor TemplateName is provided, an error is thrown. The function retrieves the template, converts it to JSON, 
and sends a POST request to the '/api/AddExConnector' endpoint with the necessary parameters.

.PARAMETER CustomerTenantDefaultDomain
The default domain of the customer tenant for which the Exchange Connector is being added. This parameter is mandatory.

.PARAMETER TemplateGuid
The GUID of the template to be used for adding the Exchange Connector. This parameter is optional.

.PARAMETER TemplateName
The name of the template to be used for adding the Exchange Connector. This parameter is optional.

.EXAMPLE
Add-CIPPExchConnector -CustomerTenantDefaultDomain "example.com" -TemplateGuid "12345678-1234-1234-1234-123456789012"

.EXAMPLE
Add-CIPPExchConnector -CustomerTenantDefaultDomain "example.com" -TemplateName "DefaultTemplate"

.NOTES
Either TemplateGuid or TemplateName must be specified. If both are provided, TemplateGuid takes precedence.
#>
function Add-CIPPExchConnector {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantDefaultDomain,
        [Parameter(Mandatory = $false)]
        [guid]$TemplateGuid,
        [Parameter(Mandatory = $false)]
        [string]$TemplateName
    )

    if ($TemplateGuid -eq $null -and $TemplateName -eq $null) {
        Write-Error "Either TemplateGuid or TemplateName must be specified."
        return
    }

    #Getting Template
    if ($TemplateGuid -eq $null) {
        $Template = Get-CIPPExchangeConnectorTemplates | Where-Object { $_.Name -eq $TemplateName } 
        if ($null -eq $Template) {
            Write-Error "Template with name $TemplateName not found."
            return
        }
    } else {
        $Template = Get-CIPPExchangeConnectorTemplates | Where-Object { $_.Guid -eq $TemplateGuid } 
        if ($null -eq $Template) {
            Write-Error "Template with GUID $TemplateGuid not found."
            return
        }
    }

    $TemplateJson = $Template | ConvertTo-Json -Depth 10


    Write-Verbose "Adding Exchange Connector for tenant $CustomerTenantDefaultDomain"
    $endpoint = '/api/AddExConnector'
    $body = @{
        PowerShellCommand               = $TemplateJson
        "Select_$CustomerTenantID"      = $CustomerTenantDefaultDomain
        TemplateList                    = $Template.guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
