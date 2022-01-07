oh-my-posh --init --shell pwsh --config ~/material.omp.json | Invoke-Expression
$REPO = "C:\Projects";
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

Set-Alias -Name ll -Value Get-ChildItem
function cdr(){
	Set-Location C:\Projects
}
Set-Alias -Name vim -Value nvim

function activate_venv(){
	# TODO 
	# Przeskakiwanie miedzy dwoma folderami gdzie sa venvy powinno zmieniac ten venv, a nie deaktywowac poprzedni tak jak robi to teraz
	if ($null -eq $env:VIRTUAL_ENV) {
		if (Test-Path -Path .\venv) {
			.\venv\Scripts\activate.ps1
		}
	} else {
		$venv_dir = Split-Path -Path $env:VIRTUAL_ENV
		if (!($pwd.Path).StartsWith($venv_dir)) {
			deactivate
		}
	}
}
function Set-Location(){
	Microsoft.PowerShell.Management\Set-Location "$Args";
	activate_venv;
}

Set-Alias -Name python39 -Value "C:\Python39\python.exe"
Set-Alias -Name python38 -Value "C:\Python38\python.exe"
