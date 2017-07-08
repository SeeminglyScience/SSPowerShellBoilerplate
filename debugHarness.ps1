# Use this file to debug the module.

$destinationPath = "$PSScriptRoot\PlasterTesting"

if (Test-Path $destinationPath) {
    Remove-Item $destinationPath -Recurse -Force
}

Invoke-Plaster -TemplatePath $PSScriptRoot\module\SSPowerShellBoilerplate `
               -DestinationPath $destinationPath `
               -ModuleName PlasterTesting `
               -SourceType PowerShell,CSharp `
               -FullName 'PowerShell User' `
               -Email 'powershelluser@contoso.net' `
               -GitHubUser 'PowerShellUser'
