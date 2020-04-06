@echo off

start "KrassGui" javaw -classpath "%~dp0\bin" -Xms16m -Xmx1024m com.asofterspace.krassGui.Main %*

pause
