# PowerShell script to list up all USB Serial ports.
# Note that the execution policy has to be properly set beforehand, i.e. "Set-ExecutionPolicy RemoteSigned".

echo "Known devices for the E1039 target slow control:"
echo "  COM 8  FTDIBUS VID_0403 PID_6001 AB0MSAYFA  MaxiGauge"
echo "  COM 5  FTDIBUS VID_0403 PID_6001 A10KNO4KA  MKS 670"
echo "  COM 9  FTDIBUS VID_0403 PID_6001 AB0MSAYBA  Run Valve"
echo "  COM11  FTDIBUS VID_0403 PID_6001 AB0MSGBOA  AMI 1700"
echo "  COM13  FTDIBUS VID_0403 PID_6001 A10KNMWOA  THCD-400"
echo "  COM14  FTDIBUS VID_0403 PID_6001 AB0MSNGDA  MKS 946"
echo "  COM16  FTDIBUS VID_0403 PID_6015 DAZ5STTNA  Lifter Potentiometer Power Supply"
echo "  COM17  FTDIBUS VID_0403 PID_6001 AK05THHHA  ??"
echo "  COM21  FTDIBUS VID_0403 PID_6001 A103LMKMA  Oxford ITM 10"
echo "  COM22  FTDIBUS VID_0403 PID_6001 AB0MSCGVA  Bypass Valve"
echo ""
echo "Available devices at present:"

while ($true) {
  Get-WMIObject Win32_PnPEntity | where {$_.Name -like "USB Serial Port*"} | Format-Table Name, PNPDeviceID
  Write-Host "Press Control-C to quit.  " -NoNewLine
  Pause
}

