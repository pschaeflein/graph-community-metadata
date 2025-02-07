import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/sitePages.tsp";

using TypeSpec.Http;

@tag("Site Pages")
namespace Graph.Community.SitePages;

@route("/{serverRelativeSiteUrl}/_api/SitePages")
op List(
  ...ODataSelectParameter,
  ...CommonParameters,
): SPSitePagesCollectionResponse;

@tag("Site Pages")
@route("/{serverRelativeSiteUrl}/_api/SitePages/{id}")
op Get(
  @path id: int32,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
  ...CommonParameters,
): SitePage;
