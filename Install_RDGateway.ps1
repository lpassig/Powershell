# History:
# 1.0 - Lennart Passig - 08.05.2015 - first draft

workflow Install-RDGateway
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