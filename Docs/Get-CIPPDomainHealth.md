# Get-CIPPDomainHealth
## SYNOPSIS
Gets the domain health information for a specified domain.
## DESCRIPTION
The Get-CIPPDomainHealth function retrieves domain health information for a specified domain using the CIPP API. It supports various actions such as reading WHOIS records, NS records, MX records, SPF records, DMARC policies, DKIM records, testing DNSSEC, and testing MTA-STS.
# PARAMETERS

## **-DomainName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the name of the domain for which to retrieve the health information.

  ## **-Action**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the action to perform for retrieving the domain health information. Valid values are: - ReadWhoisRecord: Retrieves the WHOIS record for the domain. - ReadNSRecord: Retrieves the NS record for the domain. - ReadMXRecord: Retrieves the MX record for the domain. - ReadSpfRecord: Retrieves the SPF record for the domain. - ReadDmarcPolicy: Retrieves the DMARC policy for the domain. - ReadDkimRecord: Retrieves the DKIM record for the domain. - TestDNSSEC: Tests DNSSEC for the domain. - TestMtaSts: Tests MTA-STS for the domain.

 #### EXAMPLE 1
```powershell
PS>Get-CIPPDomainHealth -DomainName "contoso.onmicrosoft.com" -Action "ReadWhoisRecord"
```
 #### EXAMPLE 2
```powershell
PS>Get-CIPPDomainHealth -DomainName "contoso.onmicrosoft.com" -Action "TestDNSSEC"
```

