<#
.SYNOPSIS
    Checks if there's a newer version of the CIPPAPIModule available on the PowerShell Gallery.

.DESCRIPTION
    The Test-CIPPAPIModuleUpdate function compares the locally installed version of CIPPAPIModule 
    with the latest version available on the PowerShell Gallery. It determines the local version 
    by querying the installed modules. If a newer version is found, it displays a warning message
    suggesting an update.

.EXAMPLE
    Test-CIPPAPIModuleUpdate
    
    Checks if the locally installed CIPPAPIModule is up to date.

.EXAMPLE
    Test-CIPPAPIModuleUpdate -Verbose
    
    Checks for updates with verbose output, showing the local and gallery versions.

.NOTES
    This function requires internet access to query the PowerShell Gallery.
    It handles various error scenarios gracefully, including network errors, 
    manifest access errors, and version parsing issues.

.LINK
    Update-Module
#>
# Function to check for CIPPAPIModule updates
function Test-CIPPAPIModuleUpdate {
    [CmdletBinding()]
    param ()
    Write-Verbose 'Checking for CIPPAPIModule updates...'
    $ModuleName = 'CIPPAPIModule'

    # Get the local version
    $InstalledModule = Get-InstalledModule -Name $ModuleName -ErrorAction SilentlyContinue
    if (-not $InstalledModule) {
        Write-Warning "Module '$ModuleName' not found via Get-InstalledModule. Cannot check for updates."
        return
    }

    # Normalize to one version in case multiple local installs are returned.
    $InstalledModules = @($InstalledModule)
    $VersionCandidates = @()
    $InstallRecords = @()

    foreach ($Module in $InstalledModules) {
        if (-not $Module.Version) {
            continue
        }

        $VersionValues = @($Module.Version)
        $LocationValues = @($Module.InstalledLocation)

        for ($i = 0; $i -lt $VersionValues.Count; $i++) {
            $VersionValue = $VersionValues[$i]
            try {
                $ParsedVersion = [version]$VersionValue.ToString()
                $VersionCandidates += $ParsedVersion

                $InstallPath = $null
                if ($VersionValues.Count -eq $LocationValues.Count -and $VersionValues.Count -gt 0) {
                    $InstallPath = $LocationValues[$i]
                }

                if (-not $InstallPath) {
                    $InstallPath = $Module.InstalledLocation
                }

                $InstallRecords += [pscustomobject]@{
                    Version = $ParsedVersion
                    Path = $InstallPath
                }
            } catch {
                Write-Verbose "Skipping invalid local version value '$VersionValue' while checking updates."
            }
        }
    }

    if (-not $VersionCandidates) {
        Write-Warning "Module '$ModuleName' found via Get-InstalledModule, but no valid version information was available. Cannot check for updates."
        return
    }

    $LocalVersion = $VersionCandidates | Sort-Object -Descending | Select-Object -First 1
    $LocalVersionString = $LocalVersion.ToString()
    Write-Verbose "Local CIPPAPIModule version: $LocalVersion"

    # Warn if older side-by-side local installs are present.
    $OutdatedLocalInstalls = $InstallRecords |
        Where-Object { $_.Version -lt $LocalVersion } |
        Sort-Object Version -Descending -Unique

    foreach ($OutdatedInstall in $OutdatedLocalInstalls) {
        $OutdatedPath = if ($OutdatedInstall.Path) { $OutdatedInstall.Path } else { '<unknown path>' }
        Write-Warning "An outdated local install of $ModuleName (v$($OutdatedInstall.Version)) was found at: $OutdatedPath"
    }

    try {
        # Find the module in the gallery
        Write-Verbose "Querying PowerShell Gallery for the latest version of $ModuleName..."
        # Specify repository to avoid potential conflicts if multiple sources are registered
        $GalleryModule = Find-Module -Name $ModuleName -Repository PSGallery -ErrorAction Stop
        $GalleryVersion = $GalleryModule.Version

        Write-Verbose "Latest version on PSGallery: $GalleryVersion"

        # Compare versions
        if ($GalleryVersion -gt $LocalVersion) {
            Write-Host '---------------------------------------------------------------------' -ForegroundColor Yellow
            Write-Host "WARNING: A newer version of CIPPAPIModule (v$GalleryVersion) is available." -ForegroundColor Yellow
            Write-Host "You are currently running v$LocalVersion." -ForegroundColor Yellow
            Write-Host "Consider running 'Update-Module $ModuleName' to get the latest features and fixes." -ForegroundColor Yellow
            Write-Host '---------------------------------------------------------------------' -ForegroundColor Yellow
        } else {
            Write-Verbose "CIPPAPIModule is up to date (v$LocalVersion)."
        }
    } catch [System.Net.WebException] {
        # Catch specific network errors
        Write-Warning "Network error: Failed to connect to the PowerShell Gallery to check for $ModuleName updates. Please check your internet connection. Error: $($_.Exception.Message)"
    } catch [Microsoft.PowerShell.Commands.ModuleNotFoundException] {
        # Catch if Find-Module specifically fails to find the module
        Write-Warning "'$ModuleName' not found on the PowerShell Gallery (PSGallery). Cannot check for updates."
    } catch {
        # Catch any other errors during Find-Module or version comparison
        Write-Warning "An error occurred while checking for $ModuleName updates on the PowerShell Gallery: $($_.Exception.Message)"
    }
}
