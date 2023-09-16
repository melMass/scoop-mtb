function GenerateBinaryWrapper {
    param (
        [string]$TemplatePath,
        [string]$InstallDir,
        [string[]]$Binaries,
        [string[]]$Paths
    )

    $content = Get-Content -Path $TemplatePath

    foreach ($binary in $Binaries) {
        $pathsString = $Paths -join '","'
        $newContent = $content -replace '{{PATHS_TO_BE_ADDED}}', $pathsString
        $newContent = $newContent -replace '{{ACTUAL_BINARY_NAME}}', "$InstallDir\\bin\\$binary"
        Set-Content -Path ($InstallDir + '\\bin\\' + $binary.Replace('.exe', '.ps1')) -Value $newContent
    }
}