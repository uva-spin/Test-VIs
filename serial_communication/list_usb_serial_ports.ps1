# PowerShell script to list up all USB Serial ports.
# Note that the execution policy has to be properly set beforehand, i.e. "Set-ExecutionPolicy RemoteSigned".

echo "Known devices for the E1039 target slow control: OLD:"
echo "  COM 8  FTDIBUS VID_0403 PID_6001 AB0MSAYFA  MaxiGauge"
echo "  COM 5  FTDIBUS VID_0403 PID_6001 A10KNO4KA  MKS 670"
echo "  COM 9  FTDIBUS VID_0403 PID_6001 AB0MSAYBA  Run Valve"
echo "  COM10  FTDIBUS\VID_0403+PID_6001+A10KNNHMA  Microwave Control Box #1"
echo "  COM11  FTDIBUS VID_0403 PID_6001 AB0MSGBOA  AMI 1700"
echo "  COM13  FTDIBUS VID_0403 PID_6001 A10KNMWOA  THCD-400"
echo "  COM14  FTDIBUS VID_0403 PID_6001 AB0MSNGDA  MKS 946"
echo "  COM16  FTDIBUS VID_0403 PID_6015 DAZ5STTNA  Lifter Potentiometer Power Supply"
echo "  COM17  FTDIBUS VID_0403 PID_6001 AK05THHHA  TPG361"
echo "  COM21  FTDIBUS VID_0403 PID_6001 A103LMKMA  Oxford ITM 10"
echo "  COM22  FTDIBUS VID_0403 PID_6001 AB0MSCGVA  Bypass Valve"
echo "  COM23  FTDIBUS\VID_0403+PID_6001+A10LG3PJA  Microwave Control Box #2"
echo "  COM24  FTDIBUS\VID_0403+PID_6015+DA5PDJH9A  Gas Analyzer BGA244 (built-in interface)"
echo "  COM25  USB\VID_2341&PID_0043\950323035373517042F0  Roots-pump LCW Arduino"
echo "  COM26  FTDIBUS\VID_0403+PID_6001+AB0PFECRA  Gas Analyzer BGA244"
echo "  COM12  FTDIBUS\VID_0403+PID_6001+A103LMKMA  ??"
echo "  COM 6  USB\VID_0525&PID_A4A7\1&2D12BED1&0   Magnet Power Supply"
echo "  COM20  FTDIBUS\VID_0403+PID_6001+AB0NXJH7A  Magnet Shim Relay"
echo ""

echo "Known devices for the E1039 target slow control:"
echo "  DS510-91C059: Slow-Control Rack #1"
echo "    COM16  FTDIBUS\VID_0403+PID_6001+A10KNO4KA  MKS 670"
echo "    COM 7  FTDIBUS\VID_0403+PID_6015+DAZ5STTNA  Lifter Potentiometer Power Supply"
echo "    COM31  FTDIBUS\VID_0403+PID_6001+AB0MSGBOA  AMI 1700"
echo "    COM28  FTDIBUS\VID_0403+PID_6001+AB0MSNGDA  MKS 946"
echo "    COM29  FTDIBUS\VID_0403+PID_6001+AB0MSAYBA  Run Valve ??"
echo "    COM21  FTDIBUS\VID_0403+PID_6001+AB0MSCGVA  Bypass Valve ??"
echo "  DS510-93C98B: Slow-Control Rack #2:"
echo "    COM33  FTDIBUS\VID_0403+PID_6001+A10KNNHMA  Microwave Control Box #1"
echo "    COM30  FTDIBUS\VID_0403+PID_6001+A10LG3PJA  Microwave Control Box #2"
echo "    COM13  FTDIBUS\VID_0403+PID_6001+A10KNMWOA  THCD-400"
echo "    COM32  FTDIBUS\VID_0403+PID_6001+AK05THHHA  TPG361"
echo "  DS510-93C98E: Magnet Rack"
echo "    COM25  USB\VID_2341&PID_0043\950323035373517042F0  Roots-pump LCW Arduino"
echo "    COM34  FTDIBUS\VID_0403+PID_6001+A103LMKMA  Oxford ITM 10"
echo "    COM18  FTDIBUS\VID_0403+PID_6001+AB0PFECRA  Gas Analyzer BGA244"
echo "    COM35  FTDIBUS\VID_0403+PID_6001+AB0MSAYFA  MaxiGauge"
echo "    COM 6  USB\VID_0525&PID_A4A7\1&2D12BED1&0   Magnet PS"
echo "    COM36  FTDIBUS\VID_0403+PID_6001+AB0NXJH7A  Magnet PS Shim Relay"

echo ""
echo "Available devices at present:"

while ($true) {
  Get-WMIObject Win32_PnPEntity | where {$_.Name -like "USB Serial *COM*"} | Format-Table Name, PNPDeviceID
  Write-Host "Press Control-C to quit.  " -NoNewLine
  Pause
}


