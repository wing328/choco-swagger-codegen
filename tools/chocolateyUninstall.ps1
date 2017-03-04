$tools = Split-Path $MyInvocation.MyCommand.Definition
$bat = Join-Path $tools 'swagger-codegen.bat'
 
Uninstall-BinFile `
    -Name 'swagger-codegen' `
    -Path $bat
