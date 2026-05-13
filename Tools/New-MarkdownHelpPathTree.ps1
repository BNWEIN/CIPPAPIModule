function New-MarkdownHelpPathTree {
    [CmdletBinding()]
    Param()

    $Readme = Get-Content .\README.md -Raw
    $cmdletHelpMatch = [regex]::Match($Readme, '(?im)^# Cmdlet Help\s*$')
    if (-not $cmdletHelpMatch.Success) {
        throw "Could not find '# Cmdlet Help' in README.md."
    }

    $specialThanksMatch = [regex]::Match($Readme, '(?im)^##\s*Special Thanks\s*$')
    if (-not $specialThanksMatch.Success) {
        throw "Could not find '## Special Thanks' section in README.md."
    }

    if ($specialThanksMatch.Index -le $cmdletHelpMatch.Index) {
        throw "'## Special Thanks' must appear after '# Cmdlet Help' in README.md."
    }

    # Keep everything up to and including '# Cmdlet Help' unchanged.
    $ReadmeTop = $Readme.Substring(0, $cmdletHelpMatch.Index + $cmdletHelpMatch.Length)
    # Keep '## Special Thanks' and anything after it unchanged.
    $ReadmeBottom = $Readme.Substring($specialThanksMatch.Index)

    $Folders = Get-ChildItem .\CIPPAPIModule\Public
    $GeneratedCmdletSection = ''
    foreach ($Folder in $Folders) {
        $GeneratedCmdletSection = $GeneratedCmdletSection + ("`n## {0}" -f $Folder.BaseName)
        $Items = Get-ChildItem -Path $Folder -Recurse
        foreach ($Item in $Items) {
            if ($item.Extension -eq '.ps1') {
                $GeneratedCmdletSection = $GeneratedCmdletSection + ("`n- [{0}](./Docs/{1}.md)" -f $Item.BaseName, $Item.BaseName)
            } else {
                $GeneratedCmdletSection = $GeneratedCmdletSection + ("`n- {0}" -f $Item.BaseName)
                $Item | Get-ChildItem | ForEach-Object {
                    $GeneratedCmdletSection = $GeneratedCmdletSection + ("`n  - [{0}](./Docs/{1}.md)" -f $_.BaseName, $_.BaseName)
                }
            }
        }
    }

    $NewReadme = $ReadmeTop + $GeneratedCmdletSection + "`n`n" + $ReadmeBottom

    $NewReadme | Set-Content -Path .\README.md
}