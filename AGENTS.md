# AGENTS.md - CIPPAPIModule Development Guidelines

Guidelines for AI coding agents working on this PowerShell module for the CIPP API.

## Project Info

- **Language**: PowerShell 7.0+
- **Build**: ModuleBuilder
- **License**: GNU AGPL v3
- **Repo**: https://github.com/BNWEIN/CIPPAPIModule/

## Build & Test Commands

```powershell
# Install dependencies and build
Install-Module ModuleBuilder -Force
Build-Module -SemVer "1.0.0"

# Import for testing (from source)
Import-Module ./CIPPAPIModule/CIPPAPIModule.psd1 -Force

# Test manually
Set-CIPPAPIDetails -CIPPClientID "id" -CIPPClientSecret "secret" `
                   -CIPPAPIUrl "https://your-cipp.azurewebsites.net" -TenantID "tenant"
Test-CIPPApiConnection
Get-CIPPUsers -CustomerTenantID "tenant-guid"
```

No automated tests exist. CI/CD triggers on git tags and publishes to PowerShell Gallery.

## Project Structure

```
CIPPAPIModule/
├── CIPPAPIModule/
│   ├── CIPPAPIModule.psd1      # Module manifest (don't edit version)
│   ├── CIPPAPIModule.psm1      # Auto-loads all .ps1 files
│   ├── private/                # Internal helpers (not exported)
│   └── public/                 # Exported functions (286+ files)
│       ├── Identity/Administration/{Users,Groups,Devices}/
│       ├── Email/{Administration,Transport,Spamfilter}/
│       ├── Endpoint/{Applications,Autopilot,MEM}/
│       ├── Security/{Defender,Incidents}/
│       ├── Tenant/{Administration,Conditional,GDAP}/
│       └── CIPP/{Core,Scheduler,Settings}/
├── Docs/                       # Auto-generated help docs
└── build.psd1                  # ModuleBuilder config
```

## Function Template

```powershell
<#
.SYNOPSIS
    Brief description.
.DESCRIPTION
    Detailed description.
.PARAMETER CustomerTenantID
    The tenant ID to operate on.
.EXAMPLE
    Get-CIPPExample -CustomerTenantID "guid"
#>
function Verb-CIPPNoun {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [string]$OptionalParam
    )

    Write-Verbose "Descriptive action message"

    $endpoint = '/api/EndpointName'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
```

## Naming Conventions

| Type              | Pattern                    | Example                           |
| ----------------- | -------------------------- | --------------------------------- |
| Public functions  | `Verb-CIPPNoun`            | `Get-CIPPUsers`, `Add-CIPPUser`   |
| Private functions | `Verb-Noun` (no CIPP)      | `Connect-CIPP`, `Get-TokenExpiry` |
| Parameters        | PascalCase                 | `$CustomerTenantID`, `$UserID`    |
| Tenant param      | Always `$CustomerTenantID` | Required for most functions       |

**Approved verbs**: Get, Set, Add, Remove, New, Clear, Convert, Invoke, Test, Start, Restore, Sync, Send, Reset, Revoke

## API Call Patterns

**GET request:**

```powershell
$endpoint = '/api/ListSomething'
$params = @{
    tenantFilter = $CustomerTenantID
    userId       = $UserID
}
Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
```

**POST request:**

```powershell
$endpoint = '/api/AddSomething'
$body = @{
    tenantFilter = $CustomerTenantID
    displayName  = $DisplayName
}
Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
```

## Code Style

- **Indentation**: 4 spaces
- **Braces**: Opening brace on same line
- **Hashtables**: One key-value per line
- **Parameters**: Always specify `[Parameter(Mandatory = $true|$false)]`
- **Comment-based help**: Required for all public functions

## Script Variables (Module State)

```powershell
$script:CIPPClientID      # OAuth client ID
$script:CIPPClientSecret  # OAuth client secret
$script:CIPPAPIUrl        # API base URL
$script:TenantID          # Azure AD tenant
$script:AuthHeader        # Current auth headers
$script:ExpiryDateTime    # Token expiry time
```

## Common Patterns

**Optional parameters:**

```powershell
$optionalParams = @{ City = $City; Department = $Department }
foreach ($key in $optionalParams.Keys) {
    if ($optionalParams[$key]) { $body[$key] = $optionalParams[$key] }
}
```

**Scheduled tasks:**

```powershell
Scheduled = @{
    enabled = $ScheduledFor -ne $null
    date    = if ($ScheduledFor) {
        ([System.DateTimeOffset]$ScheduledFor).ToUnixTimeSeconds()
    } else { $null }
}
```

## Adding New Functions

1. Create `.ps1` file in appropriate `public/` subdirectory
2. Include full comment-based help (.SYNOPSIS, .DESCRIPTION, .PARAMETER, .EXAMPLE)
3. Use `Invoke-CIPPRestMethod` for API calls
4. Add `Write-Verbose` for debugging
5. Module loader auto-imports all `.ps1` files

## Important Notes

- `Invoke-CIPPRestMethod` handles auth via `Invoke-CIPPPreFlightCheck`
- Module auto-refreshes expired OAuth tokens
- Don't manually edit `ModuleVersion` in manifest (set by CI build)
- Keep functions focused on a single CIPP API endpoint
- Follow patterns from similar existing functions
