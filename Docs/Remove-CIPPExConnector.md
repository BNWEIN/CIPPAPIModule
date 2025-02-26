# Remove-CIPPExConnector
## SYNOPSIS
Removes an Exchange connector.
## DESCRIPTION
The Remove-CIPPExConnector function removes a specified Exchange connector from CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-ConnectorGuid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the connector to remove.

  ## **-ConnectorType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of connector. Valid values are 'Receive' and 'Send'.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPExConnector -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ConnectorGuid "98765432-4321-4321-4321-BA0987654321" -ConnectorType "Receive"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPExConnector -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ConnectorGuid "98765432-4321-4321-4321-BA0987654321" -ConnectorType "Send"
```

