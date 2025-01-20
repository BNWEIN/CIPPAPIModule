<#
.SYNOPSIS
Adds an Exchange Transport Rule for a specified tenant using a template.

.DESCRIPTION
The Add-CIPPExchTransportRule function adds an Exchange Transport Rule for a specified tenant using a template. 
The template can be specified either by its GUID or by its name. If neither is provided, an error is thrown.

.PARAMETER CustomerTenantDefaultDomain
The default domain of the customer tenant for which the transport rule is being added. This parameter is mandatory.

.PARAMETER TemplateGuid
The GUID of the template to be used for creating the transport rule. This parameter is optional but either TemplateGuid or TemplateName must be provided.

.PARAMETER TemplateName
The name of the template to be used for creating the transport rule. This parameter is optional but either TemplateGuid or TemplateName must be provided.

.EXAMPLE
Add-CIPPExchTransportRule -CustomerTenantDefaultDomain "example.com" -TemplateGuid "12345678-1234-1234-1234-123456789012"

.EXAMPLE
Add-CIPPExchTransportRule -CustomerTenantDefaultDomain "example.com" -TemplateName "DefaultTemplate"

.NOTES
If both TemplateGuid and TemplateName are provided, TemplateGuid will take precedence.
The function retrieves the template details and converts them to JSON before making a REST API call to add the transport rule.
#>
function Add-CIPPExchTransportRule {
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
        $Template = Get-CIPPExchangeTransportRuleTemplates | Where-Object { $_.Name -eq $TemplateName } 
        if ($null -eq $Template) {
            Write-Error "Template with name $TemplateName not found."
            return
        }
    } else {
        $Template = Get-CIPPExchangeTransportRuleTemplates | Where-Object { $_.Guid -eq $TemplateGuid } 
        if ($null -eq $Template) {
            Write-Error "Template with GUID $TemplateGuid not found."
            return
        }
    }

    $TemplateJson = $Template | ConvertTo-Json -Depth 10


    Write-Verbose "Adding Exchange Transport Rule for tenant $CustomerTenantDefaultDomain"
    $endpoint = '/api/AddTransportRule'
    $body = @{
        PowerShellCommand               = $TemplateJson
        "Select_$CustomerTenantID"      = $CustomerTenantDefaultDomain
        TemplateList                    = $Template.guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
