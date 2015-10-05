# History:
# 1.0 - Lennart Passig (Orange Networks GmbH) - 08.05.2015 - first draft

<#
 
.SYNOPSIS
This is a simple Powershell script to explain how to create help
 
.DESCRIPTION
The script itself will only print 'Hello World'. But that's cool. It's main objective is to show off the cool help thingy anyway.
 
.EXAMPLE
./
 
.NOTES
Put some notes here.
 
.LINK
http://www.orange-networks.de/
 
#>


workflow Major_Install-RDGateway
{

#Define Outputtype
[OutputType([System.String])]

#Define Input-parameter
param(
[Parameter(Mandatory)]    
[string]$RDGateway,
[Parameter(Mandatory)]    
[string]$ConnectionBroker,
[Parameter(Mandatory)]    
[string]$DC_ComputerName,
[Parameter(Mandatory)]    
[string]$DC_ComputerName,
[Parameter(Mandatory)]    
[pscredential]$DomainCredentials,
[Parameter(Mandatory)]    
[string]$DomainName,
[Parameter(Mandatory)]    
[string]$DomainNam
)





}