# <%=$PLASTER_PARAM_ModuleName%>

<%=$PLASTER_PARAM_ModuleName%> is a PowerShell module that needs a description.

This project adheres to the Contributor Covenant [code of conduct](https://github.com/<%=$PLASTER_PARAM_GitHubUser%>/<%=$PLASTER_PARAM_ModuleName%>/tree/master/docs/CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report unacceptable behavior to <%=$PLASTER_PARAM_Email%>.

## Features

- Downloadable!

## Documentation

Check out our **[documentation](https://github.com/<%=$PLASTER_PARAM_GitHubUser%>/<%=$PLASTER_PARAM_ModuleName%>/tree/master/docs/<%=$PSCulture%>/<%=$PLASTER_PARAM_ModuleName%>.md)** for information about how to use this project.

## Installation

### Gallery

```powershell
Install-Module <%=$PLASTER_PARAM_ModuleName%> -Scope CurrentUser
```

### Source

```powershell
git clone 'https://github.com/<%=$PLASTER_PARAM_GitHubUser%>/<%=$PLASTER_PARAM_ModuleName%>.git'
Set-Location .\<%=$PLASTER_PARAM_ModuleName%>
Invoke-Build -Task Install
```

## Usage

### First example

```powershell
Import-Module <%=$PLASTER_PARAM_ModuleName%>
```

Imports <%=$PLASTER_PARAM_ModuleName%> into the current session.

## Contributions Welcome!

We would love to incorporate community contributions into this project.  If you would like to
contribute code, documentation, tests, or bug reports, please read our [Contribution Guide](https://github.com/<%=$PLASTER_PARAM_GitHubUser%>/<%=$PLASTER_PARAM_ModuleName%>/tree/master/docs/CONTRIBUTING.md) to learn more.
