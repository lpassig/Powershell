# History
# 1.0 - Lennart Passig (Orange Networks GmbH) - 08.05.2015 - first draft

<#
 
.SYNOPSIS
This is a Powershell workflow will try to install a Windows Feature. The retry count is 3 and the retry interval is 60 seconds.
 
.DESCRIPTION
The script itself will only print 'Hello World'. But that's cool. It's main objective is to show off the cool help thingy anyway.
 
.EXAMPLE
Minor_Install-Feature -Targethost "LON-SVR1" -FeatureName "Web-Server" -Reboot $false
 
.NOTES
Put some notes here.
 
.LINK
http//www.orange-networks.de/
 
#>

#Define Input-parameter
param(
[Parameter(Mandatory)]    
[string]$FeatureName,
[Parameter(Mandatory)]    
[switch]$AllSubFeature
)

        if ($AllSubFeature)
            {
            $result= Install-WindowsFeature –Name $FeatureName -IncludeAllSubFeature -IncludeManagementTools
            }
        elseif(!$AllSubFeature)
            {
            $result= Install-WindowsFeature –Name $FeatureName 
            }
            
      return $result