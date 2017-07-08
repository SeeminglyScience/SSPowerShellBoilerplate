Import-LocalizedData -BindingVariable Strings -FileName Strings -ErrorAction Ignore
<%
    if ($PLASTER_PARAM_SourceType -contains 'CSharp') {
        '
Import-Module $PSScriptRoot\<%=$PLASTER_PARAM_ModuleName%>.dll'
    }
%>

# Include all function files.
Get-ChildItem $PSScriptRoot\Public\*.ps1, $PSScriptRoot\Private\*.ps1 | ForEach-Object {
    . $PSItem.FullName
}

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-*<%=if ($PLASTER_PARAM_SourceType -contains 'CSharp') { ' -Cmdlet *-*' }%>
