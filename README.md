# Hyper-V-MergeAVHDX
Simple script to merge AVHDX into VHDX files

Shutdown the VM, then let the script merge all the AVHDX files into the VHDX. Be sure to reconfigure the VM to point to the VHDX instead of the AVHDX. I've had most success when removing the disks, save the VM, then edit the VM again and re-add the disks.
