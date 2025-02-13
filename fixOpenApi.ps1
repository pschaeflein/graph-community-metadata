$openApiFile = "./dist/@typespec/openapi3/openapi.json"
$docsApiFile = "./docs/openapi.json"
# read output from typespec
$json = Get-Content -Raw -Path $openApiFile | ConvertFrom-Json
# update the info object
$info = $json.info
$xLogo = @{
  url = "https://pschaeflein.github.io/graph-community-metadata/graph-community-spclient.png"
  backgroundColor = "#FFFFFF"
  altText = "Graph.Community SDK for Microsoft SharePoint REST API"
}
if (Get-Member -InputObject $info -Name "x-logo" -MemberType Properties) {}
else { Add-Member -InputObject $info -MemberType NoteProperty -Name "x-logo" -Value $xLogo }
# update the discriminator mapping
$mapping = $json.components.schemas.SPPrincipal.discriminator.mapping
if (Get-Member -InputObject $mapping -Name "#SP.Group" -MemberType Properties) {}
else { Add-Member -InputObject $mapping -MemberType NoteProperty -Name "#SP.Group" -Value "#/components/schemas/SPGroup" }
if (Get-Member -InputObject $mapping -Name "#SP.User" -MemberType Properties) {}
else { Add-Member -InputObject $mapping -MemberType NoteProperty -Name "#SP.User" -Value "#/components/schemas/SPUser" }
#write docs file
$json | ConvertTo-Json -Depth 100 | Set-Content -Path $docsApiFile
