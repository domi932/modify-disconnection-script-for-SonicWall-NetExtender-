ECHO OFF
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /f /v "DefaultConnectionSettings" /t REG_BINARY /d "460000000400000009000000000000000000000026000000687474703A2F2F7777772E78787878782E636F6D3A313233342F73616D706C6553637269707400000000000000000000000000000000"
REM =======================================================
REM COMMAND EXAMPLES
REM =======================================================

REM ============Map a network drive========================
REM net use z: \\server\share password /user:Domain\name

REM ============Disconnect a network drive=================
REM net use z: /delete

REM ============Map a network printer======================
REM net use LPT1 \\PrintServer\LaserPrinter1 /user:Domain\name

REM ============Disconnect a network printer===============
REM net use LPT1 /delete

REM ============Launch a local application=================
REM "C:\Path to Application\Application.exe"

REM ============Open a website=============================
REM start http://www.website.com

REM ============Open a local file==========================
REM "C:\Path to my files\myFile.doc"
ECHO ON

