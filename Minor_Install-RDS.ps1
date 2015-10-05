# History:
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
http://www.orange-networks.de/
 
#>


workflow Minor_Install-Feature
{

#Define Outputtype
[OutputType([System.String])]

#Define Input-parameter
param(
[Parameter(Mandatory)]    
[string]$Targethost,
[Parameter(Mandatory)]    
[string]$FeatureName,
[Parameter(Mandatory)]    
[bool]$Reboot,
[Parameter(Mandatory)]    
[string]$DC_ComputerName,
[Parameter(Mandatory)]    
[pscredential]$DomainCredentials,
[Parameter(Mandatory)]    
[string]$DomainName,
[Parameter(Mandatory)]    
[string]$DomainNam
)


$resultRDSInstall = InlineScript
    {
        if ($Using:Reboot)
            {
            $result= Install-WindowsFeature –Name $Using:FeatureName -IncludeAllSubFeature -Restart
            }
        else
            {
            $result= Install-WindowsFeature –Name $Using:FeatureName -IncludeAllSubFeature 
            }
            
      return $result
    } -PSConnectionRetryCount 3 -PSConnectionRetryIntervalSec 60 

    return $resultRDSInstall
} 