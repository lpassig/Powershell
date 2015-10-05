# History:
# 1.0 - Lennart Passig, Andreas Patt (Orange Networks GmbH) - 05.10.2015 - first draft

<#

.SYNOPSIS
This script simply reboots the machine.

.DESCRIPTION
This script schedules a reboot for the machine and gives a positive response when done. It does not wait for the reboot to occure. This is neccessary for ansible. 

.PARAMETER RebootTime
Number of Seconds to wait till reboot. Minimum is 5 Seconds, maximum is 3600 Seconds. Default Value is 5 Seconds.

.PARAMETER Force
Switch to use force for reboot (rebooting with logged-in users etc.)

.EXAMPLE
reboot.ps1 -RebootTime 10 -Force

.LINK
http://www.orange-networks.de/

#>

param(
    [ValidateRange(5,3600)]
    [String]$RebootTime = 5,
    [Switch]$Force
)

if ($force){
    start-process -FilePath shutdown -ArgumentList ("-r -f -t $RebootTime")
}

if (!($force)){
    start-process -FilePath shutdown -ArgumentList ("-r -t $RebootTime")
}

write-host "Reboot successfully scheduled in $RebootTime seconds"
