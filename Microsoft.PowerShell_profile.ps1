using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# pracowe
function cdr(){
	Set-Location C:\Projects
}

Set-Alias -Name python39 -Value C:\Python39\python.exe
Set-Alias -Name python310 -Value C:\Python310\python.exe
# / pracowe

Import-Module -Name Terminal-Icons
Import-Module oh-my-posh
Import-Module PSReadLine

oh-my-posh --init --shell pwsh --config ~/material.omp.json | Invoke-Expression

Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim
function vinit() {
	nvim $HOME\AppData\Local\nvim\init.vim
}

Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias jq "$HOME\jq-win64.exe"

. C:\Projects\PowerShell\autoenv\autoenv.ps1
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

function touch() {
	foreach ($arg in $args){
		Write-Output $null > $arg
	}
}

function which($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Definition -ErrorAction SilentlyContinue
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

try {
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
} catch {}
Set-PSReadLineOption -EditMode Windows

# `ForwardChar` accepts the entire suggestion text when the cursor is at the end of the line.
# This custom binding makes `RightArrow` behave similarly - accepting the next word instead of the entire suggestion text.
Set-PSReadLineKeyHandler -Key RightArrow `
                         -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
                         -LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($cursor -lt $line.Length) {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptNextSuggestionWord($key, $arg)
    }
}


function unzipAll($inputString) {
    Get-ChildItem -Path *.zip | ForEach-Object {Expand-Archive -Path $_.FullName}
}

function zipAll($inputString) {
	Get-ChildItem -Directory | ForEach-Object {Compress-Archive $_\* -DestinationPath ".\$($_.Name).zip"}
}
