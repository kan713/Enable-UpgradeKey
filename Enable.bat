@echo off
:: �Ǘ��Ҍ������`�F�b�N
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo �Ǘ��Ҍ������K�v�ł��B�Ď��s���܂�...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)


echo �N���[���C���X�g�[����̃A�b�v�O���[�h�ł̃v���_�N�g�L�[��L���ɂ��܂��B


reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Setup\OOBE" /v MediaBootInstall /t REG_DWORD /d 1 /f

slmgr -rearm

echo �ݒ肪�������܂����B
:CHOICE
set /p ANSWER=�ݒ�𔽉f�����邽�߂ɍċN�����܂����H (Y/N): 
if /i "%ANSWER%"=="Y" (
    echo �ċN�����܂��c
    shutdown /r /t 0
) else if /i "%ANSWER%"=="N" (
    echo �ċN�������ɏI�����܂��B
    exit
) else (
    echo �����ȓ��͂ł��BY �܂��� N ����͂��Ă��������B
    goto CHOICE
)