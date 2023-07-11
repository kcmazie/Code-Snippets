
#--[ Make an IPC connection to target system ]--
net use \\$TargetSystem\ipc$ /user:$UserName $Password | Out-Null 

#--[ Remove the connection ]--
net use \\$TargetSystem\ipc$ /d | Out-Null 

Sleep -Seconds 1