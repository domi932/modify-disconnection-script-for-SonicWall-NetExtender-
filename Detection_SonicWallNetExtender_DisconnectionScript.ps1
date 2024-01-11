#Detect if DisconnectionScript of SonicWallNetExtender is already modified

$LocalAppdataPathNetExtender = "$env:LOCALAPPDATA\SonicWall\NetExtender"

if (Test-Path $LocalAppdataPathNetExtender){
    $PathDisconnectScript = $LocalAppdataPathNetExtender + "\NxDisconnect.bat"

    if (Test-Path ($PathDisconnectScript)){
        #Check if RegKey in DisconnectionScript is set
        $ContentDisconnectionScript = (Get-Content -Path $PathDisconnectScript | Where-Object { $_.Contains('reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /f /v "DefaultConnectionSettings" /t REG_BINARY /d "460000000400000009000000000000000000000026000000687474703A2F2F7777772E78787878782E636F6D3A313233342F73616D706C6553637269707400000000000000000000000000000000"')}).Length
        if ($ContentDisconnectionScript -eq 0) {
            #Start remediation Script
            Write-Host("DisconnectionScript has not yet been modified. Start remediation Script")
            Exit 1
        }
        else{
            Write-Host("Script already updated")
            Exit 0
        }
    }
    else{
        Write-Host("DisconnectionScript not available. Start remediation Script")
        Exit 1
    }
}