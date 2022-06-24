@echo off
rem 使い方：Release.bat [バージョン数字]
if not exist Win32\Release\TimeCalculator.exe (
    echo 32.txt  is Not Found.
) else (
    copy /Y Win32\Release\TimeCalculator.exe TimeCalculator.exe
    "C:\Program Files\7-Zip\7z.exe" a Win32\ReleaseZipFiles\TimeCalculator_%1.zip TimeCalculator.exe
    del TimeCalculator.exe
)


if not exist TimeCalculator_Readme.txt (
    echo TimeCalculator_Readme.txt  is Not Found.
) else (
    "C:\Program Files\7-Zip\7z.exe" a Win32\ReleaseZipFiles\TimeCalculator_%1.zip TimeCalculator_Readme.txt
)

echo 何かキーを押すと終了します
pause
