@echo off
echo "Copying files for building with Visual Studio 2015 (VS2015)"
copy /y VS2015\*.vcxproj .
copy /y VS2015\*.vcxproj.filters .
copy /y VS2015\MedicalDeviceIntegrationExample-vs201?.sln .