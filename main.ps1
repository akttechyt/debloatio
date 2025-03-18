# Debloatio v0.1.0

# This is the important code, containing the function powering Yes/No questions.
# Write-Host colour guide:
# Yellow: Warnings, important stuff
# Red: Errors, extremely important stuff
# Blue: Info
# Green: Success

function YesNoQuestions {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Question
    )
    
    do {
        $response = Read-Host "$Question (Y/N)"
        
        switch ($response.ToUpper()) {
            "Y" { return $true }
            "N" { return $false }
            default { Write-Host "Please enter Y for Yes or N for No." -ForegroundColor Red }
        }
    } while ($true)
}

$host.ui.RawUI.WindowTitle = "Debloatio | v0.2.0"

Write-Host "Debloatio (alpha) | v0.2.0 (Beta stage update)" -ForegroundColor Blue
Write-Host "WARNING | This is alpha software, which means it is EXTREMELY UNSTABLE. Recommended for testing only on a VIRTUAL MACHINE or A PC WHICH YOU DON'T HAVE IMPORTANT DATA ON." -ForegroundColor Yellow
Write-Host "WARNING | Creator or contributors are NOT RESPONSIBLE for ANY DAMAGE this causes to your PC." -ForegroundColor Yellow

$shouldProcessStart = YesNoQuestions -Question "Have you read and agree to the warnings and wish to start this program?"

if ($shouldProcessStart) {
    # Main code

    # Ask to create a restore point
    $sysRestore = YesNoQuestions -Question "Make a System Restore point?"
    if ($sysRestore) {
        Checkpoint-Computer -Description "PreDebloatio" -RestorePointType "MODIFY_SETTINGS"
        Write-Host "Restore point created. Find the 'PreDebloatio' point if any errors occur." -ForegroundColor Blue
    }

    Write-Host "The process is starting. Please wait a few minutes. Some functionality may break during the process; it's best to just not use this device until the process has completed." -ForegroundColor Blue

    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0
    Write-Host "Turned off Widgets" -ForegroundColor Green

    Get-AppxPackage -AllUsers | Remove-AppxPackage


}
else {
    exit
}