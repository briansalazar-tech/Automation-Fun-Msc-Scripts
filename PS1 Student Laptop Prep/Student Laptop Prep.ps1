Clear-Host

$CompInfo = Get-ComputerInfo
$Man = $CompInfo.CsManufacturer
$Model = $CompInfo.CsModel

#Launch Winver and systems properties window. User profiles deleted in advanced tab
sysdm.cpl
winver.exe

#ProBook x360 11 G3 BIOS Update in a folder titled 'x360 11 G3 Bios'
if ($Model -eq 'HP ProBook x360 11 G3 EE') {
    Write-Host "$Man $Model driver update launched."
    Invoke-Item -Path ".\x360 11 G3 Bios\bios01.11.exe"
}

#ProBook x360 11 G4 BIOS Update in a folder titeled 'x360 11 G4 Bios'
elseif ($Model -eq 'HP ProBook x360 11 G4 EE') {
    Write-Host "$Man $Model driver update launched."
    Invoke-Item -Path ".\x360 11 G4 Bios\bios01.06.exe"
}


#Script does not have BIOS update for model
else {
    Write-Host "No drivers on hand for $Man $Model on flashdrive."
}

Read-Host -Prompt "Script is finished running. Press Enter key to exit"