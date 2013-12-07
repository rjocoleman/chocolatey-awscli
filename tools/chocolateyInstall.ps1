try {
	$packageName = 'awscli'
	$installerType = 'msi'
	$url = 'https://s3.amazonaws.com/aws-cli/AWSCLI32.msi'
	$url64 = 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
	$silentArgs = '/qn'
	$validExitCodes = @(0)

	Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
	$programFiles = $env:programfiles
	$awscliPath = Join-Path $programFiles 'Amazon\AWSCLI'

	Install-ChocolateyPath $awscliPath 'machine'
	$env:Path += ";$awscliPath"
	Write-ChocolateySuccess "$packageName"
} catch {
	Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
	throw
}
