@echo off
setlocal

REM Folder tymczasowy dla pobranych plików
set TEMP_DIR=%TEMP%\installers
mkdir %TEMP_DIR%

REM Definiowanie URL do instalatorów
set URL_CHROME=https://dl.google.com/chrome/install/375.126/chrome_installer.exe
set URL_FIREFOX=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US
set URL_ACROBAT=https://get.adobe.com/reader/download/?installer=Reader_DC_2021.007.20099_English_for_Windows&stype=8212
set URL_7ZIP=https://www.7-zip.org/a/7z1900-x64.exe
set URL_LIBREOFFICE=https://download.documentfoundation.org/libreoffice/stable/7.4.1/win/x86_64/LibreOffice_7.4.1_Win_x64.msi

REM Definiowanie ścieżek do pobranych instalatorów
set OUTPUT_CHROME=%TEMP_DIR%\chrome_installer.exe
set OUTPUT_FIREFOX=%TEMP_DIR%\firefox_installer.exe
set OUTPUT_ACROBAT=%TEMP_DIR%\acrobat_installer.exe
set OUTPUT_7ZIP=%TEMP_DIR%\7zip_installer.exe
set OUTPUT_LIBREOFFICE=%TEMP_DIR%\libreoffice_installer.msi

REM Pobieranie instalatorów
echo Pobieranie Google Chrome...
curl -L %URL_CHROME% -o %OUTPUT_CHROME%
echo Pobieranie Mozilla Firefox...
curl -L %URL_FIREFOX% -o %OUTPUT_FIREFOX%
echo Pobieranie Adobe Acrobat Reader...
curl -L %URL_ACROBAT% -o %OUTPUT_ACROBAT%
echo Pobieranie 7zip...
curl -L %URL_7ZIP% -o %OUTPUT_7ZIP%
echo Pobieranie LibreOffice...
curl -L %URL_LIBREOFFICE% -o %OUTPUT_LIBREOFFICE%

REM Instalacja programów
echo Instalowanie Google Chrome...
start /wait %OUTPUT_CHROME% /silent /install
echo Instalowanie Mozilla Firefox...
start /wait %OUTPUT_FIREFOX% -ms
echo Instalowanie Adobe Acrobat Reader...
start /wait %OUTPUT_ACROBAT% /sAll
echo Instalowanie 7zip...
start /wait %OUTPUT_7ZIP% /S
echo Instalowanie LibreOffice...
start /wait msiexec /i %OUTPUT_LIBREOFFICE% /quiet

REM Usuwanie pobranych instalatorów
echo Usuwanie pobranych plików...
del /Q %TEMP_DIR%\*

REM Usuwanie tymczasowego folderu
rd /S /Q %TEMP_DIR%

echo Instalacja zakończona.
pause
