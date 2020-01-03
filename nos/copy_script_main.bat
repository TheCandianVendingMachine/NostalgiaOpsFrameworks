@echo off
rem This is to copy the script_main.hpp header to all subfolders. ARMA 2 sucks and you cant #include backward so we copy the file each time we modify it manually
for /r /d %%I in (*) do xcopy "script_main.hpp" "%%~fsI" /K /Y