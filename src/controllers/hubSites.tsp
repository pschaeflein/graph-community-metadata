import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/common.tsp";
import "../models/hubSites.tsp";

using TypeSpec.Http;

@tag("Hub sites")
namespace Graph.Community.HubSites;

@route("/{serverRelativeSiteUrl}/_api/HubSites")
@doc("Gets information about all hub sites that the current user can access.")
@get
op List(...CommonParameters): SPHubSiteCollectionResponse;
