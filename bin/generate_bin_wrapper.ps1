. $PSScriptRoot\common.ps1

function GenerateBinaryWrapper
{
    param (
        [string]$InstallDir,
        [string[]]$Binaries,
        [string[]]$Paths,
        [switch]$ChangeDirectory
    )
    $templatePath = "$PSScriptRoot\\template\\bin_wrapper.ps1"
    $content = Get-Content -Path $TemplatePath

    Write-DebugOutput "====================== MTB WRAPPER CREATION ======================" -ForegroundColor Cyan

    foreach ($binary in $Binaries)
    {
        $pathsString = $Paths -join '","'
        $newContent = $content -replace '{{SHOULD_CD}}', $ChangeDirectory.IsPresent.ToString().ToLower()
        $newContent = $newContent -replace '{{INSTALL_DIR}}', "$InstallDir"
        $newContent = $newContent -replace '{{PATHS_TO_BE_ADDED}}', $pathsString
        $newContent = $newContent -replace '{{ACTUAL_BINARY_NAME}}', "$InstallDir\\$binary"
        Set-Content -Path ($InstallDir + '\\' + $binary.Replace('.exe', '.ps1')) -Value $newContent

        Write-DebugOutput "Generated wrapper for $binary with paths: $Paths"
    }

    Write-DebugOutput "===================================================================" -ForegroundColor Cyan
}


function GenerateVbsWrapper
{
    param (
        [string]$InstallDir,
        [string[]]$Binaries
    )
    Write-DebugOutput "====================== MTB (vbs) WRAPPER CREATION ======================" -ForegroundColor Cyan

    foreach ($binary in $Binaries)
    {
        $vbsContent = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "$InstallDir\\$binary" & Chr(34), 0
Set WshShell = Nothing
"@
        $vbsFilePath = $InstallDir + '\\' + $binary.Replace('.exe', '.vbs')
        Set-Content -Path $vbsFilePath -Value $vbsContent

        Write-DebugOutput "Generated VBS wrapper for $binary at $vbsFilePath"
    }

    Write-DebugOutput "===================================================================" -ForegroundColor Cyan
}
