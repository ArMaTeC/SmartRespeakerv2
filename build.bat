@echo off
cd /d %~dp0
title ESPHome Fancy Menu
color 0A

:menu
cls
echo.
echo     ===========================================
echo     *                                         *
echo     *           ESPHome Fancy Menu            *
echo     *                                         *
echo     ===========================================
echo.
echo        [1] Compile Firmware
echo        [2] Upload Firmware
echo        [3] Compile and Upload Firmware
echo        [4] Run Device
echo        [5] Exit Menu
echo.
echo     ===========================================
echo.
choice /c 1234 /m "     Select an action (1-4): "
if %ERRORLEVEL%==1 (
    echo.
    echo     Compiling firmware...
    set subcommand=compile
	goto compile
) else if %ERRORLEVEL%==2 (
    echo.
    echo     Uploading firmware...
    set subcommand=upload
	goto upload
) else if %ERRORLEVEL%==3 (
    echo.
    echo     Compiling firmware...
	echo     And
	echo     Uploading firmware...
    set subcommand=comup
	goto comup
) else if %ERRORLEVEL%==4 (
    echo.
    echo     Running device...
    set subcommand=run
) else if %ERRORLEVEL%==5 (
    goto end
)
:compile
echo.
echo     Executing: esphome %subcommand% smartv2-factory.yaml
echo.
esphome %subcommand% smartv2-factory.yaml 2>&1 | tee -a RunBuildlog.log
echo.
echo     Operation completed successfully!
echo     ---------------------------------
pause
goto menu

:upload
echo.
echo     Executing: esphome %subcommand% smartv2-factory.yaml
echo.
esphome %subcommand% smartv2-factory.yaml 2>&1 | tee -a RunBuildlog.log
echo.
echo     Operation completed successfully!
echo     ---------------------------------
pause
goto menu

:upload
echo.
echo     Executing: esphome %subcommand% smartv2-factory.yaml
echo.
esphome %subcommand% smartv2-factory.yaml 2>&1 | tee -a RunBuildlog.log
echo.
echo     Operation completed successfully!
echo     ---------------------------------
pause
goto menu

:comup
echo.
echo     Executing: esphome compile smartv2-factory.yaml
echo.
esphome compile smartv2-factory.yaml 2>&1 | tee -a RunBuildlog.log
echo.
echo     Operation completed successfully!
echo     ---------------------------------
echo.
echo     Executing: esphome upload smartv2-factory.yaml
echo.
esphome upload smartv2-factory.yaml 2>&1 | tee -a RunBuildlog.log
echo.
echo     Operation completed successfully!
echo     ---------------------------------
pause
goto menu

:end
cls
echo.
echo     ===========================================
echo     *                                         *
echo     *         Thank you for using!            *
echo     *              Goodbye!                   *
echo     *                                         *
echo     ===========================================
echo.
pause
exit