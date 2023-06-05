

Function LoadConfig ($Config){
    #--[ Incommin "config" variable should either be the contents of the  file or the word 'failed' ]--
    If ($Config -ne "failed"){
    $XmlOption = New-Object -TypeName psobject 
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "Domain" -Value $Config.Settings.General.Domain
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "SourcePath" -Value $Config.Settings.General.SourcePath 
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "SmtpServer" -Value $Config.Settings.General.SmtpServer 
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "SmtpPort" -Value $Config.Settings.General.SmtpPort
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "ExcelSourceFile" -Value $Config.Settings.General.ExcelSourceFile 
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "ExcelWorkingCopy" -Value $Config.Settings.General.ExcelWorkingCopy
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "PasswordFile" -Value $Config.Settings.Credentials.PasswordFile
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "KeyFile" -Value $Config.Settings.Credentials.KeyFile
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "WAPUser" -Value $Config.Settings.Credentials.WAPUser
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "WAPPass" -Value $Config.Settings.Credentials.WAPPass
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "AltUser" -Value $Config.Settings.Credentials.AltUser
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "AltPass" -Value $Config.Settings.Credentials.AltPass
    $XmlOption | Add-Member -Force -MemberType NoteProperty -Name "Recipients" -Value $Config.Settings.Recipients
    }Else{
        StatusMsg "MISSING XML CONFIG FILE.  File is required.  Script aborted..." " Red" $True
        $Message = ('--[ External XML config file example ]-----------------------------------
--[ To be named the same as the script and located in the same folder as the script ]--

<?xml version="1.0" encoding="utf-8"?>
<Settings>
    <General>
        <SmtpServer>mailserver.company.org</SmtpServer>
        <SmtpPort>25</SmtpPort>
        <RecipientEmail>InformationTechnology@company.org</RecipientEmail>
        <SourcePath>C:\folder</SourcePath>
        <ExcelSourceFile>+NetworkedDevice-Master-Inventory.xlsx</ExcelSourceFile>
        <ExcelWorkingCopy>NetworkedDevice-Master-Inventory.xlsx</ExcelWorkingCopy>
        <Domain>company.org</Domain>
    </General>
    <Credentials>
        <PasswordFile>c:\AESPass.txt</PasswordFile>
        <KeyFile>c:\AESKey.txt</KeyFile>
        <WAPUser>admin</WAPUser>
        <WAPPass>wappass</WAPPass>
        <AltUser>user1</AltUser>
        <AltPass>userpass1</AltPass>
    </Credentials>    
    <Recipients>
        <Recipient>me@comapny.org</Recipient>
        <Recipient>you@comapny.org</Recipient>
        <Recipient>them@comapny.org</Recipient>
    </Recipients>
</Settings> ')
Write-host $Message -ForegroundColor Yellow
    }
    Return $XmlOption
}


#--[ Load external XML options file ]------------------------------------------------
$ConfigFile = $PSScriptRoot+"\"+($MyInvocation.MyCommand.Name.Split("_")[0]).Split(".")[0]+".xml"
Write-host "Configfile  ="$ConfigFile -ForegroundColor Green

If (Test-Path $ConfigFile){                          #--[ Error out if configuration file doesn't exist ]--
    [xml]$Config = Get-Content $ConfigFile           #--[ Read & Load XML ]--  
    $ExtOption = LoadConfig $Config 
}Else{
    LoadConfig "failed"
    break;break;break
}


#--[ Example for how to use the variables ]--
Write-host "Scriptroot  ="$PSScriptRoot -ForegroundColor Yellow
Write-host "SMTP Server ="$ExtOption.SmtpServer -ForegroundColor Yellow
Write-host "Key file    ="$ExtOption.KeyFile -ForegroundColor Yellow
Write-host "Source Path ="$ExtOption.SourcePath -ForegroundColor Yellow
ForEach ($Recipient in $ExtOption.Recipients){
    Write-host $Recipient -ForegroundColor Cyan
}

$ExtOption.Recipients
