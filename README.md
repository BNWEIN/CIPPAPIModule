## What is this?

This is the code for a [PowerShell](https://microsoft.com/powershell) module for [CIPP](https://cipp.app/). It is a work in progress, and only has about 134 out of the almost 300 API Endpoints built in. However, more will follow and it does have a generic 'Invoke-CIPPRestMethod' available so you can make any API call you want. See advanced usage examples below. 

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
Get-CIPPLogs
```

# Cmdlet Help
## CIPP
- Core
  - [Get-CIPPAccessCheck](./Docs/Get-CIPPAccessCheck.md)
  - [Get-CIPPExecAPIPermissionsList](./Docs/Get-CIPPExecAPIPermissionsList.md)
  - [Get-CIPPFunctionParameters](./Docs/Get-CIPPFunctionParameters.md)
  - [Get-CIPPKnownIPDB](./Docs/Get-CIPPKnownIPDB.md)
  - [Get-CIPPLogs](./Docs/Get-CIPPLogs.md)
  - [Get-CIPPPublicPhishingCheck](./Docs/Get-CIPPPublicPhishingCheck.md)
  - [Set-CIPPExecCPVPerms](./Docs/Set-CIPPExecCPVPerms.md)
- Scheduler
- Settings
  - [Get-CIPPExcludedLicenses](./Docs/Get-CIPPExcludedLicenses.md)
  - [Get-CIPPExcludedTenants](./Docs/Get-CIPPExcludedTenants.md)
  - [Get-CIPPExtensionMapping](./Docs/Get-CIPPExtensionMapping.md)
  - [Get-CIPPVersion](./Docs/Get-CIPPVersion.md)
  - [Set-CIPPExcludeLicense](./Docs/Set-CIPPExcludeLicense.md)
  - [Set-CIPPExcludeTenant](./Docs/Set-CIPPExcludeTenant.md)
  - [Set-CIPPExtensionMappingHaloPSA](./Docs/Set-CIPPExtensionMappingHaloPSA.md)
  - [Set-CIPPPasswordSettings](./Docs/Set-CIPPPasswordSettings.md)
- Setup
- [Get-CIPPAccessCheck](./Docs/Get-CIPPAccessCheck.md)
- [Get-CIPPExecAPIPermissionsList](./Docs/Get-CIPPExecAPIPermissionsList.md)
- [Get-CIPPFunctionParameters](./Docs/Get-CIPPFunctionParameters.md)
- [Get-CIPPKnownIPDB](./Docs/Get-CIPPKnownIPDB.md)
- [Get-CIPPLogs](./Docs/Get-CIPPLogs.md)
- [Get-CIPPPublicPhishingCheck](./Docs/Get-CIPPPublicPhishingCheck.md)
- [Set-CIPPExecCPVPerms](./Docs/Set-CIPPExecCPVPerms.md)
- [Get-CIPPExcludedLicenses](./Docs/Get-CIPPExcludedLicenses.md)
- [Get-CIPPExcludedTenants](./Docs/Get-CIPPExcludedTenants.md)
- [Get-CIPPExtensionMapping](./Docs/Get-CIPPExtensionMapping.md)
- [Get-CIPPVersion](./Docs/Get-CIPPVersion.md)
- [Set-CIPPExcludeLicense](./Docs/Set-CIPPExcludeLicense.md)
- [Set-CIPPExcludeTenant](./Docs/Set-CIPPExcludeTenant.md)
- [Set-CIPPExtensionMappingHaloPSA](./Docs/Set-CIPPExtensionMappingHaloPSA.md)
- [Set-CIPPPasswordSettings](./Docs/Set-CIPPPasswordSettings.md)
## Email-Exchange
- [Add-CIPPContact](./Docs/Add-CIPPContact.md)
- [Add-CIPPRoomMailbox](./Docs/Add-CIPPRoomMailbox.md)
- [Add-CIPPSharedMailbox](./Docs/Add-CIPPSharedMailbox.md)
- [Get-CIPPCalendarPerms](./Docs/Get-CIPPCalendarPerms.md)
- [Get-CIPPContacts](./Docs/Get-CIPPContacts.md)
- [Get-CIPPEnabledSharedMailboxes](./Docs/Get-CIPPEnabledSharedMailboxes.md)
- [Get-CIPPExchangeConnectors](./Docs/Get-CIPPExchangeConnectors.md)
- [Get-CIPPExchangeConnectorTemplates](./Docs/Get-CIPPExchangeConnectorTemplates.md)
- [Get-CIPPMailboxCAS](./Docs/Get-CIPPMailboxCAS.md)
- [Get-CIPPMailboxes](./Docs/Get-CIPPMailboxes.md)
- [Get-CIPPMailboxMobileDevices](./Docs/Get-CIPPMailboxMobileDevices.md)
- [Get-CIPPMailboxPermissions](./Docs/Get-CIPPMailboxPermissions.md)
- [Get-CIPPMailboxRestores](./Docs/Get-CIPPMailboxRestores.md)
- [Get-CIPPMailboxRules](./Docs/Get-CIPPMailboxRules.md)
- [Get-CIPPMailboxStatistics](./Docs/Get-CIPPMailboxStatistics.md)
- [Get-CIPPMailQuarantine](./Docs/Get-CIPPMailQuarantine.md)
- [Get-CIPPMessageTrace](./Docs/Get-CIPPMessageTrace.md)
- [Get-CIPPOutOfOffice](./Docs/Get-CIPPOutOfOffice.md)
- [Get-CIPPPhishPolicies](./Docs/Get-CIPPPhishPolicies.md)
- [Get-CIPPRecipients](./Docs/Get-CIPPRecipients.md)
- [Get-CIPPSpamFilter](./Docs/Get-CIPPSpamFilter.md)
- [Get-CIPPSpamFilterTemplates](./Docs/Get-CIPPSpamFilterTemplates.md)
- [Get-CIPPTransportRules](./Docs/Get-CIPPTransportRules.md)
- [Get-CIPPUserMailboxDetails](./Docs/Get-CIPPUserMailboxDetails.md)
- [Get-CIPPUserMailboxRules](./Docs/Get-CIPPUserMailboxRules.md)
- [Set-CIPPCalendarPermissions](./Docs/Set-CIPPCalendarPermissions.md)
- [Set-CIPPContact](./Docs/Set-CIPPContact.md)
- [Set-CIPPConvertMailbox](./Docs/Set-CIPPConvertMailbox.md)
- [Set-CIPPCopyToSent](./Docs/Set-CIPPCopyToSent.md)
- [Set-CIPPEnableArchive](./Docs/Set-CIPPEnableArchive.md)
- [Set-CIPPExchConnector](./Docs/Set-CIPPExchConnector.md)
- [Set-CIPPHideFromGAL](./Docs/Set-CIPPHideFromGAL.md)
- [Set-CIPPMailboxForwarding](./Docs/Set-CIPPMailboxForwarding.md)
- [Set-CIPPMailboxMobileDevices](./Docs/Set-CIPPMailboxMobileDevices.md)
- [Set-CIPPMailboxPermissions](./Docs/Set-CIPPMailboxPermissions.md)
- [Set-CIPPMailboxQuota](./Docs/Set-CIPPMailboxQuota.md)
- [Set-CIPPOOO](./Docs/Set-CIPPOOO.md)
- [Set-CIPPQuarantineManagement](./Docs/Set-CIPPQuarantineManagement.md)
- [Set-CIPPSpamFilter](./Docs/Set-CIPPSpamFilter.md)
- [Set-CIPPTransportRule](./Docs/Set-CIPPTransportRule.md)
## Endpoint
- Applications
  - [Get-CIPPApps](./Docs/Get-CIPPApps.md)
- Autopilot
  - [Get-CIPPAPDevices](./Docs/Get-CIPPAPDevices.md)
  - [Get-CIPPAutoPilotConfig](./Docs/Get-CIPPAutoPilotConfig.md)
- MEM
  - [Set-CIPPMEMPolicy](./Docs/Set-CIPPMEMPolicy.md)
- Reports
  - [Get-CIPPDevices](./Docs/Get-CIPPDevices.md)
- [Get-CIPPApps](./Docs/Get-CIPPApps.md)
- [Get-CIPPAPDevices](./Docs/Get-CIPPAPDevices.md)
- [Get-CIPPAutoPilotConfig](./Docs/Get-CIPPAutoPilotConfig.md)
- [Set-CIPPMEMPolicy](./Docs/Set-CIPPMEMPolicy.md)
- [Get-CIPPDevices](./Docs/Get-CIPPDevices.md)
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
  - [Set-CIPPGroupDeliveryManagement](./Docs/Set-CIPPGroupDeliveryManagement.md)
  - [Set-CIPPGroupHideFromGAL](./Docs/Set-CIPPGroupHideFromGAL.md)
- Users
  - [Add-CIPPUser](./Docs/Add-CIPPUser.md)
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
  - [New-CIPPUserOffboarding](./Docs/New-CIPPUserOffboarding.md)
  - [Remove-CIPPUser](./Docs/Remove-CIPPUser.md)
  - [Send-CIPPPush](./Docs/Send-CIPPPush.md)
  - [Set-BECRemediate](./Docs/Set-BECRemediate.md)
  - [Set-CIPPClrImmID](./Docs/Set-CIPPClrImmID.md)
  - [Set-CIPPCreateTap](./Docs/Set-CIPPCreateTap.md)
  - [Set-CIPPResetPassword](./Docs/Set-CIPPResetPassword.md)
  - [Set-CIPPRestoreDeletedUser](./Docs/Set-CIPPRestoreDeletedUser.md)
  - [Set-CIPPRevokeSessions](./Docs/Set-CIPPRevokeSessions.md)
  - [Set-CIPPSignInStatus](./Docs/Set-CIPPSignInStatus.md)
  - [Set-CIPPUser](./Docs/Set-CIPPUser.md)
- [Get-CIPPRoles](./Docs/Get-CIPPRoles.md)
- [Get-CIPPGroups](./Docs/Get-CIPPGroups.md)
- [Get-CIPPGroupTemplates](./Docs/Get-CIPPGroupTemplates.md)
- [Remove-CIPPGroup](./Docs/Remove-CIPPGroup.md)
- [Set-CIPPGroupDeliveryManagement](./Docs/Set-CIPPGroupDeliveryManagement.md)
- [Set-CIPPGroupHideFromGAL](./Docs/Set-CIPPGroupHideFromGAL.md)
- [Add-CIPPUser](./Docs/Add-CIPPUser.md)
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
- [New-CIPPUserOffboarding](./Docs/New-CIPPUserOffboarding.md)
- [Remove-CIPPUser](./Docs/Remove-CIPPUser.md)
- [Send-CIPPPush](./Docs/Send-CIPPPush.md)
- [Set-BECRemediate](./Docs/Set-BECRemediate.md)
- [Set-CIPPClrImmID](./Docs/Set-CIPPClrImmID.md)
- [Set-CIPPCreateTap](./Docs/Set-CIPPCreateTap.md)
- [Set-CIPPResetPassword](./Docs/Set-CIPPResetPassword.md)
- [Set-CIPPRestoreDeletedUser](./Docs/Set-CIPPRestoreDeletedUser.md)
- [Set-CIPPRevokeSessions](./Docs/Set-CIPPRevokeSessions.md)
- [Set-CIPPSignInStatus](./Docs/Set-CIPPSignInStatus.md)
- [Set-CIPPUser](./Docs/Set-CIPPUser.md)
- [Get-CIPPBasicAuth](./Docs/Get-CIPPBasicAuth.md)
- [Get-CIPPInactiveAccounts](./Docs/Get-CIPPInactiveAccounts.md)
- [Get-CIPPMFAUsers](./Docs/Get-CIPPMFAUsers.md)
- [Get-CIPPSignIns](./Docs/Get-CIPPSignIns.md)
## Intune
- Device
  - [Get-CIPPGetBitLockerKey](./Docs/Get-CIPPGetBitLockerKey.md)
  - [Get-CIPPIntuneIntents](./Docs/Get-CIPPIntuneIntents.md)
  - [Get-CIPPIntunePolicy](./Docs/Get-CIPPIntunePolicy.md)
  - [Get-CIPPIntuneTemplates](./Docs/Get-CIPPIntuneTemplates.md)
  - [Get-CIPPLocalAdminPassword](./Docs/Get-CIPPLocalAdminPassword.md)
  - [Set-CIPPAutoPilotSync](./Docs/Set-CIPPAutoPilotSync.md)
  - [Set-CIPPDeviceAction](./Docs/Set-CIPPDeviceAction.md)
- [Get-CIPPGetBitLockerKey](./Docs/Get-CIPPGetBitLockerKey.md)
- [Get-CIPPIntuneIntents](./Docs/Get-CIPPIntuneIntents.md)
- [Get-CIPPIntunePolicy](./Docs/Get-CIPPIntunePolicy.md)
- [Get-CIPPIntuneTemplates](./Docs/Get-CIPPIntuneTemplates.md)
- [Get-CIPPLocalAdminPassword](./Docs/Get-CIPPLocalAdminPassword.md)
- [Set-CIPPAutoPilotSync](./Docs/Set-CIPPAutoPilotSync.md)
- [Set-CIPPDeviceAction](./Docs/Set-CIPPDeviceAction.md)
## Security
- Defender
  - [Get-CIPPDefenderState](./Docs/Get-CIPPDefenderState.md)
  - [Get-CIPPDefenderTVM](./Docs/Get-CIPPDefenderTVM.md)
- Incidents
  - [Get-CIPPAlertsList](./Docs/Get-CIPPAlertsList.md)
  - [Get-CIPPIncidentList](./Docs/Get-CIPPIncidentList.md)
- Reports
  - [Get-CIPPDeviceCompliance](./Docs/Get-CIPPDeviceCompliance.md)
- [Get-CIPPDefenderState](./Docs/Get-CIPPDefenderState.md)
- [Get-CIPPDefenderTVM](./Docs/Get-CIPPDefenderTVM.md)
- [Get-CIPPAlertsList](./Docs/Get-CIPPAlertsList.md)
- [Get-CIPPIncidentList](./Docs/Get-CIPPIncidentList.md)
- [Get-CIPPDeviceCompliance](./Docs/Get-CIPPDeviceCompliance.md)
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
  - [Tenant](./Docs/Tenant.md)
  - [Get-CIPPAppConsentReqs](./Docs/Get-CIPPAppConsentReqs.md)
  - [Get-CIPPDomains](./Docs/Get-CIPPDomains.md)
- Conditional
  - [Get-CIPPCAPolicies](./Docs/Get-CIPPCAPolicies.md)
  - [Get-CIPPCATemplates](./Docs/Get-CIPPCATemplates.md)
  - [Get-CIPPNamedLocations](./Docs/Get-CIPPNamedLocations.md)
  - [Set-CIPPCAPolicy](./Docs/Set-CIPPCAPolicy.md)
- GDAP
  - [Get-CIPPGDAPInvite](./Docs/Get-CIPPGDAPInvite.md)
  - [Get-CIPPGDAPRoles](./Docs/Get-CIPPGDAPRoles.md)
  - [Remove-CIPPGDAPRelationship](./Docs/Remove-CIPPGDAPRelationship.md)
- Reports
  - [Get-CIPPLicenses](./Docs/Get-CIPPLicenses.md)
  - [Get-CIPPOAuthApps](./Docs/Get-CIPPOAuthApps.md)
- Standards
  - [Get-CIPPBPA](./Docs/Get-CIPPBPA.md)
  - [Get-CIPPBPATemplates](./Docs/Get-CIPPBPATemplates.md)
  - [Get-CIPPDomainAnalyser](./Docs/Get-CIPPDomainAnalyser.md)
  - [Get-CIPPDomainHealth](./Docs/Get-CIPPDomainHealth.md)
  - [Get-CIPPStandards](./Docs/Get-CIPPStandards.md)
  - [Remove-CIPPStandard](./Docs/Remove-CIPPStandard.md)
  - [Set-CIPPStandardsRun](./Docs/Set-CIPPStandardsRun.md)
- Tools
  - [Get-CIPPAuditLogTest](./Docs/Get-CIPPAuditLogTest.md)
  - [Get-CIPPExternalGEOIPLookup](./Docs/Get-CIPPExternalGEOIPLookup.md)
  - [Get-CIPPExternalTenantInfo](./Docs/Get-CIPPExternalTenantInfo.md)
  - [Get-CIPPGraphRequest](./Docs/Get-CIPPGraphRequest.md)
- Alerts
  - [Get-CIPPAlerts](./Docs/Get-CIPPAlerts.md)
- Application Approval
- Tenant
  - [Get-CIPPADConnectStatus](./Docs/Get-CIPPADConnectStatus.md)
  - [Get-CIPPOrg](./Docs/Get-CIPPOrg.md)
  - [Get-CIPPPartnerRelationships](./Docs/Get-CIPPPartnerRelationships.md)
  - [Get-CIPPTenantDetails](./Docs/Get-CIPPTenantDetails.md)
  - [Get-CIPPTenants](./Docs/Get-CIPPTenants.md)
- [Get-CIPPAppConsentReqs](./Docs/Get-CIPPAppConsentReqs.md)
- [Get-CIPPDomains](./Docs/Get-CIPPDomains.md)
- [Get-CIPPAlerts](./Docs/Get-CIPPAlerts.md)
- [Get-CIPPADConnectStatus](./Docs/Get-CIPPADConnectStatus.md)
- [Get-CIPPOrg](./Docs/Get-CIPPOrg.md)
- [Get-CIPPPartnerRelationships](./Docs/Get-CIPPPartnerRelationships.md)
- [Get-CIPPTenantDetails](./Docs/Get-CIPPTenantDetails.md)
- [Get-CIPPTenants](./Docs/Get-CIPPTenants.md)
- [Get-CIPPCAPolicies](./Docs/Get-CIPPCAPolicies.md)
- [Get-CIPPCATemplates](./Docs/Get-CIPPCATemplates.md)
- [Get-CIPPNamedLocations](./Docs/Get-CIPPNamedLocations.md)
- [Set-CIPPCAPolicy](./Docs/Set-CIPPCAPolicy.md)
- [Get-CIPPGDAPInvite](./Docs/Get-CIPPGDAPInvite.md)
- [Get-CIPPGDAPRoles](./Docs/Get-CIPPGDAPRoles.md)
- [Remove-CIPPGDAPRelationship](./Docs/Remove-CIPPGDAPRelationship.md)
- [Get-CIPPLicenses](./Docs/Get-CIPPLicenses.md)
- [Get-CIPPOAuthApps](./Docs/Get-CIPPOAuthApps.md)
- [Get-CIPPBPA](./Docs/Get-CIPPBPA.md)
- [Get-CIPPBPATemplates](./Docs/Get-CIPPBPATemplates.md)
- [Get-CIPPDomainAnalyser](./Docs/Get-CIPPDomainAnalyser.md)
- [Get-CIPPDomainHealth](./Docs/Get-CIPPDomainHealth.md)
- [Get-CIPPStandards](./Docs/Get-CIPPStandards.md)
- [Remove-CIPPStandard](./Docs/Remove-CIPPStandard.md)
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

Special thanks to [@KelvinTegelaar](https://github.com/KelvinTegelaar/), [@JohnDuprey](https://github.com/JohnDuprey/), [@rvdwegen](https://github.com/rvdwegen) and [@Jr7468](https://github.com/Jr7468/).  I Could not have got this far without you! 




