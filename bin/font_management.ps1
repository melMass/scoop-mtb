function Install-Fonts($dir) {
    Get-ChildItem $dir -filter '*.ttf' -D 3 | ForEach-Object {
        $fontdir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
        If (-Not(Test-Path -Path $fontdir)) { New-Item -ItemType "directory" -Path $fontdir }
        New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts' -Name $_.Name.Replace($_.Extension, ' (TrueType)') -Value "$fontdir\$($_.Name)" -Force | Out-Null
        Copy-Item $_.FullName -destination "$fontdir"
    }
}

function Uninstall-Fonts($dir) {
    Get-ChildItem $dir -filter '*.ttf' -D 3 | ForEach-Object {
        $fontdir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
        If (-Not(Test-Path -Path "$fontdir\Deleted")) { New-Item -ItemType "directory" -Path "$fontdir\Deleted" }
        Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' -Name $_.Name.Replace($_.Extension, ' (TrueType)') -Force -ErrorAction SilentlyContinue
        Move-Item "$fontdir\$($_.Name)" -Destination "$fontdir\Deleted\$($_.Name)" -Force
    }
}
