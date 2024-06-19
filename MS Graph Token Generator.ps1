#Creates a Token to be used for Graph Commands



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
