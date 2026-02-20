# EDITABLE PARAMETERS

$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $true


$shortcutName = "BLU"
$shortcutURL = "https://bltelecoms.atlassian.net/servicedesk/customer/user/requests"
# Direct URL to the icon file (.ico format is recommended)
$iconPath = "https://raw.githubusercontent.com/JayJaybyte/Blu/refs/heads/main/Blu.ico"
# Define the local path for the downloaded icon file
 $iconLocalPath = "$env:TEMP\blu.ico"

# Download the icon file
try {
    Invoke-WebRequest -Uri $iconPath -OutFile $iconLocalPath
} catch {
    Write-Host "Could not download icon file. Using default browser icon."
    $iconLocalPath = $null
}

# Create the shortcut
$shell = New-Object -ComObject WScript.Shell
$desktopPath = $shell.SpecialFolders.Item("Desktop")
$shortcutPath = Join-Path -Path $desktopPath -ChildPath "$shortcutName.lnk" # .lnk is more reliable for custom icons

$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $shortcutURL
if ($iconLocalPath) {
    $shortcut.IconLocation = $iconLocalPath
}
$shortcut.Save()

Write-Host "Shortcut '$shortcutName' created on the desktop."


Read-Host -Prompt "Press Enter to exit"

