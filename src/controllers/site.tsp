import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/site.tsp";

using TypeSpec.Http;

@tag("Site")
namespace Graph.Community.Site;

@route("/{serverRelativeSiteUrl}/_api/site")
/**
 * Returns basic information about the site. (To get complete information, use the Microsoft Graph endpoint.)
 */
op Get(
  ...CommonParameters,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
): SPSite;
