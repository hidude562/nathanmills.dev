$host.UI.RawUI.WindowTitle = "NandN Game Library"
$client = new-object System.Net.WebClient
$user = [System.Environment]::UserName
$NandNCommonsData = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data"
$NandNCommonsShortcuts = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\shortcuts"
$NandNCommonsUpdate = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update"
$NandNCommonsUpdateGame = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\gameUpdateData"
$NandNCommonsUpdateLauncher = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData"
$NandNCommons = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary"
$NandNupdate = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update"
$path = "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData\NandNLibrary.ps1"


Write-Host "Checking for needed NandNLibrary Folders and Files."

if (Test-Path $NandNCommons){

} else {
    Write-Host "Missing NandN Library commons installation or missing folders. Reacquiring commons."
    New-Item -Force -Path C:\NandNProcesses\update -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/m6d8u6cn07qr8wx/NandNLibrary.zip?dl=1","C:\NandNProcesses\update\NandNLibrary.zip")
    Expand-Archive C:\NandNProcesses\update\NandNLibrary.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData -Force
    Remove-Item C:\NandNProcesses\update\NandNLibrary.zip
    Move-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData\NandNLibrary.lnk" -Destination "C:\Users\$user\Desktop" -Force
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\ -ItemType Directory
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data -ItemType Directory
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\shortcuts -ItemType Directory
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update -ItemType Directory
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData -ItemType Directory
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\gameUpdateData -ItemType Directory
    New-Item -Force -Path C:\NandNProcesses -ItemType Directory
    Write-Host "Installed all needed NandN Library components."
}
if (Test-Path $NandNCommonsData) {

} else {
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data -ItemType Directory
}
if (Test-Path $NandNCommonsShortcuts) {

} else {
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\shortcuts -ItemType Directory
}
if (Test-Path $NandNCommonsUpdate) {

} else {
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update -ItemType Directory
}
if (Test-Path $NandNCommonsUpdateGame) {

} else {
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\gameUpdateData -ItemType Directory
}
if (Test-Path $NandNCommonsUpdateLauncher) {
    Write-Host "All NandN Library Commons found. Starting NandN Library."
}
else {
    New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData -ItemType Directory
}

Write-Host "
                     
 | \ | |               | | \ | |
 |  \| | __ _ _ __   __| |  \| |
 | .   |/ _  | '_ \ / _  | .   |
 | |\  | (_| | | | | (_| | |\  |
 |_| \_|\__,_|_| |_|\__,_|_| \_|
	      v0.4		"
Write-Host ""
Write-Host "Press 1 and enter to install games, press 2 and enter to launch games, press 3 and enter to uninstall games."
$inputChoice = Read-Host

if ($inputChoice -eq 1){
Write-Host ""
Write-Host "Welcome to the NandN Game Library. The table below lists a number next to installable games. Type the number and enter to install it."
Write-Host "1 - Update Launcher (Run once a week to get most updated list of games)"
Write-Host "2 - Mario Kart (File Size: 2.6 Gigabytes)"
Write-Host "3 - Unciv (File Size: 83 Megabytes)"	  
Write-Host "4 - The Elder Scrolls: Daggerfall (Currently game does not work, File Size: 255 Megabytes)"
Write-Host "5 - Minecraft (Will install in seperate window, File Size: 692 Megabytes)"
Write-Host "6 - Fallout 2 (Game currently does not work, File Size: 571 Megabytes)"
Write-Host "7 - Barotrauma (File Size: 891 Megabytes)"
Write-Host "8 - Project Zomboid (File Size: 6.8 Gigabytes)"


$installChoice = Read-Host
Write-Host ""
Write-Host "You chose to install option" $installChoice

if($installChoice -eq 1){
    Write-Host ""
	Write-Host "Downloading NandN Library Update."
    New-Item -Force -Path C:\NandNProcesses\update -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/m6d8u6cn07qr8wx/NandNLibrary.zip?dl=1","C:\NandNProcesses\update\NandNLibrary.zip")
    Write-Host "Installing NandN Library Update"
    Expand-Archive C:\NandNProcesses\update\NandNLibrary.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData -Force
    Remove-Item C:\NandNProcesses\update\NandNLibrary.zip
    Move-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\update\launcherUpdateData\NandNLibrary.lnk" -Destination "C:\Users\$user\Desktop" -Force
    Invoke-Expression $path
}elseif($installChoice -eq 2){
    Write-Host "Installing Mario Kart."
	$client.DownloadFile("https://www.dropbox.com/s/rm95ywz0detzkp6/MarioKart.zip?dl=1","C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart.zip")
	New-Item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart -ItemType Directory
	Expand-Archive C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart
	Remove-Item -LiteralPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart.zip -Force -Recurse
	Copy-item -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart\MarioKart\Dolphin-x64\Dolphin.exe -Destination C:\Users\$user\Desktop
    cd C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart\MarioKart\Dolphin-x64
    start Dolphin.exe
    cd C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart\MarioKart
    start "README SETUP GUIDE.txt"
    Invoke-Expression $path
} elseif($installChoice -eq 3){
    Write-Host "Installing Java."
	New-Item -Force -Path C:\NandNProcesses\Java -ItemType Directory
	New-item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Java -ItemType Directory
	$client.DownloadFile("https://www.dropbox.com/s/khrkaqnvg8xiux7/jdk-17.0.5_windows-x64_bin.zip?dl=1","C:\NandNProcesses\Java\jdk-17.0.5_windows-x64_bin.zip")
	Expand-Archive C:\NandNProcesses\Java\jdk-17.0.5_windows-x64_bin.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Java
	Remove-Item C:\NandNProcesses\Java\jdk-17.0.5_windows-x64_bin.zip
	Remove-Item C:\NandNProcesses\Java -Force -Recurse
	Write-Host "Installed Java."
	Write-Host "Installing Unciv."
	New-Item -Force -Path C:\NandNProcesses\Unciv -ItemType Directory
	New-item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv -ItemType Directory
	$client.DownloadFile("https://www.dropbox.com/s/iafja8hz7wn4n0g/unciv-windows64.zip?dl=1","C:\NandNProcesses\Unciv\unciv-windows64.zip")
	Expand-Archive C:\NandNProcesses\Unciv\unciv-windows64.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv
	Remove-Item C:\NandNProcesses\Unciv\unciv-windows64.zip
	Write-Host "Installed Unciv."
	Write-Host "Creating Unciv Desktop Icon and Launching Unciv."
	Copy-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv\unciv-windows64\Unciv.exe" -Destination "C:\Users\$user\Desktop"
	cd C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv\unciv-windows64
	start Unciv.exe
    Invoke-Expression $path
} elseif($installChoice -eq 4){
    Write-Host "Installing The Elder Scrolls: Daggerfall"
    New-Item -Force -Path C:\NandNProcesses\Daggerfall -ItemType Directory
    New-item -Force -Path C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/qbqmmeq4qp0gia0/TES%20Daggerfall.zip?dl=1","C:\NandNProcesses\Daggerfall\TES%20Daggerfall.zip")
    Expand-Archive C:\NandNProcesses\Daggerfall\TES%20Daggerfall.zip -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\ -Force
    Remove-Item C:\NandNProcesses\Daggerfall\TES%20Daggerfall.zip
    Write-Host "Installed The Elder Scrolls: Daggerfall."
    Copy-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\TES Daggerfall\Daggerfall (Full Screen).bat" -Destination "C:\Users\$user\Desktop"
    $client.DownloadFile("https://www.dropbox.com/s/ws4bsn1qx8ytkg3/SDL_net.zip?dl=1","C:\NandNProcesses\Daggerfall\SDL_net.zip")
    Expand-Archive "C:\NandNProcesses\Daggerfall\SDL_net.zip" -DestinationPath "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\TES Daggerfall\DOSBox-0.74" -Force
    Remove-Item C:\NandNProcesses\Daggerfall -Force -Recurse
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\TES Daggerfall"
    start "Daggerfall (Full Screen).bat"
    Invoke-Expression $path
}  elseif($installChoice -eq 5){
    Write-Host "Installing Minecraft"
    $client.DownloadFile("https://www.dropbox.com/s/m8a3mfr514khde6/NoJava.zip?dl=1","C:\Users\$user\Downloads\NoJava.zip")
    Expand-Archive C:\Users\$user\Downloads\NoJava.zip -DestinationPath C:\Users\$user\Downloads
    Remove-item C:Users\$user\Downloads\NoJava.zip -Force -Recurse
    cd "C:\Users\$user\Downloads"
    start "Double-click me to install.lnk"
    Invoke-Expression $path
} elseif($installChoice -eq 6){
    Write-Host "Installing Fallout 2"
    New-Item -Force -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Fallout2\" -ItemType Directory
    New-Item -Force -Path "C:\NandNProcesses\Fallout 2" -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/3vd64lkarp3s41p/Fallout%202.zip?dl=1","C:\NandNProcesses\Fallout 2\Fallout 2.zip")
    Expand-Archive "C:\NandNProcesses\Fallout 2\Fallout 2.zip" -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Fallout2\
    Remove-Item "C:\NandNProcesses\Fallout 2\Fallout 2.zip"
    Remove-Item "C:\NandNProcesses\Fallout 2" -Force -Recurse
    Copy-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Fallout2\Fallout 2\Fallout2Launcher" -Destination "C:\Users\$user\Desktop"
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Fallout2\Fallout 2"
    start "Fallout2Launcher.exe"
    Invoke-Expression $path
} elseif($installChoice -eq 7){
    Write-Host "Installing Barotrauma"
    New-Item -Force -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\" -ItemType Directory
    New-Item -Force -Path "C:\NandNProcesses\Barotrauma" -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/3kc9e1t3jhe1vuw/Barotrauma.zip?dl=1","C:\NandNProcesses\Barotrauma\Barotrauma.zip")
    Expand-Archive "C:\NandNProcesses\Barotrauma\Barotrauma.zip" -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\
    Remove-Item "C:\NandNProcesses\Barotrauma\Barotrauma.zip"
    Remove-Item "C:\NandNProcesses\Barotrauma" -Force -Recurse
    Copy-Item -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\Barotrauma\Barotrauma.exe" -Destination "C:\Users\$user\Desktop"
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\Barotrauma\"
    start "Barotrauma.exe"
    Invoke-Expression $path
} elseif($installChoice -eq 8){
    Write-Host "Installing Project Zomboid"
    New-Item -Force -Path "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Zomboid\" -ItemType Directory
    New-Item -Force -Path "C:\NandNProcesses\Zomboid" -ItemType Directory
    $client.DownloadFile("https://www.dropbox.com/s/j8ao6j1kqwc07fl/ProjectZomboid.zip?dl=1","C:\NandNProcesses\Zomboid\ProjectZomboid.zip")
    Expand-Archive "C:\NandNProcesses\Zomboid/ProjectZomboid.zip" -DestinationPath C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Zomboid\
    Remove-Item "C:\NandNProcesses\Zomboid\ProjectZomboid.zip"
    Remove-Item "C:\NandNProcesses\Zomboid" -Force -Recurse
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Zomboid\ProjectZomboid\"
    start "ProjectZomboid64.exe"
}
} elseif($inputChoice -eq 2){
    Write-Host ""
    Write-Host "Press 2 to launch Mario Kart"
    Write-Host "Press 3 to launch Unciv"
    Write-Host "Press 4 to launch Barotrauma"
    Write-Host "Press 5 to launch Daggerfall"
    Write-Host "Press 6 to launch Project Zomboid"

    $launchChoice = Read-Host

    if ($launchChoice -eq 1){
    cd C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart\MarioKart\Dolphin-x64
    start Dolphin.exe
    Invoke-Expression $path
    } elseif ($launchChoice -eq 2){
    cd C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv\unciv-windows64
	start Unciv.exe
    Invoke-Expression $path
    } elseif ($launchChoice -eq 3){
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\Barotrauma\"
    start "Barotrauma.exe"
    Invoke-Expression $path
    } elseif ($launchChoice -eq 4){
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\TES Daggerfall"
    start "Daggerfall (Full Screen).bat"
    Invoke-Expression $path
    } elseif($launchChoice -eq 5){
    cd "C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Zomboid\ProjectZomboid\"
    start "ProjectZomboid64.exe"
    Invoke-Expression $path
    }
} elseif($inputChoice -eq 3){
    Write-Host "Press 1 to uninstall NandN Library (Will uninstall all games)"
    Write-Host "Press 2 to uninstall Mario Kart"
    Write-Host "Press 3 to uninstall Unciv"
    Write-Host "Press 4 to uninstall The Elder Scrolls: Daggerfall"
    Write-Host "Press 5 to uninstall Fallout 2"
    Write-Host "Press 6 to uninstall Barotrauma"
    Write-Host "Press 7 to uninstall Project Zomboid"

    $uninstallChoice = Read-Host

    if($uninstallChoice -eq 1){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\ -Force
    Remove-Item "C:\Users\$user\Desktop" -Force
    }elseif($uninstallChoice -eq 2){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\MarioKart\ -Force
    }elseif($uninstallChoice -eq 3){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Unciv\ -Force 
    }elseif($uninstallChoice -eq 4){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Daggerfall\ -Force
    }elseif($uninstallChoice -eq 5){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Fallout2\ -Force
    elseif($uninstallChoice -eq 6){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Barotrauma\ -Force
    }elseif($uninstallChoice -eq 7){
    Remove-Item C:\Windows\System32\Microsoft\Crypto\RSA\MachineKeys\NandNLibrary\data\Zomboid\ -Force
    }
}
}


