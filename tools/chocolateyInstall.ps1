﻿try {
	$packageName = 'awscli'
	$installerType = 'msi'
	$url = 'https://s3.amazonaws.com/aws-cli/AWSCLI32.msi'
	$url64 = 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
	$silentArgs = '/qn'
	$validExitCodes = @(0)

	Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
	$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
	$programFiles = $env:programfiles
	if ($is64bit) {$programFiles = ${env:ProgramFiles(x86)}}
	$awscliPath = Join-Path $programFiles 'Amazon\AWSCLI'

	Install-ChocolateyPath $awscliPath 'user'
	Write-ChocolateySuccess "$packageName"
} catch {
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}