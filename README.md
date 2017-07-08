# SSPowerShellBoilerplate

SSPowerShellBoilerplate is an opinionated Plaster template for jump starting Open Source PowerShell projects. This was mainly created for my own personal use, so it may require some tweaking for taste.

This project adheres to the Contributor Covenant [code of conduct](https://github.com/SeeminglyScience/SSPowerShellBoilerplate/tree/master/docs/CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable behavior to seeminglyscience@gmail.com.

## Features

- Supports projects that utilize C#, PowerShell or a combination of both.
- InvokeBuild build script.
- Basic README template, along with boilerplate CONTRIBUTING and CODE_OF_CONDUCT docs and MIT License.
- Strict default style rules.
- VSCode tasks and launch configurations.

## Installation

### Gallery

```powershell
Install-Module SSPowerShellBoilerplate -Scope CurrentUser
```

### Source

```powershell
git clone 'https://github.com/SeeminglyScience/SSPowerShellBoilerplate.git'
Set-Location .\SSPowerShellBoilerplate
Invoke-Build -Task Install
```

## Usage

### Get-PlasterTemplate

```powershell
$template = Get-PlasterTemplate -IncludeInstalledModules |
    Where-Object TemplatePath -Match 'SSPowerShellBoilerplate'

Invoke-Plaster -TemplatePath $template.TemplatePath
```

Invoke the template with no parameters.  This will prompt for the following information:

1. Destination
1. Module name
1. Language(s) to use
1. GitHub username
1. Full name (defaults to global git config)
1. Email (defaults to global git config)

### As an Editor Command

```powershell
# Place this in your Microsoft.VSCode_profile.ps1
Register-EditorCommand -Name SSPowerShellBoilerplate -DisplayName 'New Open Source PowerShell Project' -ScriptBlock {
    Import-Module SSPowerShellBoilerplate
    $templatePath = Join-Path (Get-Module SSPowerShellBoilerplate).ModuleBase SSPowerShellBoilerplate

    $plasterParams = @{
        TemplatePath    = $templatePath
        DestinationPath = $psEditor.Workspace.Path
        ModuleName      = (Split-Path $psEditor.Workspace.Path -Leaf)
        GitHubUser      = 'MyUserName'
        FullName        = 'MyFullName'
        Email           = 'MyEmailAddress'
    }
    Invoke-Plaster @plasterParams
}
```

Register an editor command (see [Using Editor Commands](http://powershell.github.io/PowerShellEditorServices/guide/extensions.html#using-editor-commands)) that scaffolds a PowerShell project in the current workspace.  The only prompt will be what language(s) you want to use, which can also set in the `$plasterParams` hashtable.

## Contributions Welcome!

We would love to incorporate community contributions into this project.  If you would like to
contribute code, documentation, tests, or bug reports, please read our [Contribution Guide](https://github.com/SeeminglyScience/SSPowerShellBoilerplate/tree/master/docs/CONTRIBUTING.md) to learn more.

## Roadmap

- [ ] Improve C# support
- [ ] Add useful breakpoints to `debugHarness.ps1`
- [ ] Add template for adding an individual C# class
- [ ] Add template for adding a PowerShell function
