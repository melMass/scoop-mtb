# MTB bin template script - paths will be filled in by post_install

# Check if MTB_DEBUG environment variable is set to 1
$debug = [System.Environment]::GetEnvironmentVariable('MTB_DEBUG', 'User') -eq '1'

# Adding conditional debug outputs
if ($debug) {
    Write-Output "Wrapper started for: {{ACTUAL_BINARY_NAME}}"
}

# Define the paths to be added (these will be filled in during post_install)
$pathsToAdd = @("{{PATHS_TO_BE_ADDED}}")

# Temporarily append the folder paths to the current session's PATH variable
foreach ($path in $pathsToAdd) {
    $env:Path = "$env:Path;$path"
    if ($debug) {
        Write-Output "Appended to PATH: $path"
    }
}

# Run the actual binary
& "{{ACTUAL_BINARY_NAME}}" $args

# Capture the exit code
$exitCode = $LASTEXITCODE

if ($debug) {
    Write-Output "Exit code from '{{ACTUAL_BINARY_NAME}}' is: $exitCode"
}

# Exit with the same code as the actual binary
exit $exitCode