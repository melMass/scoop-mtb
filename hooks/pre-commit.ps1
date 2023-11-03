# Get all staged files
$stagedFiles = git diff --cached --name-only --diff-filter=ACM

foreach ($file in $stagedFiles) {
    # Check if the file exists before trying to trim it
    if (Test-Path $file) {
        # Trim trailing whitespace from each line
        $content = Get-Content $file
        $trimmedContent = $content | Foreach-Object { $_.TrimEnd() }
        Set-Content -Path $file -Value $trimmedContent
        # Stage the changes
        git add $file
    }
}
