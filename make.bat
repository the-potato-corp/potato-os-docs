@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=source
REM Change the default build folder name to docs
set BUILDDIR=docs

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.https://www.sphinx-doc.org/
	exit /b 1
)

if "%1" == "" goto help

REM --- MODIFICATION START ---
REM We bypass the -M option for all cases and use direct -b command

REM Check if the command is "help" (which uses -M help)
if "%1" == "help" goto help

REM Otherwise, assume the first argument is the builder name (e.g., html, dirhtml, singlehtml)
REM and run the specific build command directly.
%SPHINXBUILD% -b %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

REM --- MODIFICATION END ---

:help
REM Help still uses -M as it handles all help output types elegantly
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd
