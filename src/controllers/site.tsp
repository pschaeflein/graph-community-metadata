import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/site.tsp";

using TypeSpec.Http;

namespace Graph.Community;

@tag("Site")
@route("/{serverRelativeSiteUrl}/_api/site")
op GetSite(
  ...CommonParameters,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
): Site;
