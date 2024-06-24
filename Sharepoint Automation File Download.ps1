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



$outfile = "" #where you want to put the folder/file



$Headers = @{
    
    "Authorization" = "Bearer $Token"
}

$siteID = "" #Site ID of tenant

$DriveID = "" #Folder Library



$uri = "https://graph.microsoft.com/v1.0/sites/$siteID/Drives/$driveID/items/root:/<path to file>:/content" #edit this to put the file path to what you want to download
$MessageParams = @{
    "URI"         = $uri
    "Headers"     = $Headers
    "Method"      = "GET"
    "Body"        = $Content
}

$Response = Invoke-WebRequest -Method GET -URI $uri -Headers $Headers -ContentType 'multipart/form-data' -OutFile $outfile 

