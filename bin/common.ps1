# Helper function for colored output
function Write-DebugOutput
{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [System.ConsoleColor]$ForegroundColor = [System.ConsoleColor]::Yellow,
        [System.ConsoleColor]$BackgroundColor = [System.ConsoleColor]::Black
    )
    Write-Host $Message -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor
}

