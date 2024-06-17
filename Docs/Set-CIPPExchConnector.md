# Set-CIPPExchConnector
## SYNOPSIS
Sets the state and type of an Exchange Connector for a specific customer tenant.
## DESCRIPTION
The Set-CIPPExchConnector function is used to edit the state and type of an Exchange Connector for a specific customer tenant. It sends a REST API request to update the connector settings.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the Exchange Connector needs to be edited.

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The state of the Exchange Connector. Valid values are "Enable" and "Disabled".

  ## **-Guid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The GUID of the Exchange Connector.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The type of the Exchange Connector.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPExchConnector -CustomerTenantID "contoso.onmicrosoft.com" -State "Enable" -Guid "abcdefg" -Type "Inbound"

This example sets the state of the Exchange Connector for the customer tenant with ID "contoso.onmicrosoft.com" to "Enable", using the GUID "abcdefg" and the type "Inbound".
```

