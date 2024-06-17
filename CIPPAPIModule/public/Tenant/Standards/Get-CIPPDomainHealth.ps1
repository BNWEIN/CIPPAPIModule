<#
.SYNOPSIS
Gets the domain health information for a specified domain.

.DESCRIPTION
The Get-CIPPDomainHealth function retrieves domain health information for a specified domain using the CIPP API. It supports various actions such as reading WHOIS records, NS records, MX records, SPF records, DMARC policies, DKIM records, testing DNSSEC, and testing MTA-STS.

.PARAMETER DomainName
Specifies the name of the domain for which to retrieve the health information.

.PARAMETER Action
Specifies the action to perform for retrieving the domain health information. Valid values are:
- ReadWhoisRecord: Retrieves the WHOIS record for the domain.
- ReadNSRecord: Retrieves the NS record for the domain.
- ReadMXRecord: Retrieves the MX record for the domain.
- ReadSpfRecord: Retrieves the SPF record for the domain.
- ReadDmarcPolicy: Retrieves the DMARC policy for the domain.
- ReadDkimRecord: Retrieves the DKIM record for the domain.
- TestDNSSEC: Tests DNSSEC for the domain.
- TestMtaSts: Tests MTA-STS for the domain.

.EXAMPLE
PS> Get-CIPPDomainHealth -DomainName "contoso.onmicrosoft.com" -Action "ReadWhoisRecord"
Retrieves the WHOIS record for the domain "contoso.onmicrosoft.com".

.EXAMPLE
PS> Get-CIPPDomainHealth -DomainName "contoso.onmicrosoft.com" -Action "TestDNSSEC"
Tests DNSSEC for the domain "contoso.onmicrosoft.com".

#>

function Get-CIPPDomainHealth {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$DomainName,
        [Parameter(Mandatory = $true)]
        [ValidateSet("ReadWhoisRecord", "ReadNSRecord", "ReadMXRecord", "ReadSpfRecord", "ReadDmarcPolicy", "ReadDkimRecord", "TestDNSSEC", "TestMtaSts")]
        [string]$Action
    )

    Write-Verbose "Getting Domain Health for $DomainName with action $Action"

    $endpoint = "/api/listdomainhealth"
    $params = @{
        Domain = $DomainName
        Action = $action
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}