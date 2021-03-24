#This will work, Dockerfile that using winget to install packages
FROM mcr.microsoft.com/windows:10.0.17763.1817

WORKDIR /Downloads
ADD https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx /Downloads/Microsoft.VCLibs.x64.14.00.Desktop.appx
ADD https://github.com/microsoft/winget-cli/releases/download/v-0.2.10191-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle \
    /Downloads/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle

RUN powershell.exe -Command 'Add-AppxPackage -Path "C:\Downloads\Microsoft.VCLibs.x64.14.00.Desktop.appx"'
RUN powershell.exe -Command 'Add-AppxPackage -Path "C:\Downloads\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"'

#USER ContainerAdministrator
#RUN setx /M PATH "%PATH%;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\"
#USER ContainerUser

WORKDIR /winget
#unzip and get AppInstallerCLI.exe (winget) and resources.pri from winget appxbundle file, inside AppInstaller_x64.appx (unzip)


RUN powershell.exe -Command 'winget install git'
#RUN winget install Microsoft.VisualStudio.BuildTools
