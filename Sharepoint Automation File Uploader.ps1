#Automation Template Job to send files to a Sharepoint Library and Site



#API Access KEy for Microsoft Graph
$ClientID = ''
$TenantID = ''
$client_secret = ''
$Scope = "https://graph.microsoft.com/.default"

$url = 'https://login.microsoftonline.com/' + $tenantId + '/oauth2/v2.0/token'


$body = @{
    grant_type = "client_credentials"
    client_id = $ClientID
    client_secret = $client_secret
    scope = "https://graph.microsoft.com/.default"
}

$tokenRequest = Invoke-WebRequest -Method Post -Uri $url -ContentType "application/x-www-form-urlencoded" -Body $body

$token = ($tokenRequest.Content | ConvertFrom-Json).access_token


$Filepath = "" #location of file
$FileName = "" #File Name
$Content = [System.IO.File]::ReadAllBytes($Filepath)
$Headers = @{
    "Content-Type" = “text/plain”
    "Authorization" = "Bearer $Token"
}

$siteID = "" #Site ID (aka the sharepoint site)

$DriveID = "" #DriveID (aka the folders in the sharepoint site)

$uri = "https://graph.microsoft.com/v1.0/sites/$siteID/Drives/$driveID/root:/$Filename`:/content"

$MessageParams = @{
    "URI"         = $uri
    "Headers"     = $Headers
    "Method"      = "PUT"
    "Body"        = $Content
}
$Response = Invoke-WebRequest -Method Put -URI $uri -Headers $Headers -Body $Content 
