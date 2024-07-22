function Update-ModuleVersion {
    param (
        [string]$FilePath = "..\CIPPAPIModule\CIPPAPIModule\CIPPAPIModule.psd1"
    )
    
    # Read the file contents
    $content = Get-Content -Path $FilePath
    
    # Find the line with ModuleVersion
    $moduleVersionLine = $content | Where-Object { $_ -match "ModuleVersion\s*=\s*\'\d+\.\d+\.\d+\'" }
    
    if ($moduleVersionLine) {
        # Extract the version number
        $version = $moduleVersionLine -replace "ModuleVersion\s*=\s*\'([0-9]+\.[0-9]+\.[0-9]+)\'.*", '$1'
        
        # Split the version number into parts
        $versionParts = $version -split '\.'
        
        # Increment the patch version (third part)
        $versionParts[2] = [int]$versionParts[2] + 1
        
        # Create the new version string
        $newVersion = "$($versionParts[0]).$($versionParts[1]).$($versionParts[2])"
        
        # Replace the old version line with the new version line
        $newContent = $content -replace "ModuleVersion\s*=\s*\'$version\'", "ModuleVersion = '$newVersion'"
        
        # Backup the original file
        Copy-Item -Path $FilePath -Destination "$FilePath.bak" -Force
        
        # Write the new contents back to the file
        Set-Content -Path $FilePath -Value $newContent
        
        Write-Host "Module version updated to $newVersion"
    } else {
        Write-Host "ModuleVersion line not found in the file."
    }
}