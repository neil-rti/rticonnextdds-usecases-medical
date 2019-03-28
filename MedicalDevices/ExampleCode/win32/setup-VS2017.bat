@echo off
echo "Copying files for building with Visual Studio 2017 (VS2017)"
copy /y VS2017\*.vcxproj .
copy /y VS2017\*.vcxproj.filters .
copy /y VS2017\MedicalDeviceIntegrationExample-vs201?.sln .