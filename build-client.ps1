Write-Host "Building client..."

$openapiFolder = "./docs"
$graphCommunityFolder = "../graph-community-spclient"
$apiclientFolder = "$graphCommunityFolder/codegen/lib/apiclient"

tsp compile src/main.tsp --emit @typespec/openapi3

# Fix OpenApi doc
./fixOpenApi.ps1

# Generate client
kiota generate -l csharp -d "$openapiFolder/openapi.json" -c SPClient -n Graph.Community -o $apiclientFolder --cc --co --ebc

# Update URL templates

# - Remove the 'With___' bits from /web/GetFileBy...
$WebRequestBuilder = "$apiclientFolder/Item/_api/Web/WebRequestBuilder.cs"
(Get-Content $WebRequestBuilder) -replace "GetFileByIdWithId\(Guid\? id\)", "GetFileById(Guid? id)" | Set-Content $WebRequestBuilder
(Get-Content $WebRequestBuilder) -replace "public global::Graph.Community.Item._api.Web.GetFileByServerRelativePathWithPath.GetFileByServerRelativePathWithPathRequestBuilder GetFileByServerRelativePathWithPath", "public global::Graph.Community.Item._api.Web.GetFileByServerRelativePathWithPath.GetFileByServerRelativePathWithPathRequestBuilder GetFileByServerRelativePath" | Set-Content $WebRequestBuilder

# - Add the namespace bits to SiteDesigns
$GetSiteDesignsRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteDesigns/GetSiteDesignsRequestBuilder.cs"
(Get-Content $GetSiteDesignsRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteDesigns", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteDesigns" | Set-Content $GetSiteDesignsRequestBuilder

$GetSiteDesignMetadataRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteDesignMetadata/GetSiteDesignMetadataRequestBuilder.cs"
(Get-Content $GetSiteDesignMetadataRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteDesignMetadata", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteDesignMetadata" | Set-Content $GetSiteDesignMetadataRequestBuilder

# - Convert list id to a function
$ListsItemRequestBuilder = "$apiclientFolder/Item/_api/Web/Lists/Item/ListsItemRequestBuilder.cs"
(Get-Content $ListsItemRequestBuilder) -replace "/_api/web/lists/{id}", "/_api/web/lists/getById('{id}')" | Set-Content $ListsItemRequestBuilder

# - Add the 'pages' segment to SitePages
$SitePagesRequestBuilder = "$apiclientFolder/Item/_api/SitePages/SitePagesRequestBuilder.cs"
(Get-Content $SitePagesRequestBuilder) -replace "/_api/SitePages", "/_api/SitePages/Pages" | Set-Content $SitePagesRequestBuilder
$SitePagesItemRequestBuilder = "$apiclientFolder\Item\_api\SitePages\Item\SitePagesItemRequestBuilder.cs"
(Get-Content $SitePagesItemRequestBuilder) -replace "/_api/SitePages/{id}", "/_api/SitePages/Pages({id})" | Set-Content $SitePagesItemRequestBuilder

dotnet test $graphCommunityFolder/graph-community-spclient.sln

Write-Host "Complete."
