@echo off
rem Build AdminHelper.exe from Launcher.ahk (needs AutoHotkey v1.1 with the Ahk2Exe compiler installed)
cd /d "%~dp0"
set "A2E="
for %%P in ("%ProgramFiles%\AutoHotkey\Compiler\Ahk2Exe.exe" "%ProgramFiles(x86)%\AutoHotkey\Compiler\Ahk2Exe.exe" "%LocalAppData%\Programs\AutoHotkey\Compiler\Ahk2Exe.exe") do if exist %%P set "A2E=%%~P"
if "%A2E%"=="" (
    echo Ahk2Exe.exe not found. Install AutoHotkey v1.1 with the compiler, or compile Launcher.ahk by hand:
    echo   Ahk2Exe: Source = Launcher.ahk, Base File = Unicode 32-bit, Convert
    pause
    exit /b 1
)
for %%I in ("%A2E%") do set "CDIR=%%~dpI"
set "BIN=%CDIR%Unicode 32-bit.bin"
if exist "%BIN%" (
    "%A2E%" /in "Launcher.ahk" /out "AdminHelper.exe" /bin "%BIN%"
) else (
    "%A2E%" /in "Launcher.ahk" /out "AdminHelper.exe"
)
if exist "AdminHelper.exe" (
    echo Done: AdminHelper.exe
) else (
    echo Build failed. Try compiling Launcher.ahk by hand in the Ahk2Exe window.
)
pause
