import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/common.tsp";
import "../models/siteDesigns.tsp";

using TypeSpec.Http;

namespace Graph.Community;

@tag("Site Designs")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteDesigns")
@doc("Gets a list of information about existing site designs.")
@post
op GetSiteDesigns(...CommonParameters): SiteDesignCollection;

@tag("Site Designs")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteDesignMetadata")
@doc("Gets information about a specific site design.")
@post
op GetSiteDesignMetadata(
  @body req: SiteDesignMetadataRequest,
  ...CommonParameters,
): SiteDesign;
