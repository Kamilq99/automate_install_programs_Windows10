@echo off
setlocal

REM Folder tymczasowy dla pobranych plików
set TEMP_DIR=%TEMP%\installers
mkdir %TEMP_DIR%

REM Definiowanie URL do instalatorów
set URL_CHROME=https://dl.google.com/chrome/install/375.126/chrome_installer.exe
set URL_FIREFOX=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US
set URL_7ZIP=https://www.7-zip.org/a/7z1900-x64.exe

REM Definiowanie ścieżek do pobranych instalatorów
set OUTPUT_CHROME=%TEMP_DIR%\chrome_installer.exe
set OUTPUT_FIREFOX=%TEMP_DIR%\firefox_installer.exe
set OUTPUT_7ZIP=%TEMP_DIR%\7zip_installer.exe


REM Pobieranie instalatorów
echo Pobieranie Google Chrome...
curl -L %URL_CHROME% -o %OUTPUT_CHROME%
echo Pobieranie Mozilla Firefox...
curl -L %URL_FIREFOX% -o %OUTPUT_FIREFOX%
echo Pobieranie 7zip...
curl -L %URL_7ZIP% -o %OUTPUT_7ZIP%

REM Instalacja programów
echo Instalowanie Google Chrome...
start /wait %OUTPUT_CHROME% /silent /install
echo Instalowanie Mozilla Firefox...
start /wait %OUTPUT_FIREFOX% -ms
echo Instalowanie 7zip...
start /wait %OUTPUT_7ZIP% /S

REM Usuwanie pobranych instalatorów
echo Usuwanie pobranych plików...
del /Q %TEMP_DIR%\*

REM Usuwanie tymczasowego folderu
rd /S /Q %TEMP_DIR%

echo Instalacja zakończona.
pause
