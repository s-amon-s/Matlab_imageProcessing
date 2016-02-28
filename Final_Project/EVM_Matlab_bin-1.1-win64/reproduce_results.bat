:: Windows Batch Script for generating example results
:: Identical in structure to reproduce_results.sh version for linux
@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set f=evm

:: S=Source, R=Results, MCR=MatlabCompilerRuntime
set SDIR=./data
set MCR=C:\Program Files\MATLAB\MATLAB Compiler Runtime\v80\runtime\win64

:: MCR path is preceded by any other path in system Path 
:: this prevents from other matlab or MCR installation from getting in the way
set PATH=%MCR%;%PATH%

set verNum=v80
set RDIR=ResultsSIGGRAPH2012

mkdir %RDIR%
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::----------------------------------------------------------
:: baby2.mp4 video with ideal_filter
set inFile=%SDIR%/baby2.mp4
call:printFun

%f% %inFile% %RDIR% 30 color 140/60 160/60 150 ideal 1 6

::------------------------------------------------------------
:: camera.mp4, with butterworth filter
set inFile=%SDIR%/camera.mp4
call:printFun

%f%  %inFile% %RDIR% 300 motion 45 100 150 butter 0 20

::------------------------------------------------------------
::subway.mp4, with butterworth filter
set inFile=%SDIR%/subway.mp4
call:printFun

%f%  %inFile% %RDIR% 30 motion 3.6 6.2 60 butter 0.3 90

::------------------------------------------------------------
:: shadow.mp4, with motion butterworth
set inFile=%SDIR%/shadow.mp4
call:printFun

%f%  %inFile% %RDIR% 30 motion 0.5 10 5 butter 0 48

::------------------------------------------------------------
:: guitar.mp4, with two ideal filters
:: beware, ideal filters require at least 5GB of RAM
set inFile=%SDIR%/guitar.mp4
call:printFun

:: amplify E
%f%  %inFile% %RDIR% 600 motion 72 92 50 ideal 0 10

:: amplify A
%f%  %inFile% %RDIR% 600 motion 100 120 100 ideal 0 10


::------------------------------------------------------------
:: face.mp4, with ideal color filter
set inFile=%SDIR%/face.mp4
call:printFun

%f%  %inFile% %RDIR% 30 color 50/60 60/60 50 ideal 1 4

::------------------------------------------------------------
::face2.mp4, with butterworth motion filter and color
set inFile=%SDIR%/face2.mp4
call:printFun

:: Motion
%f%  %inFile% %RDIR% 30 motion 0.5 10 20 butter 0 80

:: Color
%f%  %inFile% %RDIR% 30 color 50/60 60/60 50 ideal 1 6


:: printing helper Function, should NOT come before all others
:printFun
   echo Processing %inFile%
   echo.
goto:eof


:: MCR verNum:v80
:: MCR defaultPath: C:\Program Files\MATLAB\MATLAB Compiler Runtime\v80
