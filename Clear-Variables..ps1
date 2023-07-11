Clear-Host 

#--[ Preserve Initial System Variables ]----------------------------------------
$startupVariables=""
New-Variable -force -name startupVariables -value (Get-Variable | % { $_.Name })

function Cleanup-Variables {
  Get-Variable | Where-Object { $startupVariables -notcontains $_.Name } | % { Remove-Variable -Name "$($_.Name)" -Force -Scope "global" -ErrorAction SilentlyContinue}
}


Cleanup-Variables
#-----------------------------------------------------------------------------------

Function Clean-Memory {
Get-Variable | Where-Object { $startupVariables -notcontains $_.Name } | ForEach-Object {
  	try { Remove-Variable -Name "$($_.Name)" -Force -Scope "global" -ErrorAction SilentlyContinue -WarningAction SilentlyContinue}
  	catch { }
 	}
}

#--[ Store all the start up variables so you can clean up when the script finishes. ]--
if ($startupvariables) { try {Remove-Variable -Name startupvariables  -Scope Global -ErrorAction SilentlyContinue } catch { } }
New-Variable -force -name startupVariables -value ( Get-Variable | ForEach-Object { $_.Name } ) 


Clean-Memory