# Helper function for colored output
function Write-DebugOutput {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [System.ConsoleColor]$ForegroundColor = [System.ConsoleColor]::Yellow,
        [System.ConsoleColor]$BackgroundColor = [System.ConsoleColor]::Black
    )
    Write-Host $Message -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
}


function GenerateBinaryWrapper {
    param (
        [string]$InstallDir,
        [string[]]$Binaries,
        [string[]]$Paths,
        [switch]$ChangeDirectory
    )
    $templatePath = "$PSScriptRoot\\template\\bin_wrapper.ps1"
    $content = Get-Content -Path $TemplatePath

    Write-DebugOutput "====================== MTB WRAPPER CREATION ======================" -ForegroundColor Cyan

    foreach ($binary in $Binaries) {
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
