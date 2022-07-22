robocopy .\original\extracted\00_GMV .\patched\en\cpks\00_GMV /E
robocopy .\original\extracted\PHOTOKANOKDLC001 .\patched\en\cpks\PHOTOKANOKDLC001 /E
robocopy .\original\extracted\PHOTOKANOKDLC002 .\patched\en\cpks\PHOTOKANOKDLC002 /E
robocopy .\original\extracted\PHOTOKANOKDLC003 .\patched\en\cpks\PHOTOKANOKDLC003 /E
robocopy .\original\extracted\PHOTOKANOKDLC004 .\patched\en\cpks\PHOTOKANOKDLC004 /E
robocopy .\original\extracted\PHOTOKANOKDLC005 .\patched\en\cpks\PHOTOKANOKDLC005 /E
robocopy .\original\extracted\PHOTOKANOKDLC006 .\patched\en\cpks\PHOTOKANOKDLC006 /E

node ./scripts/patcher.mjs en
if %errorlevel% neq 0 exit /b %errorlevel%

copy /y .\original\PCSG00139_patch\eboot.bin .\patched\en\rePatch\PCSG00139\eboot.bin
vita-elf-inject .\patched\en\elf\eboot.bin.elf .\patched\en\rePatch\PCSG00139\eboot.bin
if %errorlevel% neq 0 exit /b %errorlevel%

node ./scripts/gfx-converter.mjs en
if %errorlevel% neq 0 exit /b %errorlevel%

copy /y .\cpks\00_GMV.csv .\patched\en\cpks\00_GMV.csv
cpkmakec.exe 00_GMV.csv 00_GMV.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\00_GMV.cpk .\patched\en\rePatch\PCSG00139\media\00_GMV.cpk

copy /y .\cpks\PHOTOKANOKDLC001.csv .\patched\en\cpks\PHOTOKANOKDLC001.csv
cpkmakec.exe PHOTOKANOKDLC001.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC001\data.cpk

copy /y .\cpks\PHOTOKANOKDLC002.csv .\patched\en\cpks\PHOTOKANOKDLC002.csv
cpkmakec.exe PHOTOKANOKDLC002.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC002\data.cpk

copy /y .\cpks\PHOTOKANOKDLC003.csv .\patched\en\cpks\PHOTOKANOKDLC003.csv
cpkmakec.exe PHOTOKANOKDLC003.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC003\data.cpk

copy /y .\cpks\PHOTOKANOKDLC004.csv .\patched\en\cpks\PHOTOKANOKDLC004.csv
cpkmakec.exe PHOTOKANOKDLC004.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC004\data.cpk

copy /y .\cpks\PHOTOKANOKDLC005.csv .\patched\en\cpks\PHOTOKANOKDLC005.csv
cpkmakec.exe PHOTOKANOKDLC005.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC005\data.cpk

copy /y .\cpks\PHOTOKANOKDLC006.csv .\patched\en\cpks\PHOTOKANOKDLC006.csv
cpkmakec.exe PHOTOKANOKDLC006.csv data.cpk -dir=.\patched\en\cpks\ -align=2048 -mode=FILENAMEIDGROUP -forcecompress
move /y .\patched\en\cpks\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC006\data.cpk

#rmdir /q /s .\patched\en\cpks\00_GMV
del /F /Q /S .\release\en
xdelta -e -s .\original\PCSG00139\eboot.bin .\patched\en\rePatch\PCSG00139\eboot.bin .\release\en\eboot.xdelta
xdelta -e -s .\original\PCSG00139\media\00_GMV.cpk .\patched\en\rePatch\PCSG00139\media\00_GMV.cpk .\release\en\00_GMV.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC001\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC001\data.cpk .\release\en\PHOTOKANOKDLC001.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC002\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC002\data.cpk .\release\en\PHOTOKANOKDLC002.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC003\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC003\data.cpk .\release\en\PHOTOKANOKDLC003.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC004\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC004\data.cpk .\release\en\PHOTOKANOKDLC004.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC005\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC005\data.cpk .\release\en\PHOTOKANOKDLC005.xdelta
xdelta -e -s .\original\PCSG00139_addc\PHOTOKANOKDLC006\data.cpk .\patched\en\reAddcont\PCSG00139\PHOTOKANOKDLC006\data.cpk .\release\en\PHOTOKANOKDLC006.xdelta

pause