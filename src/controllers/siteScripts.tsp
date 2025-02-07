import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/common.tsp";
import "../models/siteScripts.tsp";

using TypeSpec.Http;

@tag("Site Design/Site Script")
namespace Graph.Community.SiteScripts;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteScripts")
@doc("Gets a list of information on all existing site scripts.")
@post
op List(...CommonParameters): GetSiteScriptsResponse;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/GetSiteScriptMetadata")
@doc("Gets information about a specific site script. It also returns the JSON of the script.")
@post
op Get(
  @body req: SiteScriptMetadataRequest,
  ...CommonParameters
): SiteScriptMetadataResponse;


@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/CreateSiteScript(Title=@title,Description=@description)")
@doc("Creates a new site script.")
@post
op Create(
  /**
   * The display name of the site design.
   */
  @query "@title": string,
  @query "@description": string,
  ...CommonParameters,
  @body req: Record<unknown>,
): SiteScriptMetadataResponse;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/UpdateSiteScript")
@doc("Updates a site script with new values. In the REST call, all parameters are optional except the site script Id.")
@post
op Update(
  ...CommonParameters,
  @body req: UpdateSiteScriptRequest
): SiteScriptMetadataResponse;

@route("/{serverRelativeSiteUrl}/_api/SiteScriptUtility/DeleteSiteScript")
@doc("Deletes a site script.")
@post
op Delete(
  @body req: SiteScriptMetadataRequest,
  ...CommonParameters
): AcceptedResponse;
