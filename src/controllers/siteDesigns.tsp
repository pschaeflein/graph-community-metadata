import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/common.tsp";
import "../models/siteDesigns.tsp";

using TypeSpec.Http;

@tag("Site Design/Site Script")
namespace Graph.Community.SiteDesigns;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteDesigns")
@doc("Gets a list of information about existing site designs.")
@post
op List(...CommonParameters): ListSiteDesignsResponse;

@tag("Site Design/Site Script")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteDesignMetadata")
@doc("Gets information about a specific site design.")
@post
op Get(
  @body req: SiteDesignMetadataRequest,
  ...CommonParameters,
): SiteDesignMetadataResponse;

@tag("Site Design/Site Script")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteDesignRuns")
@post
op GetRuns(...CommonParameters): GetSiteDesignRunsResponse;

@tag("Site Design/Site Script")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/ApplySiteDesign")
@doc("Applies a site design to an existing site collection.")
@post
op Apply(
  @body req: ApplySiteDesignRequest,
  ...CommonParameters,
): ApplySiteDesignResponse;

@tag("Site Design/Site Script")
@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/CreateSiteDesign")
@doc("")
@post
op Create(
  @body req: CreateSiteDesignRequest,
  ...CommonParameters,
): SiteDesignMetadataResponse;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/UpdateSiteDesign")
@doc("Updates a site design with new values. In the REST call, all parameters are optional except the site script Id.")
@post
op Update(
  ...CommonParameters,
  @body req: UpdateSiteDesignRequest
): SiteDesignMetadataResponse;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/DeleteSiteDesign")
@doc("Deletes a site design.")
@post
op Delete(
  @body req: SiteDesignMetadataRequest,
  ...CommonParameters
): AcceptedResponse;
