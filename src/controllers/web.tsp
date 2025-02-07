import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/web.tsp";

using TypeSpec.Http;

@tag("Web")
namespace Graph.Community.Web;

@route("/{serverRelativeSiteUrl}/_api/web")
op Get(
  ...CommonParameters,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
): SPWebResponse;

@tag("Web")
@route("/{serverRelativeSiteUrl}/_api/web/ensureuser")
@opExample(#{ parameters: #{ req: #{logonName: "user@domain.com"}, serverRelativeSiteUrl:"/sites/mockSite", odataVersion:"4.0"} })
@post
op EnsureUser(
  /**
   * User principal name (UPN) or email address of the user.
   */
  @body req: EnsureUserRequest,
  ...CommonParameters,
): User;
