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
echo   - 每次调用 Edit/Write 修改代码前，先想一秒：这个改动有方案取舍吗？
echo   ^有 → 触发 pretend_as_PM 记录决策后再改；没有 → 直接改。
echo   改完后输出 📋 决策已记录：PM-xxx（无则无需输出）。
echo   若漏记可 /pm-decision 补。
echo.
pause
