![Image](https://www.rti.com/hubfs/RTI_Oct2016/Images/rti-logounit.png)  
RTI Connext DDS Use Case:  
Medical Device Connectivity
=======================================================================

Concept
-------
This use case example includes four applications that send and receive
data related to connected medical devices monitoring a patient.

The applications are:

1. Device Data Replay (RTI Replay Service)
	- Replays pre-recorded ECG data from the ICE MDPnP device
	  simulator
	- Replays pre-recorded pulse oximeter data from the ICE MDPnP
	  device simulator

2. Patient-Device Mapping (PatientDeviceApp)
	- Sends data associating device IDs with patient IDs

3. Bedside Supervisor (BedsideSupervisor)
	- Receives ECG and pulse oximeter data
	- Sends alarm data when the values provided by both devices are
	  out of range.

4. User Interface (HMI)
	- Receives alarm data
	- Displays it in a simple GUI


Additional Documentation
------------------------
Detailed documentation and how-to videos for this example are available online at:
  https://www.rti.com/resources/usecases/medical-devices

More Case + Code examples are available at:
  https://www.rti.com/resources/usecases


Download RTI Connext DDS
------------------------
If you do not already have RTI Connext DDS installed, download and install it
now. You can use a 30-day trial license to try out the product. Your download
will include the libraries that are required to run the example, and tools you
can use to visualize and debug your distributed system.

You can download RTI Connext here: https://www.rti.com/downloads/


How to Build this Code
----------------------
On all platforms, the first thing you must do is set an environment variable
called `NDDSHOME`. This environment variable must point to the
rti_connext_dds-.5.x.x directory inside your RTI Connext DDS installation. For
more information on how to set an environment variable, please see the RTI
Core Libraries and Utilities Getting Started Guide.

We will refer to the location where you unzipped the example in this document
as EXAMPLE_HOME.

All source and build files are located in EXAMPLE_HOME/ExampleCode/.  Before
building or running, change directories into EXAMPLE_HOME/ExampleCode.


Windows Systems
---------------
On a Windows system, solution and project files are provided for Visual Studio  
2017 and 2015.  Batch file scripts have been provided to copy the appropriate  
files into the ExampleCode\win32 directory.  
Open a terminal/command prompt in ExampleCode\win32 and run:
 * `setup-VS2017.bat` for Visual Studio 2017
 * `setup-VS2015.bat` for Visual Studio 2015

Once the preferred project files have been copied, launch Visual Studio from an  
environment with NDDSHOME set to your RTI installation directory, and open the file:
`win32\MedicalDeviceIntegrationExample-<compilerver>.sln`

This code is made up of a combination of libraries, source, and IDL files that
represent the interface to the application. The Visual Studio solution files
are set up to automatically generate the necessary code and link against the
required libraries.

For Java developers, an Eclipse project is located in the src\HMI directory,
and another project located in the src\BedsideSupervisor directory.
To build in Eclipse, you must follow these steps:
  - Ensure a C++ preprocessor is in your path.  One way to do this is by
    running the Visual Studio application vcvars32.bat from a command
    prompt, and opening Eclipse from that same command prompt.
  - Ensure the NDDSHOME environment variable is set to the directory where
    you installed RTI Connext DDS.
  - Import the HMI and BedsideSupervisor projects into Eclipse
  - Right-click on the build.xml files, and select Run As | Ant Build. This
    will call the code generator to generate code from the .idl files.
  - You might need to also add the location of the 'nddsjava.jar' library
    in your NDDSHOME\lib\java folder to the projects' classpath.
  - Edit the run configuration to ensure that the PATH environment variable
    includes this directory:  
      `NDDSHOME\lib\<target architecture you have installed>`


Linux Systems
-------------
To build the applications on a Linux system, change directories to the
ExampleCode directory and use the command:

`gmake -f make/Makefile.<platform>`  

The platform you choose will be the combination of your processor, OS, and
compiler version.
This example supports:
  - `x64Linux3.xgcc4.6.3`
  - `x64Linux3gcc5.4.0`

For Java developers, an Eclipse project is located in the src\HMI directory,
and another project located in the src\BedsideSupervisor directory.
To build in Eclipse, you must follow these steps:
  - Ensure a C++ preprocessor is in your path.
  - Ensure the NDDSHOME environment variable is set to the directory where
    you installed RTI Connext DDS.
  - Import the HMI and the BedsideSupervisor projects into Eclipse
  - Right-click on the build.xml files, and select Run As | Ant Build. This
    will call the code generator to generate code from the .idl files.
  - You might need to also add the location of the 'nddsjava.jar' library
    in your NDDSHOME\lib\java folder to the projects' classpath.
  - Edit the run configuration to ensure that the PATH environment variable
    includes this directory:  
       `NDDSHOME/lib/<target architecture you have installed>`


Run the Example
---------------
On Windows systems, navigate to the EXAMPLE_HOME\ExampleCode\scripts directory.
In this directory are four batch files to start the applications:  
  - DeviceData.bat
  - PatientDeviceApp.bat
  - BedsideSupervisor.bat
  - HMI.bat

On Linux systems, navigate to the EXAMPLE_HOME/ExampleCode/scripts directory.
In this directory are four batch files to start the applications:  
  - DeviceData.sh
  - PatientDeviceApp.sh
  - BedsideSupervisor.sh
  - HMI.sh

You can run these script or batch files on the same machine, or you can copy
this example and run on multiple machines. If you run them on the same machine,
they will communicate over the shared memory transport. If you run them on
multiple machines, they will communicate over UDP.


Application Parameters:
--------------------------
All the scripts accept a single parameter that can be used in a system that has
no multicast available.  
```
Valid options are:
    --no-multicast       Do not use any multicast, including for discovery
                         (note you must edit XML config to include IP
                         addresses)
```

