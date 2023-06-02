
#--[ Generate a random GUID and assign to a variable ]--
$Guid = [System.Guid]::NewGUID().Guid

#--[ Generate a random GUID and send to the clipboard ]--
[System.Guid]::NewGUID().Guid | clip
