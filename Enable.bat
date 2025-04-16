@echo off
:: 管理者権限かチェック
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 管理者権限が必要です。再実行します...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)


echo クリーンインストール後のアップグレード版のプロダクトキーを有効にします。


reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Setup\OOBE" /v MediaBootInstall /t REG_DWORD /d 1 /f

slmgr -rearm

echo 設定が完了しました。
:CHOICE
set /p ANSWER=設定を反映させるために再起動しますか？ (Y/N): 
if /i "%ANSWER%"=="Y" (
    echo 再起動します…
    shutdown /r /t 0
) else if /i "%ANSWER%"=="N" (
    echo 再起動せずに終了します。
    exit
) else (
    echo 無効な入力です。Y または N を入力してください。
    goto CHOICE
)