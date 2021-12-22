Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser
Login-PowerBI
$result = Invoke-PowerBIRestMethod -Url "https://api.powerbi.com/v1.0/myorg/datasets/46cd2d67-22e7-4029-b29a-1c1d57928a52/refreshes?$top=1" -Method GET
$wokspaceContents = $result | ConvertFrom-Json
$wokspaceContents.value[0]

$convData = $wokspaceContents.value[0] | ConvertTo-Html -Fragment

$apiJson = @"
<!DOCTYPE html>
<html lang="pt">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link href="https://bootswatch.com/5/superhero/bootstrap.css" rel="stylesheet" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Relatório de Atualização do BI</title>
 </head>
 <body>
 <div class='table table-striped mx-auto text-center'>
    $convData
 </div>
 </body>
</html>
"@ | Out-File report.html
