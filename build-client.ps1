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

# - Remove the 'With___' bits from SiteScripts ...
Rename-Item -Path $apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScriptWithTitleWithDescription -NewName CreateSiteScript
Rename-Item -Path $apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScript/CreateSiteScriptWithTitleWithDescriptionRequestBuilder.cs -NewName CreateSiteScriptRequestBuilder.cs
Rename-Item -Path $apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScript/CreateSiteScriptWithTitleWithDescriptionPostRequestBody.cs -NewName CreateSiteScriptPostRequestBody.cs

$SiteScriptUtilityRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/SiteScriptUtilityRequestBuilder.cs"
(Get-Content $SiteScriptUtilityRequestBuilder) -replace "CreateSiteScriptWithTitleWithDescription", "CreateSiteScript" | Set-Content $SiteScriptUtilityRequestBuilder

# - Add the namespace bits to SiteScripts
$GetSiteScriptsRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteScripts/GetSiteScriptsRequestBuilder.cs"
(Get-Content $GetSiteScriptsRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteScripts", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteScripts" | Set-Content $GetSiteScriptsRequestBuilder

$GetSiteScriptMetadataRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteScriptMetadata/GetSiteScriptMetadataRequestBuilder.cs"
(Get-Content $GetSiteScriptMetadataRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteScriptMetadata", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteScriptMetadata" | Set-Content $GetSiteScriptMetadataRequestBuilder

$CreateSiteScriptRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScript/CreateSiteScriptRequestBuilder.cs"
(Get-Content $CreateSiteScriptRequestBuilder) -replace "CreateSiteScriptWithTitleWithDescription", "CreateSiteScript" | Set-Content $CreateSiteScriptRequestBuilder
(Get-Content $CreateSiteScriptRequestBuilder) -replace "/_api/SiteScriptUtility/CreateSiteScript", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.CreateSiteScript" | Set-Content $CreateSiteScriptRequestBuilder

$CreateSiteScriptPostRequestBody = "$apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScript/CreateSiteScriptPostRequestBody.cs"
(Get-Content $CreateSiteScriptPostRequestBody) -replace "CreateSiteScriptWithTitleWithDescription", "CreateSiteScript" | Set-Content $CreateSiteScriptPostRequestBody

$CreateSiteScriptPostRequestBody = "$apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteScript/CreateSiteScriptPostRequestBody.cs"
(Get-Content $CreateSiteScriptPostRequestBody) -replace "CreateSiteScriptWithTitleWithDescription", "CreateSiteScript" | Set-Content $CreateSiteScriptPostRequestBody

$UpdateSiteScriptRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/UpdateSiteScript/UpdateSiteScriptRequestBuilder.cs"
(Get-Content $UpdateSiteScriptRequestBuilder) -replace "/_api/SiteScriptUtility/UpdateSiteScript", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.UpdateSiteScript" | Set-Content $UpdateSiteScriptRequestBuilder

$DeleteSiteScriptRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/DeleteSiteScript/DeleteSiteScriptRequestBuilder.cs"
(Get-Content $DeleteSiteScriptRequestBuilder) -replace "/_api/SiteScriptUtility/DeleteSiteScript", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.DeleteSiteScript" | Set-Content $DeleteSiteScriptRequestBuilder

# - Add the namespace bits to SiteDesigns
$GetSiteDesignsRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteDesigns/GetSiteDesignsRequestBuilder.cs"
(Get-Content $GetSiteDesignsRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteDesigns", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteDesigns" | Set-Content $GetSiteDesignsRequestBuilder

$GetSiteDesignMetadataRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/GetSiteDesignMetadata/GetSiteDesignMetadataRequestBuilder.cs"
(Get-Content $GetSiteDesignMetadataRequestBuilder) -replace "/_api/SiteScriptUtility/GetSiteDesignMetadata", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.GetSiteDesignMetadata" | Set-Content $GetSiteDesignMetadataRequestBuilder

$ApplySiteDesignRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/ApplySiteDesign/ApplySiteDesignRequestBuilder.cs"
(Get-Content $ApplySiteDesignRequestBuilder) -replace "/_api/SiteScriptUtility/ApplySiteDesign", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.ApplySiteDesign" | Set-Content $ApplySiteDesignRequestBuilder

$CreateSiteDesignRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteDesign/CreateSiteDesignRequestBuilder.cs"
(Get-Content $CreateSiteDesignRequestBuilder) -replace "/_api/SiteScriptUtility/CreateSiteDesign", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.CreateSiteDesign" | Set-Content $CreateSiteDesignRequestBuilder

$CreateSiteScriptRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/CreateSiteDesign/CreateSiteDesignRequestBuilder.cs"
(Get-Content $CreateSiteDesignRequestBuilder) -replace "/_api/SiteScriptUtility/CreateSiteDesign", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.CreateSiteDesign" | Set-Content $CreateSiteDesignRequestBuilder

$UpdateSiteDesignRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/UpdateSiteDesign/UpdateSiteDesignRequestBuilder.cs"
(Get-Content $UpdateSiteDesignRequestBuilder) -replace "/_api/SiteScriptUtility/UpdateSiteDesign", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.UpdateSiteDesign" | Set-Content $UpdateSiteDesignRequestBuilder

$DeleteSiteDesignRequestBuilder = "$apiclientFolder/Item/_api/SiteScriptUtility/DeleteSiteDesign/DeleteSiteDesignRequestBuilder.cs"
(Get-Content $DeleteSiteDesignRequestBuilder) -replace "/_api/SiteScriptUtility/DeleteSiteDesign", "/_api/Microsoft.SharePoint.Utilities.WebTemplateExtensions.SiteScriptUtility.DeleteSiteDesign" | Set-Content $DeleteSiteDesignRequestBuilder

# - Convert list id to a function
$ListsItemRequestBuilder = "$apiclientFolder/Item/_api/Web/Lists/Item/ListsItemRequestBuilder.cs"
(Get-Content $ListsItemRequestBuilder) -replace "/_api/web/lists/{id}", "/_api/web/lists/getById('{id}')" | Set-Content $ListsItemRequestBuilder

# - Remove the 'With___' bits from /list/GetByTitle...
$ListsRequestBuilder = "$apiclientFolder/Item/_api/Web/Lists/ListsRequestBuilder.cs"
(Get-Content $ListsRequestBuilder) -replace "public global::Graph.Community.Item._api.Web.Lists.GetByTitleWithTitle.GetByTitleWithTitleRequestBuilder GetByTitleWithTitle", "public global::Graph.Community.Item._api.Web.Lists.GetByTitleWithTitle.GetByTitleWithTitleRequestBuilder GetByTitle" | Set-Content $ListsRequestBuilder

# - Add the 'pages' segment to SitePages
$SitePagesRequestBuilder = "$apiclientFolder/Item/_api/SitePages/SitePagesRequestBuilder.cs"
(Get-Content $SitePagesRequestBuilder) -replace "/_api/SitePages", "/_api/SitePages/Pages" | Set-Content $SitePagesRequestBuilder
$SitePagesItemRequestBuilder = "$apiclientFolder\Item\_api\SitePages\Item\SitePagesItemRequestBuilder.cs"
(Get-Content $SitePagesItemRequestBuilder) -replace "/_api/SitePages/{id}", "/_api/SitePages/Pages({id})" | Set-Content $SitePagesItemRequestBuilder

dotnet test $graphCommunityFolder/graph-community-spclient.sln

Write-Host "Complete."
