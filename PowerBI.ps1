Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser
Login-PowerBI
$result = Invoke-PowerBIRestMethod -Url "https://api.powerbi.com/v1.0/myorg/datasets/46cd2d67-22e7-4029-b29a-1c1d57928a52/refreshes?$top=1" -Method Get

$wokspaceContents = $result | ConvertFrom-Json