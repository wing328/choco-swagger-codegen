$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'swagger-codegen-2.2.2'
$bat = Join-Path $tools 'swagger-codegen.bat'
 
Install-ChocolateyPackage `
    -PackageName 'swagger-codegen' `
    -Url 'https://raw.githubusercontent.com/wing328/choco-swagger-codegen/master/zipped_jar/swagger-codegen-cli-2.2.2.zip' `
    -Checksum '52a3b9ee47ba1bd8caf69bb0592554e6e38a598ad2069902f8a5c450c740e23f' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package
 
Install-ChocolateyEnvironmentVariable `
    -VariableName 'SWAGGER_CODEGEN_HOME' `
    -VariableValue $content `
    -VariableType 'Machine'
 
Install-BinFile `
    -Name 'swagger-codegen' `
    -Path $bat
 
Update-SessionEnvironment
