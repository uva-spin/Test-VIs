# VIs for Leybold TURBOVAC

SpinQuest uses Leybold TURBOVAC 1350iR (turbo pump) and TURBO.DRIVE 500e (remote drive unit) for the target IVC.


## Installation of Driver

- Download `Interfaces_TURBOVAC_i_iX_iR.zip` from the Leybold website:
  https://www.leybold.com/en/download-center/download-software/pc-software-for-turbomolecular-pumps
- Unzip it and run `USB/Install_Driver.bat` as administrator.
    - But it failed because the current folder was `C:\Windows\System32` when the bat file was ran as administrator.
    - Thus I opened a command prompt as administrator, cd to `...\USB` and then run `pnputil.exe -a "TURBOVACi.inf"` manually.
- Connect the USB device (via Virtual Link).
    - The device should appear on the device manager.  Its COM port number can be found.
    - Since I had connected the USB device before installing the driver, I had to uninstall the driver, disconnect the device and connect it again.


## Installation of GUI Software (LeyAssist)

- Download `LEYASSIST\ Setup.exe` from the Leybold website:  https://leyassist.leybold.com/app/#/download
- Execute the exe file, which installs the software in user's app folder and make a shortcut on user's desktop.


## LabVIEW Library

- Download `Leybold__TURBOVAC.zip` from the Leybold website:
  https://www.leybold.com/en/download-center/download-software/pc-software-for-turbomolecular-pumps
- Extract `Leybold TURBOVAC` from the zip file and placed it under `C:\Program Files\National Instruments\LabVIEW 2019\instr.lib`.
- Copy the example VI file (`Leybold TURBOVAC Access Parameters.vi`) to this folder and modify it:
    - Change `VISA resource name` to `COM43`.
    - Change `Converter Type` to `Turbovac 1300iX`.  Probably it doesn't matter.
    - Change `Type of parameter access` to `Do nothing`.
    - In the block diagram, set `ID Query?` of `Initialize.vi` to `F`.  It is necessary because our device (1350iR) is not in the ID list.
