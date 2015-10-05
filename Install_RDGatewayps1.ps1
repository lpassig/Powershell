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

# The server cannot be joined to the domain. First, install the AD DS server role and management tools:
$ResultAddRODCAccount = InlineScript 
    {
      
      Invoke-Command -Credential $Using:DomainCredentials -UseSSL -ComputerName $Using:DC_ComputerName -ScriptBlock 
      { 
      Add-ADDSReadOnlyDomainControllerAccount –DomainControllerAccountName  $Using:RODC_ComputerName ol–DomainName corp.contoso.com –SiteName Boston DelegatedAdministratoraccountName PilarA 
      }
    }


# Install Windows Feature
$ResultInstallFeature = InlineScript 
    {
      
       Invoke-Command -Credential $Using:DomainCredentials -UseSSL -ComputerName $Using:RODC_ComputerName -ScriptBlock { install-windowsfeature –name AD-Domain-Services -includemanagementtools}
       
    } 

# The server cannot be joined to the domain. First, install the AD DS server role and management tools:
$ResultInstallRODC = InlineScript 
    {
      
      Install-ADDSDomainController –DomainName corp.contoso.com –SafeModeAdministratorPassword (read-host –prompt "DSRM Password:" –assecurestring) –credential (get-credential Corp\PilarA) -useexistingaccount

    }


}