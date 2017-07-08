$moduleName = 'SSPowerShellBoilerplate'
$manifestPath = "$PSScriptRoot\..\Release\$moduleName\*\$moduleName.psd1"

Describe 'module manifest values' {
    It 'can retrieve manfiest data' {
        $script:manifest = Test-ModuleManifest $manifestPath
    }
    It 'has the correct name' {
        $script:manifest.Name | Should Be $moduleName
    }
    It 'has the correct guid' {
        $script:manifest.Guid | Should Be '25cabcf6-ea88-4ea3-8b3b-5ff29f075922'
    }
}

