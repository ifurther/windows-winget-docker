#This will work, Dockerfile that using winget to install packages
FROM mcr.microsoft.com/windows:10.0.17763.1817

WORKDIR /Downloads
#ADD https://aka.ms/vs/16/release/vc_redist.x64.exe C:\Downloads\vcredist_x64.exe
#RUN C:\Downloads\vcredist_x64.exe /install /passive /norestart /log out.txt
ADD https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx /Downloads/Microsoft.VCLibs.x64.14.00.Desktop.appx
ADD https://github.com/microsoft/winget-cli/releases/download/v-0.2.10191-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle \
    /Downloads/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle

RUN powershell.exe -Command 'Add-AppxPackage -Path "C:\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx"'

RUN powershell.exe -Command 'Add-AppxPackage -Path "C:\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"'

#USER ContainerAdministrator
#RUN setx /M PATH "%PATH%;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\" #$env:Path += ";$env:LocalAppData\Microsoft\WindowsApps"; setx /M #PATH "$Env:PATH;" 
#USER ContainerUser

WORKDIR /winget
#unzip and get AppInstallerCLI.exe (winget) and resources.pri from winget appxbundle file, inside AppInstaller_x64.appx (unzip)


RUN powershell.exe -Command 'winget install git'
#RUN winget install Microsoft.VisualStudio.BuildTools
