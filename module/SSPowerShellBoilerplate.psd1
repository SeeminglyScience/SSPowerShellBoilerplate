#
# Module manifest for module 'SSPowerShellBoilerplate'
#
# Generated by: Patrick Meinecke
#
# Generated on: 7/7/2017
#

@{

# Version number of this module.
ModuleVersion = '0.1.0'

# ID used to uniquely identify this module
GUID = '25cabcf6-ea88-4ea3-8b3b-5ff29f075922'

# Author of this module
Author = 'Patrick Meinecke'

# Company or vendor of this module
CompanyName = 'Community'

# Copyright statement for this module
Copyright = '(c) 2017 Patrick Meinecke. All rights reserved.'

# Description of the functionality provided by this module
Description = 'An opinionated Plaster template for jump starting Open Source PowerShell projects.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
ProcessorArchitecture = 'None'

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# List of all files packaged with this module
FileList = 'SSPowerShellBoilerplate.psd1',
           'SSPowerShellBoilerplate\debugHarness.ps1',
           'SSPowerShellBoilerplate\LICENSE.txt',
           'SSPowerShellBoilerplate\Module.build.ps1',
           'SSPowerShellBoilerplate\plasterManifest.xml',
           'SSPowerShellBoilerplate\PSScriptAnalyzerSettings.psd1',
           'SSPowerShellBoilerplate\README_.md',
           'SSPowerShellBoilerplate\_gitattributes',
           'SSPowerShellBoilerplate\_gitignore',
           'SSPowerShellBoilerplate\doc\CODE_OF_CONDUCT.md',
           'SSPowerShellBoilerplate\doc\CONTRIBUTING.md',
           'SSPowerShellBoilerplate\module\Module.psd1',
           'SSPowerShellBoilerplate\module\Module.psm1',
           'SSPowerShellBoilerplate\module\Strings.psd1',
           'SSPowerShellBoilerplate\src\Module.csproj',
           'SSPowerShellBoilerplate\src\Module.ruleset',
           'SSPowerShellBoilerplate\src\Module.sln',
           'SSPowerShellBoilerplate\src\stylecop.json',
           'SSPowerShellBoilerplate\test\Module.T.ps1',
           'SSPowerShellBoilerplate\vscode\extensions.json',
           'SSPowerShellBoilerplate\vscode\launch.json',
           'SSPowerShellBoilerplate\vscode\settings.json',
           'SSPowerShellBoilerplate\vscode\tasks.json'


# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('Plaster', 'Template', 'Boilerplate', 'CodeGeneration', 'C#')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/SeeminglyScience/SSPowerShellBoilerplate/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/SeeminglyScience/SSPowerShellBoilerplate'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

        Extensions = @(
            @{
                Module = "Plaster"
                MinimumVersion = "1.0.1"
                Details = @{
                    TemplatePaths = @("SSPowerShellBoilerplate")
                }
            }
        )
    } # End of PSData hashtable

} # End of PrivateData hashtable

}



