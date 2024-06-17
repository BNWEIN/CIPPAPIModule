# Get-CIPPExternalGEOIPLookup
## SYNOPSIS
Performs a Geo IP lookup for a given IP address.
## DESCRIPTION
The Get-CIPPExternalGEOIPLookup function performs a Geo IP lookup for a given IP address using a REST API. It retrieves information about the geographical location of the IP address.
# PARAMETERS

## **-IP**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the IP address for which the Geo IP lookup needs to be performed. The IP address can be in IPv4 or IPv6 format.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPExternalGEOIPLookup -IP "8.8.8.8"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPExternalGEOIPLookup -IP "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
```

