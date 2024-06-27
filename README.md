# Skrypt Batch do Automatycznej Instalacji Oprogramowania na Windows 10

## Opis

Niniejszy skrypt batch automatycznie pobiera i instaluje na komputerze z systemem Windows 10 następujące programy:
- Google Chrome
- Mozilla Firefox
- Adobe Acrobat Reader
- 7zip
- LibreOffice

Skrypt wykonuje następujące kroki:

1. **Tworzenie folderu tymczasowego**: 
   Skrypt tworzy tymczasowy folder w katalogu `%TEMP%\installers`, gdzie zostaną pobrane instalatory.

2. **Definiowanie URL i ścieżek do instalatorów**: 
   Skrypt definiuje zmienne zawierające URL do najnowszych wersji instalatorów oraz ścieżki, gdzie te instalatory zostaną zapisane.

3. **Pobieranie instalatorów przy użyciu `curl`**: 
   Skrypt używa narzędzia `curl` do pobrania instalatorów z internetu i zapisania ich w tymczasowym folderze.

4. **Instalacja programów w trybie silent**: 
   Skrypt uruchamia pobrane instalatory z odpowiednimi przełącznikami, aby instalacja przebiegła automatycznie, bez interakcji użytkownika:
   - Google Chrome: `/silent /install`
   - Mozilla Firefox: `-ms`
   - 7zip: `/S`

5. **Usuwanie pobranych plików i tymczasowego folderu**: 
   Po zakończeniu instalacji skrypt usuwa wszystkie pobrane pliki oraz tymczasowy folder, aby zachować porządek na dysku.

6. **Kończenie skryptu**: 
   Skrypt wyświetla komunikat o zakończeniu instalacji i zatrzymuje się, aby użytkownik mógł zobaczyć wynik.