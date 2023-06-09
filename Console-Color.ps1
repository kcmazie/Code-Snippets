

Function ConsoleColor {  #--[ Detect console color and adjust accordingly ]------------------------------
	If ((Get-Host).UI.RawUI.BackgroundColor -eq "White"){
		$Script:FgGreen = "DarkGreen"
		$Script:FgRed = "DarkRed"
		$Script:FgYellow = "DarkCyan"
		$Script:FgBlue = "DarkCyan"
		$Script:FgCyan = "DarkCyan"
		$Script:FgMagenta = "DarkCyan"
		$Script:FgGray = "DarkGray"
		$Script:FgText = "Black"
	}Else{
		$Script:FgGreen = "Green"
		$Script:FgRed = "Red"
		$Script:FgYellow = "Yellow"
		$Script:FgBlue = "Blue"
		$Script:FgCyan = "Cyan"
		$Script:FgMagenta = "Magenta"
		$Script:FgGray = "Gray"
		$Script:FgText = "White"
	}
}
		
ConsoleColor

If ($Script:Console){write-host "`n--[ Text Example ]--" -ForegroundColor $Script:FgGreen}
