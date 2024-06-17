<#
.SYNOPSIS
    Retrieves the BPA (Best Practices Analyzer) report for a specific customer tenant.

.DESCRIPTION
    The Get-CIPPBPA function retrieves the BPA report for a customer tenant based on the provided CustomerTenantID. 
    Optionally, you can specify a ReportName to filter the report.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer tenant for which to retrieve the BPA report. This parameter is optional.

.PARAMETER ReportName
    Specifies the name of the report to filter the BPA report. This parameter is optional.

.EXAMPLE
    Get-CIPPBPA -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ReportName "CIPP Best Practices V1.0 - Tenant View"

    This example retrieves the BPA report for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and filters it by the report name "CIPP Best Practices V1.0 - Tenant View".

#>
function Get-CIPPBPA {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$ReportName
    )

    Write-Verbose "Getting BPA Report for customer: $CustomerTenantID"
    $Endpoint = "/api/listbpa"
    $Params = @{
        tenantfilter = $CustomerTenantID
        Report = $ReportName
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}