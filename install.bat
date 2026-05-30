@echo off
REM pretend_as_PM — Install to Claude Code global skills directory (Windows)
setlocal enabledelayedexpansion

set "SKILLS_DIR=%USERPROFILE%\.claude\skills"
set "SOURCE_DIR=%~dp0skills"

echo === pretend_as_PM Installer ===
echo.

if not exist "%SKILLS_DIR%" mkdir "%SKILLS_DIR%"

for %%s in (pretend_as_PM pm-decision pm-summary) do (
    if exist "%SOURCE_DIR%\%%s" (
        if exist "%SKILLS_DIR%\%%s" rmdir /s /q "%SKILLS_DIR%\%%s"
        xcopy /e /i /q "%SOURCE_DIR%\%%s" "%SKILLS_DIR%\%%s"
        echo [OK] Installed: %%s
    ) else (
        echo [FAIL] Missing: %%s
    )
)

echo.
echo === Installation complete ===
echo.
echo Recommended: Add the following to your CLAUDE.md for stronger trigger reliability:
echo.
echo   %%USERPROFILE%%\.claude\CLAUDE.md (global)
echo   or ^<project^>\.claude\CLAUDE.md (per-project)
echo.
echo   - Involving decision-making? Trigger pretend_as_PM Skill to record before coding.
echo     Output "Decision recorded: PM-xxx" after changes.
echo     User can manually /pm-decision if missed.
echo.
pause
