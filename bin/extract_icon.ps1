. $PSScriptRoot\common.ps1

function ExtractIcon
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$InstallDir,
        [Parameter(Mandatory=$true)]
        [string[]]$Binaries
    )

    [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing') | Out-Null

    foreach ($binary in $Binaries)
    {
        $exePath = Join-Path -Path $InstallDir -ChildPath $binary
        if (Test-Path -Path $exePath)
        {
            $baseName = [System.IO.Path]::GetFileNameWithoutExtension($exePath)
            Write-Progress "Extracting Icon" $baseName
            [System.Drawing.Icon]::ExtractAssociatedIcon($exePath).ToBitmap().Save("$InstallDir\$baseName.ico")
            Write-DebugOutput "Extracted icon for $binary and saved as $baseName.ico"
        } else
        {
            Write-DebugOutput "Executable $exePath not found" -ForegroundColor Red
        }
    }
}
