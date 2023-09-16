# Template script - paths will be filled in by post_install

# Define the paths to be added (these will be filled in during post_install)
$pathsToAdd = @("{{PATHS_TO_BE_ADDED}}")

# Temporarily append the folder paths to the current session's PATH variable
foreach ($path in $pathsToAdd) {
    $env:Path = "$env:Path;$path"
}

# Run your actual binary
& "{{ACTUAL_BINARY_NAME}}" $args
