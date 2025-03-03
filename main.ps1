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

Write-Host "DEBLOATIO | v0.0.0"
Write-Host "WARNING | This is alpha software, which means it is EXTREMELY UNSTABLE. Recommended for testing only on a VIRTUAL MACHINE or A PC WHICH YOU DON'T HAVE IMPORTANT DATA ON." -ForegroundColor Yellow
Write-Host "WARNING | Creator or contributors are NOT RESPONSIBLE for ANY DAMAGE this causes to your PC." -ForegroundColor Yellow
$sysRestore = YesNoQuestions -Question "Make a System Restore point?"
if ($sysRestore) {
    Checkpoint-Computer -Description "DebloatioRP" -RestorePointType "MODIFY_SETTINGS"
}
$shouldProcessStart = YesNoQuestions -Question "Read all the warnings related to the program and agree?"

if ($shouldProcessStart) {
    Get-AppxPackage | Remove-AppxPackage
}
else {
    exit
}