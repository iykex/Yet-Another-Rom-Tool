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


:home
cls
mode con:cols=104 lines=30
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
echo    Menu :
bin\utils\cecho   {0d}=========={#}
echo.
echo.
bin\utils\ctext "    {0e}1. *Unpack system.img{0e}        {0e}3. *Unpack new.dat{0e}        {0e}5. *Unpack new.dat.br{0e}{\n}"
echo.
bin\utils\ctext "    {0f}        --------{0f}                    {0f}--------{0f}                    {0f}--------{0f}{\n}"
echo.
bin\utils\ctext "    {0e}2. *Repack system.img{0e}        {0e}4. *Repack new.dat{0e}        {0e}6. *Repack new.dat.br{0e}{\n}"
echo.
echo.
echo.
echo.
bin\utils\cecho {0f}   
set /p web=    Type option *: 
bin\utils\cecho {0f} {#} 
echo.
echo. 
if "%web%"=="1" goto unpack_image
if "%web%"=="2" goto repack_image
if "%web%"=="3" goto unpack_dat
if "%web%"=="4" goto repack_dat
if "%web%"=="5" goto unpack_br
if "%web%"=="6" goto repack_br

echo.

:unpack_image
cls
mode con:cols=104 lines=30
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
if exist extracted rd /s /q extracted
if not exist extracted mkdir extracted
if exist place_img_here\system.img (
echo system.img file found
) else (
bin\utils\cecho {0c} - system.img not found in "place_img_here"{#}
echo.
echo.
echo.
pause
goto home
)

if exist place_img_here\system.img (
bin\utils\cecho {0b} - Unpacking "system.img"{#}
echo.
bin\utils\imgextractor place_img_here\system.img extracted\system >nul 2>nul
)

set tmp=place_img_here\
if exist %tmp%\system_file_contexts move /y %tmp%\system_file_contexts extracted\  >nul 2>nul
if exist %tmp%\system_fs_config move /y %tmp%\system_fs_config extracted\  >nul 2>nul
if exist %tmp%\system move /y %tmp%\system extracted\system2  >nul 2>nul

if exist extracted\system (
bin\utils\cecho {0b} - "system.img" Unpack Done!{#}
echo.
bin\utils\busybox sh ./bin/utils/utility.sh rom-info
bin\utils\busybox sh ./bin/utils/utility.sh rom-info >> extracted/rom-info
echo.
)
if exist extracted rd /s /q bin\tmp
echo.
echo.
set /p rmsysimg=_Do you want to remove old system.img [yes/no]? :  
echo.
if "%rmsysimg%"=="y" goto remove_img

:remove_img
del place_img_here\system.img
bin\utils\cecho {0e} - file removed!{#}
echo.
echo.
echo.
pause
goto home



:repack_image
cls
mode con:cols=104 lines=30
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
if exist extracted\system (
bin\utils\busybox sh ./bin/utils/utility.sh rom-info
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
if not exist repack_done mkdir repack_done

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::TODO for custom system_size
::ctext "{0f} Enter size for new image =  %new_size%  byte{0b}{\n}"
::ctext "{0f} -----------------------------------{0b}{\n}"
::echo.
::set /p new_size=_Enter size in bytes :  
::echo %new_size%>>extracted\system_size.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set /p systemsize=<"extracted\system_size.txt"
echo - Repacking into system-image
bin\utils\make_ext4fs -s -L system -T -1 -S extracted\system_file_contexts -C extracted\system_fs_config -l %systemsize% -a system repack_done\system.img extracted\system\ >nul 
echo.
echo.
bin\utils\cecho {0b} - "system.img" Baked!{#}
echo.
echo.
echo.
pause
goto home



::::::::::::::::::::::::::::::::::::::
::TODO  --- below 
::::::::::::::::::::::::::::::::::::::
:unpack_dat
cls
mode con:cols=104 lines=30
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
goto home

:repack_dat
cls
mode con:cols=104 lines=30
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
goto home

:unpack_br
cls
mode con:cols=104 lines=30
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
goto home

:repack_br
cls
mode con:cols=104 lines=30
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
goto home