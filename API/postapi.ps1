#url                        #hashtable(store the data) @{}
#endpoint
#content method
$URL = "https://api.github.com"
$Endpoint = "/gists"
$URLAnon = "$URL$Endpoint"

$JSON = ConvertTo-Json @{
    description = "the description for this gist";
    public = $true;
    "file1.txt" = @{
        content = "String file contents"
    }
}
$gist = Invoke-RestMethod -Method Post -Uri $URLAnon -Body $JSON

$Token - "?access_token = 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"
$URLSecure = "$URL$Endpoint$Token"

$gist = Invoke-RestMethod -Method Post -Uri $URLSecure -body $JSON

$URLEdit = "$URL$Endpoint/$($gist.id)$Token"



