```PowerShell
$csv = Import-Csv -Path .\microsoftbloat.csv
foreach ($line in $csv) {
    Get-AppxPackage -Name $line.appxpkg | Remove-AppxPackage -Verbose
    Write-Output Windows bloat, $line.name removed!
}

```