<%
if ($PLASTER_PARAM_SourceType -contains 'PowerShell') {
    '#requires -Module InvokeBuild, PSScriptAnalyzer, Pester, PlatyPS -Version 5.1'
} else {
    '#requires -Module InvokeBuild, Pester, PlatyPS -Version 5.1'
}
if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
@'

[CmdletBinding()]
param(
    [ValidateSet('Debug', 'Release')]
    [string]
    $Configuration = 'Debug',

    [ValidateSet('net40')]
    [string]
    $Framework = 'net40'
)
'@
} else {
'[CmdletBinding()]
param()'
}
%>

$moduleName = '<%=$PLASTER_PARAM_ModuleName%>'
$manifest   = Test-ModuleManifest -Path          $PSScriptRoot\module\$moduleName.psd1 `
                                  -ErrorAction   Ignore `
                                  -WarningAction Ignore

$script:Settings = @{
    Name          = $moduleName
    Manifest      = $manifest
    Version       = $manifest.Version
<%
    if ($PLASTER_PARAM_SourceType -contains 'PowerShell') {
        '    ShouldAnalyze = $true
'
    }
%>    ShouldTest    = $true
}

$script:Folders  = @{
    PowerShell = "$PSScriptRoot\module"
<%
    if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
@'
    CSharp     = "$PSScriptRoot\src"
    Build      = '{0}\src\{1}\bin\{2}\{3}' -f $PSScriptRoot, $moduleName, $Configuration, $Framework

'@
    }
%>    Release    = '{0}\Release\{1}\{2}' -f $PSScriptRoot, $moduleName, $manifest.Version
    Docs       = "$PSScriptRoot\docs"
    Test       = "$PSScriptRoot\test"
<%
    if ($PLASTER_PARAM_SourceType -contains 'PowerShell') {
    '    PesterCC   = "$PSScriptRoot\*.psm1", "$PSScriptRoot\Public\*.ps1", "$PSScriptRoot\Private\*.ps1"
'
    }
%>}

$script:Discovery = @{
    HasDocs       = Test-Path ('{0}\{1}\*.md' -f $Folders.Docs, $PSCulture)
    HasTests      = Test-Path ('{0}\*.Test.ps1' -f $Folders.Test)
}

task Clean {
    if (Test-Path $script:Folders.Release) {
        Remove-Item $script:Folders.Release -Recurse
    }
    $null = New-Item $script:Folders.Release -ItemType Directory
<%
if ($PLASTER_PARAM_SourceType -contains 'CSharp') {'    dotnet clean
'}
%>}

task BuildDocs -If { $script:Discovery.HasDocs } {
    $null = New-ExternalHelp -Path       $PSScriptRoot\docs\$PSCulture `
                             -OutputPath ('{0}\{1}' -f $script:Folders.Release, $PSCulture)
}

<%
if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
'task BuildDll {
    dotnet build -c $Configuration -f $Framework
}

'
}
%>task CopyToRelease  {
    Copy-Item -Path ('{0}\*' -f $script:Folders.PowerShell) `
              -Destination $script:Folders.Release `
              -Recurse `
              -Force
<%
    if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
        @'

    Copy-Item -Path ('{0}\{1}*' -f $script:Folders.Build, $script:Settings.Name) `
              -Destination $script:Folders.Release

'@
    }
%>}

<%
if ($PLASTER_PARAM_SourceType -contains 'PowerShell') {
'task Analyze -If { $script:Settings.ShouldAnalyze } {
    Invoke-ScriptAnalyzer -Path     $script:Folders.Release `
                          -Settings $PSScriptRoot\ScriptAnalyzerSettings.psd1 `
                          -Recurse
}

'
}
%>task Test -If { $script:Discovery.HasTests -and $script:Settings.ShouldTest } {
    Invoke-Pester <%=if ($PLASTER_PARAM_SourceType -contains 'CSharp') { '-CodeCoverage $script:Folders.PesterCC ' }%>-PesterOption @{ IncludeVSCodeMarker = $true }
}

task DoInstall {
    $installBase = $Home
    if ($profile) { $installBase = $profile | Split-Path }
    $installPath = '{0}\Modules\{1}\{2}' -f $installBase, $script:Settings.Name, $script:Settings.Version

    if (-not (Test-Path $installPath)) {
        $null = New-Item $installPath -ItemType Directory
    }

    Copy-Item -Path ('{0}\*' -f $script:Folders.Release) `
              -Destination $installPath `
              -Force `
              -Recurse
}

task DoPublish {
<%
if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
@'
    if ($Configuration -eq 'Debug') {
        throw 'Configuration must not be Debug to publish!'
    }


'@
}
%>    if (-not (Test-Path $env:USERPROFILE\.PSGallery\apikey.xml)) {
        throw 'Could not find PSGallery API key!'
    }

    $apiKey = (Import-Clixml $env:USERPROFILE\.PSGallery\apikey.xml).GetNetworkCredential().Password
    Publish-Module -Name $script:Folders.Release -NuGetApiKey $apiKey -Confirm
}

<%
if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
    'task Build -Jobs Clean, BuildDll, CopyToRelease'
} else {
    'task Build -Jobs Clean, CopyToRelease'
}
'' # Adds a new line
if ($PLASTER_PARAM_SourceType -contains 'PowerShell') {
    'task PreRelease -Jobs Build, Analyze, Test'
} else {
    'task PreRelease -Jobs Build, Test'
}
%>

task Install -Jobs PreRelease, DoInstall

task Publish -Jobs PreRelease, DoPublish

task . Build
