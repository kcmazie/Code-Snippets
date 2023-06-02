

Function GetConsoleHost {  #--[ Detect if we are using a script editor or the console ]--
    $Console = $False
    Switch ($Host.Name){
        'consolehost'{
            Write-Host "PowerShell Console"
        }
        'Windows PowerShell ISE Host'{
            Write-Host "PowerShell ISE"
            $Console = $True
        }
        'PrimalScriptHostImplementation'{
            Write-Host "PrimalScript or PowerShell Studio"
            $Console = $True
        }
        "Visual Studio Code Host" {
            Write-Host "Visual Studio Code"
            $Console = $True
        }
    }
    Return $Console
}

GetConsoleHost
 