<#
.SYNOPSIS
    Retrieves mailbox restores for a specified customer tenant.

.DESCRIPTION
    The Get-CIPPMailboxRestores function retrieves mailbox restores for a specified customer tenant in the CIPP project. It uses the Invoke-CIPPRestMethod function to make a REST API call to the "/api/listmailboxrestores" endpoint.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer tenant for which mailbox restores should be retrieved. This parameter is mandatory.

.PARAMETER Identity
    Specifies the identity of the mailbox for which restores should be retrieved. This parameter is optional.

.PARAMETER Includereport
    Indicates whether to include the restore report in the results. This parameter is optional.

.PARAMETER Statistics
    Indicates whether to include statistics about the restores in the results. This parameter is optional.

.EXAMPLE
    Get-CIPPMailboxRestores -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Identity "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Includereport -Statistics
    Retrieves mailbox restores for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and includes the restore report and statistics in the results.

#>
function Get-CIPPMailboxRestores {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$Identity,
        [Parameter(Mandatory = $false)]
        [switch]$Includereport,
        [Parameter(Mandatory = $false)]
        [switch]$Statistics
    )
    
    Write-Verbose "Getting mailbox restores for $CustomerTenantID"
    $endpoint = "/api/listmailboxrestores"
    $params = @{
        tenantfilter = $CustomerTenantID
        identity = $Identity
    }

    if ($Includereport) {
        $params.IncludeReport = "true"
    }

    if ($Statistics) {
        $params.Statistics = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
