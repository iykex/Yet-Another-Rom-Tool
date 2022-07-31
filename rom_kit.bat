@shift /0
@echo off
title Yet Another Rom Tool(1.0)
Setlocal EnableDelayedExpansion
:error
:skipme

set logdate=%DATE:~0,3%%DATE:~3,12%
set logtime=%TIME:~0,4%%TIME:~4,24%
echo.

:check
::Section for checking recent activity'
if not exist %temp% goto home
if exist %temp%\date_log.txt goto _recent
set activity=" "
echo %date% >> %temp%\date_log.txt
set recent=
goto home

:_recent
if exist %temp%\date_log.txt (
set /p recent=<%temp%\date_log.txt
)
del %temp%\date_log.txt
set "activity=Today's Date:" 
set "activitytime=Time :"
echo %date% >> %temp%\date_log.txt
goto home

::::::::::::::::::::::::::::::::::::::

:home
cls
mode con:cols=90 lines=45
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                 {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo                                Toolbox : pick a choice
bin\utils\ctext "                            {0b}=============================={0b}{\n}"
echo.
bin\utils\ctext "                               {0a}[c] *Cleanup!!!{0e} // {0c}[e] *Exit{0e}{\n}"
echo.
bin\utils\cecho   {0b}=========={#}
echo.
bin\utils\cecho   {0b}   AUTO  {#}
echo.
bin\utils\cecho   {0b}=========={#}
echo.
bin\utils\ctext "    {0e}[a] *Unpack ROM.zip{0e}       {0e}[r] *Repack ROM.zip{0e}{\n}"
echo.
bin\utils\cecho   {0b}=========={#}
echo.
bin\utils\cecho   {0b}  MANUAL {#}
echo.
bin\utils\cecho   {0b}=========={#}
echo.
bin\utils\ctext "    {0e}[1] *Unpack system.img{0e}    {0e}[3] *Unpack new.dat{0e}    {0e}[5] *Unpack new.dat.br{0e}    {0e}[7] *Unpack vendor{0e}{\n}"
echo.
bin\utils\ctext "    {0f}        --------{0f}              {0f}  --------{0f}                {0f}  --------{0f}              {0f}  --------{0f}{\n}"
echo.
bin\utils\ctext "    {0e}[2] *Repack system.img{0e}    {0e}[4] *Repack new.dat{0e}    {0e}[6] *Repack new.dat.br{0e}    {0e}[8] *Repack vendor{0e}{\n}"
echo.
echo.
bin\utils\cecho {0f}   
set /p web=    Type option *: 
bin\utils\cecho {0f} {#} 
echo.
echo. 
if "%web%"=="a" goto unpack_rom
if "%web%"=="r" goto repack_rom
if "%web%"=="1" goto unpack_image
if "%web%"=="2" goto repack_image
if "%web%"=="3" goto unpack_dat
if "%web%"=="4" goto repack_dat
if "%web%"=="5" goto unpack_br
if "%web%"=="6" goto repack_br
if "%web%"=="c" goto cleanup
if "%web%"=="e" exit
goto home 

echo.

::::::::::::::::::::::::::::::::::::::

:cleanup
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Cleaning up...{#}
echo.
echo.
if exist auto_unpack\extracted rd /s /q auto_unpack\extracted
if exist auto_unpack\tmp rd /s /q auto_unpack\tmp
if exist auto_unpack\rom.zip del auto_unpack\rom.zip
if exist auto_unpack\repack_done\new_rom.zip del auto_unpack\repack_done\new_rom.zip
if exist manual_unpack\place_* (
bin\utils\busybox rm -rf auto_unpack\extracted\
bin\utils\busybox rm -rf auto_unpack\repack_done\
bin\utils\busybox rm -rf manual_unpack\extracted\
bin\utils\busybox rm -rf manual_unpack\place_img_here\
bin\utils\busybox rm -rf manual_unpack\place_dat_here\
bin\utils\busybox rm -rf manual_unpack\place_br_here\
bin\utils\busybox rm -rf manual_unpack\place_vendor_here\
bin\utils\busybox rm -rf manual_unpack\repack_done\
mkdir auto_unpack\extracted auto_unpack\repack_done manual_unpack\extracted manual_unpack\repack_done manual_unpack\place_br_here manual_unpack\place_dat_here manual_unpack\place_img_here manual_unpack\place_vendor_here
)
echo.
echo.
bin\utils\cecho {0a} - all files removed...[OK!]{#}
echo.
echo.
pause
goto home


::::::::::::::::::::::::::::::::::::::

:unpack_rom
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
bin\utils\cecho {0b} - Processing...{#}
echo.
echo.
if exist auto_unpack\extracted\tmp rd /s /q auto_unpack\extracted\tmp
if exist auto_unpack\extracted rd /s /q auto_unpack\extracted
if not exist auto_unpack\extracted\tmp mkdir auto_unpack\extracted\tmp
if not exist auto_unpack\extracted mkdir auto_unpack\extracted
if exist auto_unpack\rom.zip (
bin\utils\cecho {0b} - Unpacking Your ROM.zip!{#}
echo.
bin\utils\busybox unzip -o auto_unpack\rom.zip -d auto_unpack\extracted\tmp >nul
) else (
bin\utils\cecho {0c} - rom.zip 'not found!{#}
echo.
pause
goto home
)

if exist auto_unpack\extracted\tmp\system.new.dat.br (
bin\utils\cecho    {0b} - Unpack system.new.dat.br{#}
echo.
bin\utils\brotli -d auto_unpack\extracted\tmp\system.new.dat.br >nul
del auto_unpack\extracted\tmp\system.new.dat.br
)
if exist auto_unpack\extracted\tmp\vendor.new.dat.br (
bin\utils\cecho    {0b} - Unpack vendor.new.dat.br{#}
echo.
bin\utils\brotli -d auto_unpack\extracted\tmp\vendor.new.dat.br >nul
del auto_unpack\extracted\tmp\vendor.new.dat.br
)

if exist auto_unpack\extracted\tmp\system.new.dat (
bin\utils\cecho    {0b} - Unpack system.new.dat{#}
echo.
bin\utils\sdat2img auto_unpack\extracted\tmp\system.transfer.list auto_unpack\extracted\tmp\system.new.dat auto_unpack\extracted\tmp\system.img >nul 2>nul
del auto_unpack\extracted\tmp\system.new.dat
del auto_unpack\extracted\tmp\system.transfer.list
del auto_unpack\extracted\tmp\system.patch.dat
)

if exist auto_unpack\extracted\tmp\vendor.new.dat (
bin\utils\cecho    {0b} - Unpack vendor.new.dat{#}
echo.
bin\utils\sdat2img auto_unpack\extracted\tmp\vendor.transfer.list auto_unpack\extracted\tmp\vendor.new.dat auto_unpack\extracted\tmp\vendor.img >nul 2>nul
del auto_unpack\extracted\tmp\vendor.new.dat
del auto_unpack\extracted\tmp\vendor.transfer.list
del auto_unpack\extracted\tmp\vendor.patch.dat
)

if exist auto_unpack\extracted\tmp\system.img (
bin\utils\cecho    {0b} - Unpack system.img{#}
echo.
bin\utils\imgextractor auto_unpack\extracted\tmp\system.img auto_unpack\extracted\system >nul 2>nul
del auto_unpack\extracted\tmp\system.img
)

if exist auto_unpack\extracted\tmp\vendor.img (
bin\utils\cecho    {0b} - Unpack vendor.img{#}
echo.
bin\utils\imgextractor auto_unpack\extracted\tmp\vendor.img auto_unpack\extracted\vendor >nul 2>nul
del auto_unpack\extracted\tmp\vendor.img
)

mkdir auto_unpack\extracted\extra
set tmp=auto_unpack\extracted\tmp
if exist %tmp%\system_file_contexts move /y %tmp%\system_file_contexts auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\vendor_file_contexts move /y %tmp%\vendor_file_contexts auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\system_fs_config move /y %tmp%\system_fs_config auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\vendor_fs_config move /y %tmp%\vendor_fs_config auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\boot.img move /y %tmp%\boot.img auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\dtbo.img move /y %tmp%\dtbo.img auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\vbmeta.img move /y %tmp%\vbmeta.img auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\compatibility.zip move /y %tmp%\compatibility.zip auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\compatibility_no_nfc.zip move /y %tmp%\compatibility_no_nfc.zip auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\install move /y %tmp%\install auto_unpack\extracted\extra\install  >nul 2>nul
if exist %tmp%\firmware-update move /y %tmp%\firmware-update auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\META-INF move /y %tmp%\META-INF auto_unpack\extracted\extra\  >nul 2>nul
if exist %tmp%\system move /y %tmp%\system auto_unpack\extracted\extra\system2\  >nul 2>nul

if exist auto_unpack\extracted\system (
echo.
bin\utils\cecho    {0b} - ROM Unpacked into folder "/extracted"{#}
echo.
echo.
bin\utils\cecho    {0b} - ROM Info:{#}
echo.
echo.
bin\utils\busybox sh ./bin/utils/utility_auto.sh rom-info
bin\utils\busybox sh ./bin/utils/utility_auto.sh rom-info >> auto_unpack/extracted/rom-info
echo.
)
if exist auto_unpack\extracted rd /s /q auto_unpack\extracted\tmp
echo.
echo.
pause
goto home
::::::::::::::::::::::::::::::::::::::

:repack_rom
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
bin\utils\cecho {0b} - Processing...{#}
echo.
echo.
if exist auto_unpack\extracted\system (
bin\utils\busybox sh ./bin/utils/utility_auto.sh rom-info
echo.
)
if exist auto_unpack\new_rom.zip del auto_unpack\new_rom.zip
if exist auto_unpack\tmp rd /s /q auto_unpack\tmp
if exist auto_unpack\extracted\tmp rd /s /q auto_unpack\extracted\tmp
if not exist auto_unpack\extracted\tmp mkdir auto_unpack\extracted\tmp

if exist auto_unpack\extracted\system_size.txt (
bin\utils\cecho {0b} - Repacking to ROM.zip!{#}
echo.
)

set /p systemsize=<"auto_unpack\extracted\system_size.txt"
bin\utils\cecho    {0b} - Repack System Image!{#}
echo.
bin\utils\make_ext4fs -s -T 0 -S auto_unpack\extracted\extra\system_file_contexts -C auto_unpack\extracted\extra\system_fs_config -l %systemsize% -a system auto_unpack\extracted\tmp\system.new.img auto_unpack\extracted\system\ >nul

bin\utils\cecho    {0b} - Repack Vendor-Image!{#}
echo.
if not exist auto_unpack\extracted\extra\vendor_file_contexts (
echo.
bin\utils\ctext "{0c}    !# SKIPPING VENDOR BUILD -- 'vendor_file_contexts' not exist,{0c}{\n}
bin\utils\ctext "{0c}    add a prebuilt 'vendor_file_contexts(file_contexts)'{0c}{\n}
bin\utils\ctext "{0c}    & continue or manually add a compiled vendor.new.dat(.br){0c}{\n}"
bin\utils\ctext "{0c}    to your ROM.zip when completed{0c}{\n}"
echo.
) else (
set /p vendorsize=<"auto_unpack\extracted\vendor_size.txt"
bin\utils\make_ext4fs -s -T 0 -S auto_unpack\extracted\extra\vendor_file_contexts -C auto_unpack\extracted\extra\vendor_fs_config -l %vendorsize% -a vendor auto_unpack\extracted\tmp\vendor.new.img auto_unpack\extracted\vendor\ >nul
)

if exist auto_unpack\extracted\tmp (
if exist auto_unpack\extracted\tmp\system.new.img (
bin\utils\cecho    {0b} - Repack to system.new.dat{#}
echo.
bin\utils\img2sdat auto_unpack\extracted\tmp\system.new.img -o auto_unpack\extracted\tmp -v 4 >nul 2>nul
del auto_unpack\extracted\tmp\system.new.img
)

if exist auto_unpack\extracted\tmp\vendor.new.img (
bin\utils\cecho    {0b} - Repacking to vendor.new.dat{#}
echo.
bin\utils\img2sdat auto_unpack\extracted\tmp\vendor.new.img -o auto_unpack\extracted\tmp -v 4 -p vendor >nul 2>nul
del auto_unpack\extracted\tmp\vendor.new.img
)

if exist auto_unpack\extracted\tmp\system.new.dat (
bin\utils\cecho    {0b} - Repacking to system.new.dat.br{#}
echo.
bin\utils\brotli -1 -j -w 24 auto_unpack\extracted\tmp\system.new.dat >nul 
)

if exist auto_unpack\tmp\vendor.new.dat (
bin\utils\cecho    {0b} - Repacking to vendor.new.dat.br{#}
echo.
bin\utils\brotli -1 -j -w 24 auto_unpack\extracted\tmp\vendor.new.dat >nul
)
)

if exist auto_unpack\extracted\tmp\system.new.dat.br (
echo.
bin\utils\cecho    {0b} - Finalizing...{#}
echo.
set tmp=auto_unpack\extracted\extra
set tmp1=auto_unpack\extracted\tmp
if exist %tmp%\extra\boot.img copy /y %tmp%\extra\boot.img %tmp1%\ >nul 2>nul
if exist %tmp%\extra\dtbo.img copy /y %tmp%\extra\dtbo.img %tmp1%\ >nul 2>nul
if exist %tmp%\extra\vbmeta.img copy /y %tmp%\extra\vbmeta.img %tmp1%\ >nul 2>nul
if exist %tmp%\extra\compatibility.zip copy /y %tmp%\extra\compatibility.zip %tmp1% >nul
if exist %tmp%\extra\compatibility_no_nfc.zip copy /y %tmp%\extra\compatibility_no_nfc.zip %tmp1% >nul
if exist %tmp%\extra\install xcopy /i /e /y %tmp%\extra\install %tmp%1\install >nul 2>nul
if exist %tmp%\extra\firmware-update xcopy /i /e %tmp%\extra\firmware-update %tmp1%\firmware-update >nul 2>nul
if exist %tmp%\extra\META-INF xcopy /i /e /y %tmp%\extra\META-INF %tmp1%\META-INF >nul 2>nul
if exist %tmp%\extra\system2 xcopy /i /e /y auto_unpack\extracted\system2 %tmp1%\system >nul 2>nul

bin\utils\cecho    {0b} - Zipping...{#}
bin\utils\7za a -tzip new_rom.zip ./auto_unpack/extracted/tmp/*  >nul 2>nul
)

@REM if exist auto_unpack\extracted\tmp\META-INF (
@REM bin\utils\cecho    {0b} - Zipping...{#}
@REM bin\utils\7za a -tzip new_rom.zip ./auto_unpack/extracted/tmp/*  >nul 2>nul
@REM )



if exist auto_unpack\extracted\tmp\new_rom.zip (
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
bin\utils\busybox mv auto_unpack\extracted\tmp\new_rom.zip auto_unpack\repack_done\ >nul 2>nul
echo.
bin\utils\cecho    {0b} Completed!{#}
echo.
bin\utils\cecho    {0b} ********* {#}
echo.
bin\utils\cecho    {0b} ROM Info:{#}
echo.
bin\utils\busybox sh ./bin/utils/utility_auto.sh rom-info
bin\utils\busybox sh ./bin/utils/utility_auto.sh rom-info >> auto_unpack/extracted/rom-info
echo.
echo.
bin\utils\cecho {0a} - "new_rom.zip" Baked! into folder "/repack_done"{#}
echo.
if exist auto_unpack\repack_done\new_rom.zip rd /s /q auto_unpack\extracted\tmp
echo.
echo.
echo.
pause
goto home
) else (
echo.
echo.
bin\utils\cecho    {0c} - Error!!{#}
echo.
echo.
pause
goto home
)


::::::::::::::::::::::::::::::::::::::

:unpack_image
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Unpack into "accessible system"{#}
echo.
echo.
if exist manual_unpack\extracted rd /s /q extracted
if not exist manual_unpack\extracted mkdir manual_unpack\extracted
if exist manual_unpack\place_img_here\system.img (
echo system.img file found
) else (
bin\utils\cecho {0c} - system.img not found in "place_img_here"{#}
echo.
echo.
echo.
pause
goto home
)

if exist manual_unpack\place_img_here\system.img (
bin\utils\cecho {0b} - Unpacking "system.img"{#}
echo.
bin\utils\imgextractor place_img_here\system.img extracted\system >nul 2>nul
)

set tmp=manual_unpack\place_img_here\
if exist %tmp%\system_file_contexts move /y %tmp%\system_file_contexts extracted\  >nul 2>nul
if exist %tmp%\system_fs_config move /y %tmp%\system_fs_config extracted\  >nul 2>nul
if exist %tmp%\system move /y %tmp%\system extracted\system2  >nul 2>nul

if exist manual_unpack\extracted\system (
bin\utils\cecho {0b} - "system.img" Unpack Done!{#}
echo.
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info >> maual_unpack/extracted/rom-info
echo.
)
if exist manual_unpack\extracted rd /s /q bin\tmp
echo.
echo.
set /p rmsysimg=_Do you want to remove old system.img [yes/no]? :  
echo.
if "%rmsysimg%"=="y" goto remove_img
if "%rmsysimg%"=="n" goto skip_del_img

:remove_img
if exist manual_unpack\place_img_here\system.img del manual_unpack\place_img_here\system.img
if not exist manual_unpack\place_img_here\system.img echo  checking...
if exist manual_unpack\place_img_here\system.raw.img del manual_unpack\place_img_here\system.raw.img
if not exist manual_unpack\place_img_here\system.raw.img echo  checking...
bin\utils\cecho {0e} - file removed!{#}
echo.
echo.
pause
goto home

:skip_del_img
if exist manual_unpack\place_img_here\system.raw.img del manual_unpack\place_img_here\system.raw.img
if not exist manual_unpack\place_img_here\system.raw.img echo 'nothing found
if exist manual_unpack\place_img_here\system.img bin\utils\cecho {0e} - file kept!{#}
echo.
echo.
pause
goto home

::::::::::::::::::::::::::::::::::::::

:repack_image
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Repack into "system.img"{#}
echo.
echo.
if exist manual_unpack\extracted\system (
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info
echo.
) else (
bin\utils\cecho {0c} - there is nothing to repack from "place_img_here"{#}
echo.
echo.
echo.
pause
goto home
echo.
)
if exist repack_done rd /s /q repack_done
::if not exist repack_done mkdir repack_done

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::TODO for custom system_size
::ctext "{0f} Enter size for new image =  %new_size%  byte{0b}{\n}"
::ctext "{0f} -----------------------------------{0b}{\n}"
::echo.
::set /p new_size=_Enter size in bytes :  
::echo %new_size%>>manual_unpack\extracted\system_size.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set /p systemsize=<"manual_unpack\extracted\system_size.txt"
echo - Repacking into system-image
mkdir place_img_here\tmp
bin\utils\make_ext4fs -s -L system -T -1 -S manual_unpack\extracted\system_file_contexts -C manual_unpack\extracted\system_fs_config -l %systemsize% -a system place_img_here\tmp\system.new.img extracted\system\ >nul 
echo.

set tmp=manual_unpack\repack_done
if exist manual_unpack\place_img_here\tmp\system.new.img 
bin\utils\busybox mv place_img_here\system.new.img %tmp%\ >nul 2>nul

echo.
bin\utils\cecho {0a} - new file "system.new.img" Baked! into folder "/repack_done"{#}
echo.
echo.
echo.
pause
goto home

::::::::::::::::::::::::::::::::::::::

:unpack_dat
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Unpacking "system.new.dat"{#}
bin\utils\cecho {0f} ** be sure that [system.new.dat] & [system.transfer.list]{#}
bin\utils\cecho {0f}   are already placed into the folder **{#}
echo.
echo.
if exist manual_unpack\place_dat_here\system.new.dat (
bin\utils\cecho {0b} - Unpacking...{#}
bin\utils\sdat2img place_dat_here\system.transfer.list place_dat_here\system.new.dat place_dat_here\system.new.img >nul 2>nul
if exist manual_unpack\place_dat_here\system.new.dat place_dat_here\system.transfer.list place_dat_here\system.patch.dat del place_dat_here\system.new.dat place_dat_here\system.transfer.list place_dat_here\system.patch.dat 
if not exist place_dat_here\system.transfer.list place_dat_here\system.patch.dat echo 'files removed
)

if exist manual_unpack\place_dat_here\system.new.img (
bin\utils\cecho {0b} - working[lvl 01]...{#}
echo.
bin\utils\imgextractor place_dat_here\system.new.img extracted\system >nul 2>nul
)
set tmp=place_dat_here\
if exist %tmp%\system_file_contexts move /y %tmp%\system_file_contexts extracted\  >nul 2>nul
if exist %tmp%\system_fs_config move /y %tmp%\system_fs_config extracted\  >nul 2>nul
if exist %tmp%\system move /y %tmp%\system extracted\system2  >nul 2>nul

if exist manual_unpack\extracted\system (
bin\utils\cecho {0b} - "system.new.dat" Unpack Done!{#}
echo.
bin\utils\cecho {0b} - check "/extracted" 'for files{#}
echo.
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info >> manual_unpack/extracted/rom-info
echo.
)
if exist manual_unpack\extracted rd /s /q bin\tmp
echo.
echo.
pause
goto home

::::::::::::::::::::::::::::::::::::::

:repack_dat
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - image info!{#}
echo.
echo.
if exist manual_unpack\extracted\system (
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info
echo.
)

if not exist place_dat_here\system.new.img (
bin\utils\cecho {0c} required file ... 'NOT FOUND!{#}
echo.
bin\utils\cecho {0e} ...copy 'system.new.img' to folder "/place_dat_here"{#}
echo.
echo.
pause   
goto home
) else ( 
if exist manual_unpack\place_dat_here\system.new.img (
bin\utils\cecho {0b} - Repack "system.new.dat"{#}
echo.
if exist manual_unpack\place_dat_here\system.new.dat del place_dat_here\system.new.dat
bin\utils\cecho {0b} - working[lvl 01!]...{#}
bin\utils\img2sdat place_dat_here\system.new.img -o place_dat_here -v 4 >nul 2>nul
)
)
del place_dat_here\system.new.img
if exist manual_unpack\place_dat_here\system.new.dat.br del place_dat_here\system.new.dat.br

set tmp=manual_unpack\repack_done

bin\utils\busybox mv place_dat_here\system.new.dat %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.transfer.list %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.patch.dat %tmp%\ >nul 2>nul

echo.
bin\utils\cecho {0a} - new file "system.new.dat" Baked! into folder "/repack_done"{#}
echo.
echo.
pause
goto home

else (
bin\utils\cecho {0b} - Repack "system.new.dat" {#}
echo.
set /p systemsize=<"manual_unpack\extracted\system_size.txt"
bin\utils\cecho {0b} - Repacking...{#}
bin\utils\make_ext4fs -s -L system -T -1 -S manual_unpack\extracted\system_file_contexts-C manual_unpack\extracted\system_fs_config -l %systemsize% -a system place_dat_here\system.new.img extracted\system\ >nul 
echo.
bin\utils\cecho {0b} - working[lvl 01!]...{#}
echo.
if exist manual_unpack\place_dat_here\system.new.img 
bin\utils\cecho {0b} - working[lvl 02!]...{#}
if exist manual_unpack\place_dat_here\system.new.dat del place_dat_here\system.new.dat
bin\utils\img2sdat place_dat_here\system.new.img -o repack_done -v 4 >nul 2>nul
del place_dat_here\system.new.img
if exist manual_unpack\place_dat_here\system.new.dat.br del place_dat_here\system.new.dat.br
echo.
set tmp=manual_unpack\repack_done
bin\utils\busybox mv place_dat_here\system.new.dat %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.transfer.list %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.patch.dat %tmp%\ >nul 2>nul

bin\utils\cecho {0a} - new file "system.new.dat" Baked! into folder "/repack_done"{#}
echo.
echo.
pause
goto home
)
echo.

::::::::::::::::::::::::::::::::::::::

:unpack_br
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Unpacking "system.new.dat.br"{#}
bin\utils\cecho {0f} ** be sure that [system.patch.dat] & [system.transfer.list]{#}
bin\utils\cecho {0f}   are already placed into the folder **{#}
echo.
echo.

if exist manual_unpack\place_img_here\system.new.dat.br (
bin\utils\cecho {0b} - Unpacking...{#}
bin\utils\brotli -d place_br_here\system.new.dat.br >nul
if exist manual_unpack\place_img_here\system.new.dat.br del place_br_here\system.new.dat.br
bin\utils\cecho {0b} - old system.new.dat.br removed
echo.
)

if exist manual_unpack\place_img_here\system.new.dat (
bin\utils\cecho {0b} - working[lvl 02]...{#}
bin\utils\sdat2img place_br_here\system.transfer.list place_br_here\system.new.dat place_br_here\system.img >nul 2>nul
if exist manual_unpack\place_img_here\system.new.dat place_br_here\system.transfer.list place_br_here\system.patch.dat del place_br_here\system.new.dat place_br_here\system.transfer.list place_br_here\system.patch.dat 
if not exist place_br_here\system.transfer.list place_br_here\system.patch.dat echo 'files removed
)

if exist manual_unpack\place_img_here\system.new.img (
bin\utils\cecho {0b} - working[lvl 01]...{#}
echo.
bin\utils\imgextractor place_br_here\system.new.img extracted\system >nul 2>nul
)
set tmp=place_br_here\
if exist %tmp%\system_file_contexts move /y %tmp%\system_file_contexts extracted\  >nul 2>nul
if exist %tmp%\system_fs_config move /y %tmp%\system_fs_config extracted\  >nul 2>nul
if exist %tmp%\system move /y %tmp%\system extracted\system2  >nul 2>nul

if exist manual_unpack\extracted\system (
bin\utils\cecho {0b} - "system.new.dat.br" Unpack Done!{#}
echo.
bin\utils\cecho {0b} - check "/extracted" 'for files{#}
echo.
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info
bin\utils\busybox sh ./bin/utils/utility_manual.sh rom-info >> manual_unpack/extracted/rom-info
echo.
)
if exist manual_unpack\extracted rd /s /q bin\tmp
echo.
echo.
pause
goto home

::::::::::::::::::::::::::::::::::::::

:repack_br
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
if exist manual_unpack\place_img_here\system.new.dat.br del repack_done\system.new.dat.br ( 
bin\utils\cecho {0b} - working[lvl 01]...{#}
)
echo.
if exist manual_unpack\place_img_here\system.new.dat echo bin\utils\cecho {0e} required file ... OK!{#} (
::bin\utils\img2sdat repack_done\system.new.img -o repack_done -v 4 >nul 2>nul
bin\utils\brotli -1 -j -w 24 place_br_here\system.new.dat >nul 

set tmp=manual_unpack\repack_done
bin\utils\busybox mv place_dat_here\system.new.dat.br %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.transfer.list %tmp%\ >nul 2>nul
bin\utils\busybox mv place_dat_here\system.patch.dat %tmp%\ >nul 2>nul

del repack_done\system.new.img
del repack_done\system.new.dat
echo.
bin\utils\cecho {0a} - new file "system.new.dat.br" Baked! into folder "/repack_done"{#}
echo.
pause
goto home 
)
else (
echo bin\utils\cecho {0c} required file ... 'NOT FOUND!{#}
goto home
)

::::::::::::::::::::::::::::::::::::::

:unpack_vendor
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
bin\utils\cecho {0b} - Unpacking "vendor.new.dat.br"{#}
bin\utils\cecho {0f} ** be sure that [vendor.patch.dat] & [vendor.transfer.list]{#}
bin\utils\cecho {0f}   are already placed into the folder **{#}
echo.
echo.

if exist manual_unpack\place_vendor_here\vendor.new.dat.br (
bin\utils\cecho {0b} - Unpack vendor.new.dat.br{#}
echo.
bin\windows\brotli -d manual_unpack\place_vendor_here\vendor.new.dat.br >nul
del manual_unpack\place_vendor_here\vendor.new.dat.br
)

if exist manual_unpack\place_vendor_here\vendor.new.dat (
bin\utils\cecho {0b} - Unpack vendor.new.dat{#}
echo.
bin\windows\sdat2img manual_unpack\place_vendor_here\vendor.transfer.list manual_unpack\place_vendor_here\vendor.new.dat manual_unpack\place_vendor_here\vendor.img >nul 2>nul
del manual_unpack\place_vendor_here\vendor.new.dat
del manual_unpack\place_vendor_here\vendor.transfer.list
del manual_unpack\place_vendor_here\vendor.patch.dat
)

if exist manual_unpack\place_vendor_here\vendor.img (
bin\utils\cecho {0b} - Unpack vendor.img{#}
echo.
bin\windows\imgextractor manual_unpack\place_vendor_here\vendor.img manual_unpack\extracted\vendor >nul 2>nul
del manual_unpack\place_vendor_here\vendor.img
)

if exist manual_unpack\extracted\vendor (
bin\utils\cecho {0b} - "vendor.new.dat.br" Unpack Done!{#}
echo.
bin\utils\cecho {0b} - check "/extracted" 'for files{#}
echo.
)
if exist manual_unpack\extracted\vendor rd /s /q manual_unpack\place_vendor_here
echo.
echo.
pause
goto home

::::::::::::::::::::::::::::::::::::::

:repack_vendor
cls
mode con:cols=90 lines=45
echo.
echo.
bin\utils\cecho                                {60} Yet Another Rom Tool {#}
echo.  
echo                          by mr.vybes - Telegram: @nanavybes 
bin\utils\cecho                                    {0d}=============={#}
echo.
bin\utils\cecho                {30} Yet another unpack/repack tool 'for Android ROM images {#} 
echo.
bin\utils\cecho                                {0e}thanks to @jancox-tool{#}
echo.
echo.
bin\utils\cecho                  {0b}%activity% {#}{60} %date%{#} / {0b}%activitytime% {#}{20} %time%{#}
echo.
bin\utils\cecho    {0b}    ***********************************************************************{#}
echo.
echo.
echo.
echo.
if exist manual_unpack\extracted\vendor (
echo.
bin\utils\cecho {0b} - Repack "Vendor Image"{#}
echo.
echo.
) else (
bin\utils\cecho {0c} - there is nothing to repack from "/extracted/vendor"{#}
echo.
pause
goto home 
)

echo.
bin\utils\cecho {0b} - Processing...{#}
echo.
bin\utils\cecho {0b} - Repack to 'vendor.new.img'{#}
echo.
set /p vendorsize=<"manual_unpack\extracted\vendor_size.txt"
bin\utils\make_ext4fs -s -L vendor -T -1 -S manual_unpack\extracted\vendor_file_contexts -C manual_unpack\extracted\vendor_fs_config -l %vendorsize% -a vendor place_vendor_here\vendor.new.img manual_unpack\extracted\vendor\ >nul

if exist place_vendor_here\vendor.new.img (
bin\utils\cecho {0b} - Repack to 'vendor.new.dat'{#}
echo.
bin\utils\img2sdat place_vendor_here\vendor.new.img -o place_vendor_here -v 4 -p vendor >nul 2>nul
del place_vendor_here\vendor.new.img
)

if exist place_vendor_here\vendor.new.dat (
bin\utils\cecho {0b} - Repack to 'vendor.new.dat.br'{#}
echo.
bin\utils\brotli -1 -j -w 24 place_vendor_here\vendor.new.dat >nul
)
if exist place_vendor_here\vendor.new.dat del place_vendor_here\vendor.new.dat
if exist place_vendor_here\vendor.new.img del place_vendor_here\vendor.new.img

set tmp=manual_unpack\repack_done
if exist place_vendor_here\vendor.new.dat.br
bin\utils\busybox mv place_vendor_here\vendor.new.dat.br %tmp%\ >nul 2>nul
bin\utils\busybox mv place_vendor_here\vendor.transfer.list %tmp%\ >nul 2>nul
bin\utils\busybox mv place_vendor_here\vendor.patch.dat %tmp%\ >nul 2>nul

echo.
bin\utils\cecho {0a} - new file "vendor.new.dat" Baked! into folder "/repack_done"{#}
echo.
echo.
pause
goto home
