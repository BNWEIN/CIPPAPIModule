<#
.SYNOPSIS
    Checks if there's a newer version of the CIPPAPIModule available on the PowerShell Gallery.

.DESCRIPTION
    The Test-CIPPAPIModuleUpdate function compares the locally installed version of CIPPAPIModule 
    with the latest version available on the PowerShell Gallery. It determines the local version 
    by either reading the module manifest or querying the installed modules. If a newer version 
    is found, it displays a warning message suggesting an update.

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
    $moduleName = 'CIPPAPIModule'
    # Get the path to the module manifest within the currently executing script's module directory
    # Assumes Invoke-CIPPPreFlightCheck.ps1 is in the 'private' folder, so go up one level.
    $moduleManifestPath = Join-Path $PSScriptRoot '..\CIPPAPIModule.psd1'

    if (-not (Test-Path $moduleManifestPath)) {
        Write-Warning "Could not find module manifest at expected location: $moduleManifestPath. Cannot determine local version."
        # Attempt to get from installed modules as a fallback
        $installedModule = Get-InstalledModule -Name $moduleName -ErrorAction SilentlyContinue
        if (-not $installedModule) {
            Write-Warning "Module '$moduleName' also not found via Get-InstalledModule. Cannot check for updates."
            return
        }
        # Ensure Version object exists before accessing ToString()
        if ($installedModule.Version) {
            $localVersionString = $installedModule.Version.ToString()
        } else {
            Write-Warning "Module '$moduleName' found via Get-InstalledModule, but version information is missing. Cannot check for updates."
            return
        }
    } else {
        try {
            # Read the version directly from the manifest file using Import-PowerShellDataFile for safety
            $manifestData = Import-PowerShellDataFile -Path $moduleManifestPath
            $localVersionString = $manifestData.ModuleVersion
        } catch {
            Write-Warning "Error reading module manifest at '$moduleManifestPath': $($_.Exception.Message). Cannot determine local version."
            return
        }
    }


    if (-not $localVersionString) {
        Write-Warning "Could not determine the local version of '$moduleName'. Cannot check for updates."
        return
    }
    
    # Ensure the version string is in a valid format
    try {
        $localVersion = [version]$localVersionString
        Write-Verbose "Local CIPPAPIModule version: $localVersion"
    } catch {
        Write-Warning "Local version string '$localVersionString' from manifest is not a valid version format. Error: $($_.Exception.Message). Cannot check for updates."
        return
    }


    try {
        # Find the module in the gallery
        Write-Verbose "Querying PowerShell Gallery for the latest version of $moduleName..."
        # Specify repository to avoid potential conflicts if multiple sources are registered
        $galleryModule = Find-Module -Name $moduleName -Repository PSGallery -ErrorAction Stop
        $galleryVersion = $galleryModule.Version

        Write-Verbose "Latest version on PSGallery: $galleryVersion"

        # Compare versions
        if ($galleryVersion -gt $localVersion) {
            Write-Host '---------------------------------------------------------------------' -ForegroundColor Yellow
            Write-Host "WARNING: A newer version of CIPPAPIModule (v$galleryVersion) is available." -ForegroundColor Yellow
            Write-Host "You are currently running v$localVersion." -ForegroundColor Yellow
            Write-Host "Consider running 'Update-Module $moduleName' to get the latest features and fixes." -ForegroundColor Yellow
            Write-Host '---------------------------------------------------------------------' -ForegroundColor Yellow
        } else {
            Write-Verbose "CIPPAPIModule is up to date (v$localVersion)."
        }
    } catch [System.Net.WebException] {
        # Catch specific network errors
        Write-Warning "Network error: Failed to connect to the PowerShell Gallery to check for $moduleName updates. Please check your internet connection. Error: $($_.Exception.Message)"
    } catch [Microsoft.PowerShell.Commands.ModuleNotFoundException] {
        # Catch if Find-Module specifically fails to find the module
        Write-Warning "'$moduleName' not found on the PowerShell Gallery (PSGallery). Cannot check for updates."
    } catch {
        # Catch any other errors during Find-Module or version comparison
        Write-Warning "An error occurred while checking for $moduleName updates on the PowerShell Gallery: $($_.Exception.Message)"
    }
}