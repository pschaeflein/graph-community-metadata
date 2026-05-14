import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/search.tsp";

using TypeSpec.Http;

namespace Graph.Community.Search;

@tag("Search")
@route("/{serverRelativeSiteUrl}/_api/search/postquery")
@post
op PostQuery(
  /**
   * The search query to execute.
   */
  @body req: SearchQueryRequest,
  ...CommonParameters,
): SearchQueryResponse;