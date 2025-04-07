## What is this?

This is the code for a [PowerShell](https://microsoft.com/powershell) module for [CIPP](https://cipp.app/). It is a work in progress, and only has about 207 out of the almost 350 API Endpoints built in. However, more will follow and it does have a generic 'Invoke-CIPPRestMethod' available so you can make any API call you want. See advanced usage examples below.

The module is written for [PowerShell 7](https://docs.microsoft.com/en-us/powershell/scripting/whats-new/what-s-new-in-powershell-71?view=powershell-7.1).

## What does it do?

CIPPAPIModule provides a PowerShell wrapper around the CIPP API. The module handles all the authentication for you. All you need to do is supply your CIPP API Details using the 'Set-CIPPAPIDetails' command.

## Installing

This module is published to the PowerShell Gallery and can be installed from within PowerShell with `Install-Module`

```powershell
Install-Module -Name CIPPAPIModule
```

## Updating

This module is updated regularly. Remember to always check for the latest version from within PowerShell with `Update-Module`

```powershell
Update-Module -Name CIPPAPIModule
```

## Getting Started

The first and probably most important requirement for this module is getting it connected to your CIPP API.

### Connecting the PowerShell module to the API

1. Set API Connection details

```powershell
Set-CIPPAPIDetails -CIPPClientID "YourClientIDGoesHere" -CIPPClientSecret "YourClientSecretGoesHere" -CIPPAPIUrl "https://your.cipp.apiurl" -TenantID "YourTenantID"
```

2. Test your first call to the API

```powershell
Test-CIPPApiConnection
```

# Cmdlet Help
## CIPP
- Core
  - [Get-CIPPAccessCheck](./Docs/Get-CIPPAccessCheck.md)
  - [Get-CIPPApplicationQueue](./Docs/Get-CIPPApplicationQueue.md)
  - [Get-CIPPAuditLogSearches](./Docs/Get-CIPPAuditLogSearches.md)
  - [Get-CIPPBackup](./Docs/Get-CIPPBackup.md)
  - [Get-CIPPCommunityRepos](./Docs/Get-CIPPCommunityRepos.md)
  - [Get-CIPPConditionalAccessPolicyChanges](./Docs/Get-CIPPConditionalAccessPolicyChanges.md)
  - [Get-CIPPConnectionFilterTemplates](./Docs/Get-CIPPConnectionFilterTemplates.md)
  - [Get-CIPPCustomRole](./Docs/Get-CIPPCustomRole.md)
  - [Get-CIPPEmptyResult](./Docs/Get-CIPPEmptyResult.md)
  - [Get-CIPPExecAPIPermissionsList](./Docs/Get-CIPPExecAPIPermissionsList.md)
  - [Get-CIPPExoRequest](./Docs/Get-CIPPExoRequest.md)
  - [Get-CIPPExtensionSync](./Docs/Get-CIPPExtensionSync.md)
  - [Get-CIPPFunctionParameters](./Docs/Get-CIPPFunctionParameters.md)
  - [Get-CIPPFunctionStats](./Docs/Get-CIPPFunctionStats.md)
  - [Get-CIPPGDAPAccessAssignments](./Docs/Get-CIPPGDAPAccessAssignments.md)
  - [Get-CIPPGenericTestFunction](./Docs/Get-CIPPGenericTestFunction.md)
  - [Get-CIPPKnownIPDB](./Docs/Get-CIPPKnownIPDB.md)
  - [Get-CIPPLogs](./Docs/Get-CIPPLogs.md)
  - [Get-CIPPQueue](./Docs/Get-CIPPQueue.md)
  - [Remove-CIPPQueue](./Docs/Remove-CIPPQueue.md)
  - [Set-CIPPExecCPVPerms](./Docs/Set-CIPPExecCPVPerms.md)
  - [Test-CIPPApiConnection](./Docs/Test-CIPPApiConnection.md)
- Scheduler
  - [Get-CIPPScheduledTask](./Docs/Get-CIPPScheduledTask.md)
- Security
  - [Get-CIPPTrustedIP](./Docs/Get-CIPPTrustedIP.md)
- Settings
  - [Get-CIPPExcludedLicenses](./Docs/Get-CIPPExcludedLicenses.md)
  - [Get-CIPPExcludedTenants](./Docs/Get-CIPPExcludedTenants.md)
  - [Get-CIPPNotificationConfig](./Docs/Get-CIPPNotificationConfig.md)
  - [Get-CIPPVersion](./Docs/Get-CIPPVersion.md)
  - [Set-CIPPExcludeLicense](./Docs/Set-CIPPExcludeLicense.md)
  - [Set-CIPPExcludeTenant](./Docs/Set-CIPPExcludeTenant.md)
  - [Set-CIPPPasswordSettings](./Docs/Set-CIPPPasswordSettings.md)
- Setup
- Webhooks
  - [Get-CIPPPendingWebhooks](./Docs/Get-CIPPPendingWebhooks.md)
- [Get-CIPPAccessCheck](./Docs/Get-CIPPAccessCheck.md)
- [Get-CIPPApplicationQueue](./Docs/Get-CIPPApplicationQueue.md)
- [Get-CIPPAuditLogSearches](./Docs/Get-CIPPAuditLogSearches.md)
- [Get-CIPPBackup](./Docs/Get-CIPPBackup.md)
- [Get-CIPPCommunityRepos](./Docs/Get-CIPPCommunityRepos.md)
- [Get-CIPPConditionalAccessPolicyChanges](./Docs/Get-CIPPConditionalAccessPolicyChanges.md)
- [Get-CIPPConnectionFilterTemplates](./Docs/Get-CIPPConnectionFilterTemplates.md)
- [Get-CIPPCustomRole](./Docs/Get-CIPPCustomRole.md)
- [Get-CIPPEmptyResult](./Docs/Get-CIPPEmptyResult.md)
- [Get-CIPPExecAPIPermissionsList](./Docs/Get-CIPPExecAPIPermissionsList.md)
- [Get-CIPPExoRequest](./Docs/Get-CIPPExoRequest.md)
- [Get-CIPPExtensionSync](./Docs/Get-CIPPExtensionSync.md)
- [Get-CIPPFunctionParameters](./Docs/Get-CIPPFunctionParameters.md)
- [Get-CIPPFunctionStats](./Docs/Get-CIPPFunctionStats.md)
- [Get-CIPPGDAPAccessAssignments](./Docs/Get-CIPPGDAPAccessAssignments.md)
- [Get-CIPPGenericTestFunction](./Docs/Get-CIPPGenericTestFunction.md)
- [Get-CIPPKnownIPDB](./Docs/Get-CIPPKnownIPDB.md)
- [Get-CIPPLogs](./Docs/Get-CIPPLogs.md)
- [Get-CIPPQueue](./Docs/Get-CIPPQueue.md)
- [Remove-CIPPQueue](./Docs/Remove-CIPPQueue.md)
- [Set-CIPPExecCPVPerms](./Docs/Set-CIPPExecCPVPerms.md)
- [Test-CIPPApiConnection](./Docs/Test-CIPPApiConnection.md)
- [Get-CIPPScheduledTask](./Docs/Get-CIPPScheduledTask.md)
- [Get-CIPPTrustedIP](./Docs/Get-CIPPTrustedIP.md)
- [Get-CIPPExcludedLicenses](./Docs/Get-CIPPExcludedLicenses.md)
- [Get-CIPPExcludedTenants](./Docs/Get-CIPPExcludedTenants.md)
- [Get-CIPPNotificationConfig](./Docs/Get-CIPPNotificationConfig.md)
- [Get-CIPPVersion](./Docs/Get-CIPPVersion.md)
- [Set-CIPPExcludeLicense](./Docs/Set-CIPPExcludeLicense.md)
- [Set-CIPPExcludeTenant](./Docs/Set-CIPPExcludeTenant.md)
- [Set-CIPPPasswordSettings](./Docs/Set-CIPPPasswordSettings.md)
- [Get-CIPPPendingWebhooks](./Docs/Get-CIPPPendingWebhooks.md)
## Email
- Administration
  - [Add-CIPPContact](./Docs/Add-CIPPContact.md)
  - [Add-CIPPExchConnector](./Docs/Add-CIPPExchConnector.md)
  - [Add-CIPPExchTransportRule](./Docs/Add-CIPPExchTransportRule.md)
  - [Add-CIPPRoomMailbox](./Docs/Add-CIPPRoomMailbox.md)
  - [Add-CIPPSharedMailbox](./Docs/Add-CIPPSharedMailbox.md)
  - [Convert-CIPPMailbox](./Docs/Convert-CIPPMailbox.md)
  - [Get-CIPPCalendarPerms](./Docs/Get-CIPPCalendarPerms.md)
  - [Get-CIPPContacts](./Docs/Get-CIPPContacts.md)
  - [Get-CIPPExchangeTransportRuleTemplates](./Docs/Get-CIPPExchangeTransportRuleTemplates.md)
  - [Get-CIPPMailboxes](./Docs/Get-CIPPMailboxes.md)
  - [Get-CIPPMailboxMobileDevices](./Docs/Get-CIPPMailboxMobileDevices.md)
  - [Get-CIPPMailboxPermissions](./Docs/Get-CIPPMailboxPermissions.md)
  - [Get-CIPPMailboxRules](./Docs/Get-CIPPMailboxRules.md)
  - [Get-CIPPMailQuarantine](./Docs/Get-CIPPMailQuarantine.md)
  - [Get-CIPPOutOfOffice](./Docs/Get-CIPPOutOfOffice.md)
  - [Get-CIPPUserMailboxDetails](./Docs/Get-CIPPUserMailboxDetails.md)
  - [Get-CIPPUserMailboxRules](./Docs/Get-CIPPUserMailboxRules.md)
  - [Remove-CIPPContact](./Docs/Remove-CIPPContact.md)
  - [Set-CIPPCalendarPermissions](./Docs/Set-CIPPCalendarPermissions.md)
  - [Set-CIPPContact](./Docs/Set-CIPPContact.md)
  - [Set-CIPPCopyToSent](./Docs/Set-CIPPCopyToSent.md)
  - [Set-CIPPEnableArchive](./Docs/Set-CIPPEnableArchive.md)
  - [Set-CIPPHideFromGAL](./Docs/Set-CIPPHideFromGAL.md)
  - [Set-CIPPMailboxForwarding](./Docs/Set-CIPPMailboxForwarding.md)
  - [Set-CIPPMailboxMobileDevices](./Docs/Set-CIPPMailboxMobileDevices.md)
  - [Set-CIPPMailboxPermissions](./Docs/Set-CIPPMailboxPermissions.md)
  - [Set-CIPPMailboxQuota](./Docs/Set-CIPPMailboxQuota.md)
  - [Set-CIPPOOO](./Docs/Set-CIPPOOO.md)
  - [Set-CIPPQuarantineManagement](./Docs/Set-CIPPQuarantineManagement.md)
  - [Start-CIPPManagedFolderAssistant](./Docs/Start-CIPPManagedFolderAssistant.md)
- Reports
  - [Get-CIPPEnabledSharedMailboxes](./Docs/Get-CIPPEnabledSharedMailboxes.md)
  - [Get-CIPPGlobalAddressList](./Docs/Get-CIPPGlobalAddressList.md)
  - [Get-CIPPMailboxCAS](./Docs/Get-CIPPMailboxCAS.md)
  - [Get-CIPPMailboxStatistics](./Docs/Get-CIPPMailboxStatistics.md)
- Resources
  - [Get-CIPPRoomLists](./Docs/Get-CIPPRoomLists.md)
  - [Get-CIPPRooms](./Docs/Get-CIPPRooms.md)
- Spamfilter
  - [Get-CIPPAntiPhishingFilter](./Docs/Get-CIPPAntiPhishingFilter.md)
  - [Get-CIPPMalwareFilter](./Docs/Get-CIPPMalwareFilter.md)
  - [Get-CIPPPhishPolicies](./Docs/Get-CIPPPhishPolicies.md)
  - [Get-CIPPSafeAttachmentFilter](./Docs/Get-CIPPSafeAttachmentFilter.md)
  - [Get-CIPPSafeLinkFilter](./Docs/Get-CIPPSafeLinkFilter.md)
  - [Get-CIPPSpamFilter](./Docs/Get-CIPPSpamFilter.md)
  - [Get-CIPPSpamFilterTemplates](./Docs/Get-CIPPSpamFilterTemplates.md)
  - [Get-CIPPTenantAllowBlockList](./Docs/Get-CIPPTenantAllowBlockList.md)
  - [Set-CIPPSpamFilter](./Docs/Set-CIPPSpamFilter.md)
- Tools
  - [Get-CIPPMailboxRestores](./Docs/Get-CIPPMailboxRestores.md)
  - [Get-CIPPMessageTrace](./Docs/Get-CIPPMessageTrace.md)
- Transport
  - [Get-CIPPExchangeConnectors](./Docs/Get-CIPPExchangeConnectors.md)
  - [Get-CIPPExchangeConnectorTemplates](./Docs/Get-CIPPExchangeConnectorTemplates.md)
  - [Get-CIPPTransportRule](./Docs/Get-CIPPTransportRule.md)
  - [Get-CIPPTransportRulesTemplates](./Docs/Get-CIPPTransportRulesTemplates.md)
  - [Remove-CIPPConnectionFilterTemplate](./Docs/Remove-CIPPConnectionFilterTemplate.md)
  - [Remove-CIPPExConnector](./Docs/Remove-CIPPExConnector.md)
  - [Remove-CIPPExConnectorTemplate](./Docs/Remove-CIPPExConnectorTemplate.md)
  - [Remove-CIPPSpamFilter](./Docs/Remove-CIPPSpamFilter.md)
  - [Remove-CIPPSpamFilterTemplate](./Docs/Remove-CIPPSpamFilterTemplate.md)
  - [Remove-CIPPTransportRule](./Docs/Remove-CIPPTransportRule.md)
  - [Remove-CIPPTransportRuleTemplate](./Docs/Remove-CIPPTransportRuleTemplate.md)
  - [Set-CIPPExchConnector](./Docs/Set-CIPPExchConnector.md)
  - [Set-CIPPTransportRule](./Docs/Set-CIPPTransportRule.md)
- [Add-CIPPContact](./Docs/Add-CIPPContact.md)
- [Add-CIPPExchConnector](./Docs/Add-CIPPExchConnector.md)
- [Add-CIPPExchTransportRule](./Docs/Add-CIPPExchTransportRule.md)
- [Add-CIPPRoomMailbox](./Docs/Add-CIPPRoomMailbox.md)
- [Add-CIPPSharedMailbox](./Docs/Add-CIPPSharedMailbox.md)
- [Convert-CIPPMailbox](./Docs/Convert-CIPPMailbox.md)
- [Get-CIPPCalendarPerms](./Docs/Get-CIPPCalendarPerms.md)
- [Get-CIPPContacts](./Docs/Get-CIPPContacts.md)
- [Get-CIPPExchangeTransportRuleTemplates](./Docs/Get-CIPPExchangeTransportRuleTemplates.md)
- [Get-CIPPMailboxes](./Docs/Get-CIPPMailboxes.md)
- [Get-CIPPMailboxMobileDevices](./Docs/Get-CIPPMailboxMobileDevices.md)
- [Get-CIPPMailboxPermissions](./Docs/Get-CIPPMailboxPermissions.md)
- [Get-CIPPMailboxRules](./Docs/Get-CIPPMailboxRules.md)
- [Get-CIPPMailQuarantine](./Docs/Get-CIPPMailQuarantine.md)
- [Get-CIPPOutOfOffice](./Docs/Get-CIPPOutOfOffice.md)
- [Get-CIPPUserMailboxDetails](./Docs/Get-CIPPUserMailboxDetails.md)
- [Get-CIPPUserMailboxRules](./Docs/Get-CIPPUserMailboxRules.md)
- [Remove-CIPPContact](./Docs/Remove-CIPPContact.md)
- [Set-CIPPCalendarPermissions](./Docs/Set-CIPPCalendarPermissions.md)
- [Set-CIPPContact](./Docs/Set-CIPPContact.md)
- [Set-CIPPCopyToSent](./Docs/Set-CIPPCopyToSent.md)
- [Set-CIPPEnableArchive](./Docs/Set-CIPPEnableArchive.md)
- [Set-CIPPHideFromGAL](./Docs/Set-CIPPHideFromGAL.md)
- [Set-CIPPMailboxForwarding](./Docs/Set-CIPPMailboxForwarding.md)
- [Set-CIPPMailboxMobileDevices](./Docs/Set-CIPPMailboxMobileDevices.md)
- [Set-CIPPMailboxPermissions](./Docs/Set-CIPPMailboxPermissions.md)
- [Set-CIPPMailboxQuota](./Docs/Set-CIPPMailboxQuota.md)
- [Set-CIPPOOO](./Docs/Set-CIPPOOO.md)
- [Set-CIPPQuarantineManagement](./Docs/Set-CIPPQuarantineManagement.md)
- [Start-CIPPManagedFolderAssistant](./Docs/Start-CIPPManagedFolderAssistant.md)
- [Get-CIPPEnabledSharedMailboxes](./Docs/Get-CIPPEnabledSharedMailboxes.md)
- [Get-CIPPGlobalAddressList](./Docs/Get-CIPPGlobalAddressList.md)
- [Get-CIPPMailboxCAS](./Docs/Get-CIPPMailboxCAS.md)
- [Get-CIPPMailboxStatistics](./Docs/Get-CIPPMailboxStatistics.md)
- [Get-CIPPRoomLists](./Docs/Get-CIPPRoomLists.md)
- [Get-CIPPRooms](./Docs/Get-CIPPRooms.md)
- [Get-CIPPAntiPhishingFilter](./Docs/Get-CIPPAntiPhishingFilter.md)
- [Get-CIPPMalwareFilter](./Docs/Get-CIPPMalwareFilter.md)
- [Get-CIPPPhishPolicies](./Docs/Get-CIPPPhishPolicies.md)
- [Get-CIPPSafeAttachmentFilter](./Docs/Get-CIPPSafeAttachmentFilter.md)
- [Get-CIPPSafeLinkFilter](./Docs/Get-CIPPSafeLinkFilter.md)
- [Get-CIPPSpamFilter](./Docs/Get-CIPPSpamFilter.md)
- [Get-CIPPSpamFilterTemplates](./Docs/Get-CIPPSpamFilterTemplates.md)
- [Get-CIPPTenantAllowBlockList](./Docs/Get-CIPPTenantAllowBlockList.md)
- [Set-CIPPSpamFilter](./Docs/Set-CIPPSpamFilter.md)
- [Get-CIPPMailboxRestores](./Docs/Get-CIPPMailboxRestores.md)
- [Get-CIPPMessageTrace](./Docs/Get-CIPPMessageTrace.md)
- [Get-CIPPExchangeConnectors](./Docs/Get-CIPPExchangeConnectors.md)
- [Get-CIPPExchangeConnectorTemplates](./Docs/Get-CIPPExchangeConnectorTemplates.md)
- [Get-CIPPTransportRule](./Docs/Get-CIPPTransportRule.md)
- [Get-CIPPTransportRulesTemplates](./Docs/Get-CIPPTransportRulesTemplates.md)
- [Remove-CIPPConnectionFilterTemplate](./Docs/Remove-CIPPConnectionFilterTemplate.md)
- [Remove-CIPPExConnector](./Docs/Remove-CIPPExConnector.md)
- [Remove-CIPPExConnectorTemplate](./Docs/Remove-CIPPExConnectorTemplate.md)
- [Remove-CIPPSpamFilter](./Docs/Remove-CIPPSpamFilter.md)
- [Remove-CIPPSpamFilterTemplate](./Docs/Remove-CIPPSpamFilterTemplate.md)
- [Remove-CIPPTransportRule](./Docs/Remove-CIPPTransportRule.md)
- [Remove-CIPPTransportRuleTemplate](./Docs/Remove-CIPPTransportRuleTemplate.md)
- [Set-CIPPExchConnector](./Docs/Set-CIPPExchConnector.md)
- [Set-CIPPTransportRule](./Docs/Set-CIPPTransportRule.md)
## Endpoint
- Applications
  - [Get-CIPPApps](./Docs/Get-CIPPApps.md)
  - [Get-CIPPAppStatus](./Docs/Get-CIPPAppStatus.md)
  - [Remove-CIPPIntuneApp](./Docs/Remove-CIPPIntuneApp.md)
  - [Remove-CIPPQueuedApp](./Docs/Remove-CIPPQueuedApp.md)
- Autopilot
  - [Get-CIPPAPDevices](./Docs/Get-CIPPAPDevices.md)
  - [Get-CIPPAutoPilotConfig](./Docs/Get-CIPPAutoPilotConfig.md)
  - [New-CIPPAutopilotConfig](./Docs/New-CIPPAutopilotConfig.md)
  - [Remove-CIPPAPDevice](./Docs/Remove-CIPPAPDevice.md)
  - [Set-CIPPAutoPilotSync](./Docs/Set-CIPPAutoPilotSync.md)
- MEM
  - [Get-CIPPDeviceDetails](./Docs/Get-CIPPDeviceDetails.md)
  - [Get-CIPPGetBitLockerKey](./Docs/Get-CIPPGetBitLockerKey.md)
  - [Get-CIPPIntuneIntents](./Docs/Get-CIPPIntuneIntents.md)
  - [Get-CIPPIntunePolicy](./Docs/Get-CIPPIntunePolicy.md)
  - [Get-CIPPIntuneTemplates](./Docs/Get-CIPPIntuneTemplates.md)
  - [Get-CIPPLocalAdminPassword](./Docs/Get-CIPPLocalAdminPassword.md)
  - [Remove-CIPPIntuneScript](./Docs/Remove-CIPPIntuneScript.md)
  - [Remove-CIPPIntuneTemplate](./Docs/Remove-CIPPIntuneTemplate.md)
  - [Remove-CIPPMEMPolicy](./Docs/Remove-CIPPMEMPolicy.md)
  - [Set-CIPPDeviceAction](./Docs/Set-CIPPDeviceAction.md)
  - [Set-CIPPMEMPolicy](./Docs/Set-CIPPMEMPolicy.md)
- Reports
  - [Get-CIPPDevices](./Docs/Get-CIPPDevices.md)
- [Get-CIPPApps](./Docs/Get-CIPPApps.md)
- [Get-CIPPAppStatus](./Docs/Get-CIPPAppStatus.md)
- [Remove-CIPPIntuneApp](./Docs/Remove-CIPPIntuneApp.md)
- [Remove-CIPPQueuedApp](./Docs/Remove-CIPPQueuedApp.md)
- [Get-CIPPAPDevices](./Docs/Get-CIPPAPDevices.md)
- [Get-CIPPAutoPilotConfig](./Docs/Get-CIPPAutoPilotConfig.md)
- [New-CIPPAutopilotConfig](./Docs/New-CIPPAutopilotConfig.md)
- [Remove-CIPPAPDevice](./Docs/Remove-CIPPAPDevice.md)
- [Set-CIPPAutoPilotSync](./Docs/Set-CIPPAutoPilotSync.md)
- [Get-CIPPDeviceDetails](./Docs/Get-CIPPDeviceDetails.md)
- [Get-CIPPGetBitLockerKey](./Docs/Get-CIPPGetBitLockerKey.md)
- [Get-CIPPIntuneIntents](./Docs/Get-CIPPIntuneIntents.md)
- [Get-CIPPIntunePolicy](./Docs/Get-CIPPIntunePolicy.md)
- [Get-CIPPIntuneTemplates](./Docs/Get-CIPPIntuneTemplates.md)
- [Get-CIPPLocalAdminPassword](./Docs/Get-CIPPLocalAdminPassword.md)
- [Remove-CIPPIntuneScript](./Docs/Remove-CIPPIntuneScript.md)
- [Remove-CIPPIntuneTemplate](./Docs/Remove-CIPPIntuneTemplate.md)
- [Remove-CIPPMEMPolicy](./Docs/Remove-CIPPMEMPolicy.md)
- [Set-CIPPDeviceAction](./Docs/Set-CIPPDeviceAction.md)
- [Set-CIPPMEMPolicy](./Docs/Set-CIPPMEMPolicy.md)
- [Get-CIPPDevices](./Docs/Get-CIPPDevices.md)
## Extensions
- HaloPSA
  - [Set-CIPPExtensionMappingHaloPSA](./Docs/Set-CIPPExtensionMappingHaloPSA.md)
- NinjaOne
  - [Set-CIPPNinjaOneQueue](./Docs/Set-CIPPNinjaOneQueue.md)
- Settings
  - [Get-CIPPExtensionsConfig](./Docs/Get-CIPPExtensionsConfig.md)
- [Get-CIPPExtensionMapping](./Docs/Get-CIPPExtensionMapping.md)
- [Set-CIPPExtensionMappingHaloPSA](./Docs/Set-CIPPExtensionMappingHaloPSA.md)
- [Set-CIPPNinjaOneQueue](./Docs/Set-CIPPNinjaOneQueue.md)
- [Get-CIPPExtensionsConfig](./Docs/Get-CIPPExtensionsConfig.md)
## Identity
- Administration
  - [Devices](./Docs/Devices.md)
  - [Groups](./Docs/Groups.md)
  - [Users](./Docs/Users.md)
  - [Get-CIPPRoles](./Docs/Get-CIPPRoles.md)
- Reports
  - [Get-CIPPBasicAuth](./Docs/Get-CIPPBasicAuth.md)
  - [Get-CIPPInactiveAccounts](./Docs/Get-CIPPInactiveAccounts.md)
  - [Get-CIPPMFAUsers](./Docs/Get-CIPPMFAUsers.md)
  - [Get-CIPPSignIns](./Docs/Get-CIPPSignIns.md)
- Devices
- Groups
  - [Get-CIPPGroups](./Docs/Get-CIPPGroups.md)
  - [Get-CIPPGroupTemplates](./Docs/Get-CIPPGroupTemplates.md)
  - [Remove-CIPPGroup](./Docs/Remove-CIPPGroup.md)
  - [Remove-CIPPGroupTemplate](./Docs/Remove-CIPPGroupTemplate.md)
  - [Set-CIPPGroupDeliveryManagement](./Docs/Set-CIPPGroupDeliveryManagement.md)
  - [Set-CIPPGroupHideFromGAL](./Docs/Set-CIPPGroupHideFromGAL.md)
- Users
  - [Add-CIPPGuest](./Docs/Add-CIPPGuest.md)
  - [Add-CIPPUser](./Docs/Add-CIPPUser.md)
  - [Clear-CIPPImmutableID](./Docs/Clear-CIPPImmutableID.md)
  - [Get-CIPPBECCheck](./Docs/Get-CIPPBECCheck.md)
  - [Get-CIPPDeletedItems](./Docs/Get-CIPPDeletedItems.md)
  - [Get-CIPPPerUserMFA](./Docs/Get-CIPPPerUserMFA.md)
  - [Get-CIPPUniversalSearch](./Docs/Get-CIPPUniversalSearch.md)
  - [Get-CIPPUserCAPolicies](./Docs/Get-CIPPUserCAPolicies.md)
  - [Get-CIPPUserCounts](./Docs/Get-CIPPUserCounts.md)
  - [Get-CIPPUserDevices](./Docs/Get-CIPPUserDevices.md)
  - [Get-CIPPUserGroups](./Docs/Get-CIPPUserGroups.md)
  - [Get-CIPPUserPhoto](./Docs/Get-CIPPUserPhoto.md)
  - [Get-CIPPUsers](./Docs/Get-CIPPUsers.md)
  - [Get-CIPPUserSignIns](./Docs/Get-CIPPUserSignIns.md)
  - [New-CIPPTemporaryAccessPass](./Docs/New-CIPPTemporaryAccessPass.md)
  - [New-CIPPUserOffboarding](./Docs/New-CIPPUserOffboarding.md)
  - [Remove-CIPPUser](./Docs/Remove-CIPPUser.md)
  - [Reset-CIPPUserPassword](./Docs/Reset-CIPPUserPassword.md)
  - [Restore-CIPPDeletedUser](./Docs/Restore-CIPPDeletedUser.md)
  - [Revoke-CIPPUserSessions](./Docs/Revoke-CIPPUserSessions.md)
  - [Send-CIPPPush](./Docs/Send-CIPPPush.md)
  - [Set-BECRemediate](./Docs/Set-BECRemediate.md)
  - [Set-CIPPSignInStatus](./Docs/Set-CIPPSignInStatus.md)
  - [Set-CIPPUser](./Docs/Set-CIPPUser.md)
- [Get-CIPPRoles](./Docs/Get-CIPPRoles.md)
- [Get-CIPPGroups](./Docs/Get-CIPPGroups.md)
- [Get-CIPPGroupTemplates](./Docs/Get-CIPPGroupTemplates.md)
- [Remove-CIPPGroup](./Docs/Remove-CIPPGroup.md)
- [Remove-CIPPGroupTemplate](./Docs/Remove-CIPPGroupTemplate.md)
- [Set-CIPPGroupDeliveryManagement](./Docs/Set-CIPPGroupDeliveryManagement.md)
- [Set-CIPPGroupHideFromGAL](./Docs/Set-CIPPGroupHideFromGAL.md)
- [Add-CIPPGuest](./Docs/Add-CIPPGuest.md)
- [Add-CIPPUser](./Docs/Add-CIPPUser.md)
- [Clear-CIPPImmutableID](./Docs/Clear-CIPPImmutableID.md)
- [Get-CIPPBECCheck](./Docs/Get-CIPPBECCheck.md)
- [Get-CIPPDeletedItems](./Docs/Get-CIPPDeletedItems.md)
- [Get-CIPPPerUserMFA](./Docs/Get-CIPPPerUserMFA.md)
- [Get-CIPPUniversalSearch](./Docs/Get-CIPPUniversalSearch.md)
- [Get-CIPPUserCAPolicies](./Docs/Get-CIPPUserCAPolicies.md)
- [Get-CIPPUserCounts](./Docs/Get-CIPPUserCounts.md)
- [Get-CIPPUserDevices](./Docs/Get-CIPPUserDevices.md)
- [Get-CIPPUserGroups](./Docs/Get-CIPPUserGroups.md)
- [Get-CIPPUserPhoto](./Docs/Get-CIPPUserPhoto.md)
- [Get-CIPPUsers](./Docs/Get-CIPPUsers.md)
- [Get-CIPPUserSignIns](./Docs/Get-CIPPUserSignIns.md)
- [New-CIPPTemporaryAccessPass](./Docs/New-CIPPTemporaryAccessPass.md)
- [New-CIPPUserOffboarding](./Docs/New-CIPPUserOffboarding.md)
- [Remove-CIPPUser](./Docs/Remove-CIPPUser.md)
- [Reset-CIPPUserPassword](./Docs/Reset-CIPPUserPassword.md)
- [Restore-CIPPDeletedUser](./Docs/Restore-CIPPDeletedUser.md)
- [Revoke-CIPPUserSessions](./Docs/Revoke-CIPPUserSessions.md)
- [Send-CIPPPush](./Docs/Send-CIPPPush.md)
- [Set-BECRemediate](./Docs/Set-BECRemediate.md)
- [Set-CIPPSignInStatus](./Docs/Set-CIPPSignInStatus.md)
- [Set-CIPPUser](./Docs/Set-CIPPUser.md)
- [Get-CIPPBasicAuth](./Docs/Get-CIPPBasicAuth.md)
- [Get-CIPPInactiveAccounts](./Docs/Get-CIPPInactiveAccounts.md)
- [Get-CIPPMFAUsers](./Docs/Get-CIPPMFAUsers.md)
- [Get-CIPPSignIns](./Docs/Get-CIPPSignIns.md)
## Security
- Defender
  - [Get-CIPPDefenderState](./Docs/Get-CIPPDefenderState.md)
  - [Get-CIPPDefenderTVM](./Docs/Get-CIPPDefenderTVM.md)
- Incidents
  - [Get-CIPPAlertsList](./Docs/Get-CIPPAlertsList.md)
  - [Get-CIPPAlertsQueue](./Docs/Get-CIPPAlertsQueue.md)
  - [Get-CIPPIncidentList](./Docs/Get-CIPPIncidentList.md)
- Reports
  - [Get-CIPPBreachesAccount](./Docs/Get-CIPPBreachesAccount.md)
  - [Get-CIPPBreachesTenant](./Docs/Get-CIPPBreachesTenant.md)
  - [Get-CIPPBreachSearch](./Docs/Get-CIPPBreachSearch.md)
  - [Get-CIPPDeviceCompliance](./Docs/Get-CIPPDeviceCompliance.md)
- [Get-CIPPDefenderState](./Docs/Get-CIPPDefenderState.md)
- [Get-CIPPDefenderTVM](./Docs/Get-CIPPDefenderTVM.md)
- [Get-CIPPAlertsList](./Docs/Get-CIPPAlertsList.md)
- [Get-CIPPAlertsQueue](./Docs/Get-CIPPAlertsQueue.md)
- [Get-CIPPIncidentList](./Docs/Get-CIPPIncidentList.md)
- [Get-CIPPBreachesAccount](./Docs/Get-CIPPBreachesAccount.md)
- [Get-CIPPBreachesTenant](./Docs/Get-CIPPBreachesTenant.md)
- [Get-CIPPBreachSearch](./Docs/Get-CIPPBreachSearch.md)
- [Get-CIPPDeviceCompliance](./Docs/Get-CIPPDeviceCompliance.md)
## Settings
- [Invoke-CIPPSchedulerBillingRun](./Docs/Invoke-CIPPSchedulerBillingRun.md)
## Teams
- Voice
  - [Get-CIPPTeamsLisLocation](./Docs/Get-CIPPTeamsLisLocation.md)
- [Get-CIPPTeamsLisLocation](./Docs/Get-CIPPTeamsLisLocation.md)
## Teams-Sharepoint
- OneDrive
  - [Get-CIPPOneDriveList](./Docs/Get-CIPPOneDriveList.md)
  - [Set-CIPPOneDrivePerms](./Docs/Set-CIPPOneDrivePerms.md)
  - [Set-CIPPOneDriveShortCut](./Docs/Set-CIPPOneDriveShortCut.md)
- Sharepoint
  - [Add-CIPPSharePointSite](./Docs/Add-CIPPSharePointSite.md)
  - [Get-CIPPSharePointQuota](./Docs/Get-CIPPSharePointQuota.md)
  - [Get-CIPPSharePointSites](./Docs/Get-CIPPSharePointSites.md)
  - [Set-CIPPSharePointSiteAdmin](./Docs/Set-CIPPSharePointSiteAdmin.md)
  - [Set-CIPPSharePointSiteMembers](./Docs/Set-CIPPSharePointSiteMembers.md)
- Teams
  - [Add-CIPPTeam](./Docs/Add-CIPPTeam.md)
  - [Get-CIPPTeams](./Docs/Get-CIPPTeams.md)
  - [Get-CIPPTeamsActivity](./Docs/Get-CIPPTeamsActivity.md)
  - [Get-CIPPTeamsVoice](./Docs/Get-CIPPTeamsVoice.md)
- [Get-CIPPOneDriveList](./Docs/Get-CIPPOneDriveList.md)
- [Set-CIPPOneDrivePerms](./Docs/Set-CIPPOneDrivePerms.md)
- [Set-CIPPOneDriveShortCut](./Docs/Set-CIPPOneDriveShortCut.md)
- [Add-CIPPSharePointSite](./Docs/Add-CIPPSharePointSite.md)
- [Get-CIPPSharePointQuota](./Docs/Get-CIPPSharePointQuota.md)
- [Get-CIPPSharePointSites](./Docs/Get-CIPPSharePointSites.md)
- [Set-CIPPSharePointSiteAdmin](./Docs/Set-CIPPSharePointSiteAdmin.md)
- [Set-CIPPSharePointSiteMembers](./Docs/Set-CIPPSharePointSiteMembers.md)
- [Add-CIPPTeam](./Docs/Add-CIPPTeam.md)
- [Get-CIPPTeams](./Docs/Get-CIPPTeams.md)
- [Get-CIPPTeamsActivity](./Docs/Get-CIPPTeamsActivity.md)
- [Get-CIPPTeamsVoice](./Docs/Get-CIPPTeamsVoice.md)
## Tenant
- Administration
  - [Alerts](./Docs/Alerts.md)
  - [Licenses](./Docs/Licenses.md)
  - [Tenant](./Docs/Tenant.md)
  - [Get-CIPPAppConsentReqs](./Docs/Get-CIPPAppConsentReqs.md)
  - [Get-CIPPDomains](./Docs/Get-CIPPDomains.md)
  - [Get-CIPPTenantOnboarding](./Docs/Get-CIPPTenantOnboarding.md)
  - [Remove-CIPPTenantAllowBlockList](./Docs/Remove-CIPPTenantAllowBlockList.md)
- Conditional
  - [Get-CIPPCAPolicies](./Docs/Get-CIPPCAPolicies.md)
  - [Get-CIPPCATemplates](./Docs/Get-CIPPCATemplates.md)
  - [Get-CIPPNamedLocations](./Docs/Get-CIPPNamedLocations.md)
  - [Remove-CIPPCAPolicy](./Docs/Remove-CIPPCAPolicy.md)
  - [Remove-CIPPCATemplate](./Docs/Remove-CIPPCATemplate.md)
  - [Set-CIPPCAPolicy](./Docs/Set-CIPPCAPolicy.md)
- GDAP
  - [Get-CIPPGDAPInvite](./Docs/Get-CIPPGDAPInvite.md)
  - [Get-CIPPGDAPRoles](./Docs/Get-CIPPGDAPRoles.md)
  - [New-CIPPGDAPInvite](./Docs/New-CIPPGDAPInvite.md)
  - [Remove-CIPPGDAPRelationship](./Docs/Remove-CIPPGDAPRelationship.md)
- Reports
  - [Get-CIPPLicenses](./Docs/Get-CIPPLicenses.md)
  - [Get-CIPPOAuthApps](./Docs/Get-CIPPOAuthApps.md)
  - [Get-CIPPServiceHealth](./Docs/Get-CIPPServiceHealth.md)
- Standards
  - [Get-CIPPBPA](./Docs/Get-CIPPBPA.md)
  - [Get-CIPPBPATemplates](./Docs/Get-CIPPBPATemplates.md)
  - [Get-CIPPDomainAnalyser](./Docs/Get-CIPPDomainAnalyser.md)
  - [Get-CIPPDomainHealth](./Docs/Get-CIPPDomainHealth.md)
  - [Get-CIPPStandards](./Docs/Get-CIPPStandards.md)
  - [Remove-CIPPBPATemplate](./Docs/Remove-CIPPBPATemplate.md)
  - [Remove-CIPPStandard](./Docs/Remove-CIPPStandard.md)
  - [Remove-CIPPStandardTemplate](./Docs/Remove-CIPPStandardTemplate.md)
  - [Set-CIPPStandardsRun](./Docs/Set-CIPPStandardsRun.md)
- Tools
  - [Get-CIPPAuditLogTest](./Docs/Get-CIPPAuditLogTest.md)
  - [Get-CIPPExternalGEOIPLookup](./Docs/Get-CIPPExternalGEOIPLookup.md)
  - [Get-CIPPExternalTenantInfo](./Docs/Get-CIPPExternalTenantInfo.md)
  - [Get-CIPPGraphRequest](./Docs/Get-CIPPGraphRequest.md)
- Alerts
  - [Get-CIPPAlerts](./Docs/Get-CIPPAlerts.md)
  - [Get-CIPPAuditLog](./Docs/Get-CIPPAuditLog.md)
- Application Approval
- Licenses
  - [Get-CIPPCSPLicenses](./Docs/Get-CIPPCSPLicenses.md)
  - [Get-CIPPCSPSku](./Docs/Get-CIPPCSPSku.md)
  - [Set-CIPPCSPLicense](./Docs/Set-CIPPCSPLicense.md)
- Tenant
  - [Get-CIPPADConnectStatus](./Docs/Get-CIPPADConnectStatus.md)
  - [Get-CIPPOrg](./Docs/Get-CIPPOrg.md)
  - [Get-CIPPPartnerRelationships](./Docs/Get-CIPPPartnerRelationships.md)
  - [Get-CIPPTenantDetails](./Docs/Get-CIPPTenantDetails.md)
  - [Get-CIPPTenants](./Docs/Get-CIPPTenants.md)
- [Get-CIPPAppConsentReqs](./Docs/Get-CIPPAppConsentReqs.md)
- [Get-CIPPDomains](./Docs/Get-CIPPDomains.md)
- [Get-CIPPTenantOnboarding](./Docs/Get-CIPPTenantOnboarding.md)
- [Remove-CIPPTenantAllowBlockList](./Docs/Remove-CIPPTenantAllowBlockList.md)
- [Get-CIPPAlerts](./Docs/Get-CIPPAlerts.md)
- [Get-CIPPAuditLog](./Docs/Get-CIPPAuditLog.md)
- [Get-CIPPCSPLicenses](./Docs/Get-CIPPCSPLicenses.md)
- [Get-CIPPCSPSku](./Docs/Get-CIPPCSPSku.md)
- [Set-CIPPCSPLicense](./Docs/Set-CIPPCSPLicense.md)
- [Get-CIPPADConnectStatus](./Docs/Get-CIPPADConnectStatus.md)
- [Get-CIPPOrg](./Docs/Get-CIPPOrg.md)
- [Get-CIPPPartnerRelationships](./Docs/Get-CIPPPartnerRelationships.md)
- [Get-CIPPTenantDetails](./Docs/Get-CIPPTenantDetails.md)
- [Get-CIPPTenants](./Docs/Get-CIPPTenants.md)
- [Get-CIPPCAPolicies](./Docs/Get-CIPPCAPolicies.md)
- [Get-CIPPCATemplates](./Docs/Get-CIPPCATemplates.md)
- [Get-CIPPNamedLocations](./Docs/Get-CIPPNamedLocations.md)
- [Remove-CIPPCAPolicy](./Docs/Remove-CIPPCAPolicy.md)
- [Remove-CIPPCATemplate](./Docs/Remove-CIPPCATemplate.md)
- [Set-CIPPCAPolicy](./Docs/Set-CIPPCAPolicy.md)
- [Get-CIPPGDAPInvite](./Docs/Get-CIPPGDAPInvite.md)
- [Get-CIPPGDAPRoles](./Docs/Get-CIPPGDAPRoles.md)
- [New-CIPPGDAPInvite](./Docs/New-CIPPGDAPInvite.md)
- [Remove-CIPPGDAPRelationship](./Docs/Remove-CIPPGDAPRelationship.md)
- [Get-CIPPLicenses](./Docs/Get-CIPPLicenses.md)
- [Get-CIPPOAuthApps](./Docs/Get-CIPPOAuthApps.md)
- [Get-CIPPServiceHealth](./Docs/Get-CIPPServiceHealth.md)
- [Get-CIPPBPA](./Docs/Get-CIPPBPA.md)
- [Get-CIPPBPATemplates](./Docs/Get-CIPPBPATemplates.md)
- [Get-CIPPDomainAnalyser](./Docs/Get-CIPPDomainAnalyser.md)
- [Get-CIPPDomainHealth](./Docs/Get-CIPPDomainHealth.md)
- [Get-CIPPStandards](./Docs/Get-CIPPStandards.md)
- [Remove-CIPPBPATemplate](./Docs/Remove-CIPPBPATemplate.md)
- [Remove-CIPPStandard](./Docs/Remove-CIPPStandard.md)
- [Remove-CIPPStandardTemplate](./Docs/Remove-CIPPStandardTemplate.md)
- [Set-CIPPStandardsRun](./Docs/Set-CIPPStandardsRun.md)
- [Get-CIPPAuditLogTest](./Docs/Get-CIPPAuditLogTest.md)
- [Get-CIPPExternalGEOIPLookup](./Docs/Get-CIPPExternalGEOIPLookup.md)
- [Get-CIPPExternalTenantInfo](./Docs/Get-CIPPExternalTenantInfo.md)
- [Get-CIPPGraphRequest](./Docs/Get-CIPPGraphRequest.md)
## Invoke-CIPPRestMethod
- [Invoke-CIPPRestMethod](./Docs/Invoke-CIPPRestMethod.md)
## Set-CIPPAPIDetails
- [Set-CIPPAPIDetails](./Docs/Set-CIPPAPIDetails.md)

## Advanced Usage Examples

Below are some examples for some generic requests

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/Listusers' -Method 'GET' -Params @{ 'tenantfilter' = '11c11ab1-527a-1d29-l92e-76413h012s76' }
```

This example sends a GET request to the '/api/Listusers' endpoint with a query parameter 'tenantfilter' set to '11c11ab1-527a-1d29-l92e-76413h012s76'.

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/ListMailboxPermissions' -Params @{ 'tenantfilter' = 'M365x72601982.onmicrosoft.com', 'userid' = '11c11ab1-527a-1d29-l92e-76413h012s76'}
```

This example sends a GET request to the '/api/ListMailboxPermissions' endpoint with a query parameter 'tenantfilter' set to 'M365x72601982.onmicrosoft.com' and 'userid' set to '11c11ab1-527a-1d29-l92e-76413h012s76'

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/adduser' -method 'POST' -Body @{ 'tenantID' = '11c11ab1-527a-1d29-l92e-76413h012s76';'DisplayName' = 'Test User';'UserName' = 'testuser';'AutoPassword' = $true;'FirstName' = 'Test';'LastName' = 'User';'Domain' = 'M365x72601982.onmicrosoft.com';'CopyFrom' = "" }
```

This example sends a POST request to the '/api/adduser' endpoint with a Body 'tenantID' set to '11c11ab1-527a-1d29-l92e-76413h012s76' and 'DisplayName' set to 'Test User', 'UserName' set to 'testuser', 'AutoPassword' set to $true, 'FirstName' set to 'Test', 'LastName' set to 'User', 'Domain' set to 'M365x72601982.onmicrosoft.com'

## Example Scripts

Some example scripts can be found Below:

- [Get-AllTenants-Licenses.ps1](./Example%20Scripts/Get-AllTenants-Licenses.ps1)
- [Get-AllTenants-SharedMailboxesEnabledAccount.ps1](./Example%20Scripts/Get-AllTenants-SharedMailboxesEnabledAccount.ps1)
- [Get-AllTenants-SoftDeletedMailboxes.ps1](./Example%20Scripts/Get-AllTenants-SoftDeletedMailboxes.ps1)
- [Get-AllTenants-LicensedUsers.ps1](./Example%20Scripts/Get-AllTenants-LicensedUsers.ps1)

## Special Thanks

Special thanks to [@KelvinTegelaar](https://github.com/KelvinTegelaar/), [@JohnDuprey](https://github.com/JohnDuprey/), [@rvdwegen](https://github.com/rvdwegen) and [@Jr7468](https://github.com/Jr7468/). I Could not have got this far without you!

