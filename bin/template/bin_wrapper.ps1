# MTB bin template script - paths will be filled in by post_install

# Check if MTB_DEBUG environment variable is set to 1
$debug = $env:MTB_DEBUG -eq "1"

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

# Define the paths to be added (these will be filled in during post_install)
$pathsToAdd = @("{{PATHS_TO_BE_ADDED}}")

if ($debug) {
    Write-DebugOutput "====================== MTB DEBUG MODE: ON ======================" -ForegroundColor Cyan
    Write-DebugOutput "PATHS TO ADD: $pathsToAdd"
    Write-DebugOutput "ACTUAL BINARY: {{ACTUAL_BINARY_NAME}}"
    Write-DebugOutput "================================================================" -ForegroundColor Cyan
}

# Temporarily append the folder paths to the current session's PATH variable
foreach ($path in $pathsToAdd) {
    $env:Path = "$env:Path;$path"
    if ($debug) {
        Write-DebugOutput "Appended to PATH: $path"
    }
}

if ($debug) {
    Write-DebugOutput "====================== RUNNING THE COMMAND =====================" -ForegroundColor Cyan
}

# Run the actual binary
& "{{ACTUAL_BINARY_NAME}}" $args

# Capture the exit code
$exitCode = $LASTEXITCODE

if ($debug) {
    Write-DebugOutput "Exit code from '{{ACTUAL_BINARY_NAME}}' is: $exitCode"
}

# Exit with the same code as the actual binary
exit $exitCode
