import "@typespec/http";
import "./common.tsp";
import "./siteScripts.tsp";

using TypeSpec.Http;

namespace Graph.Community;

model SiteScriptMetadata {
  @format("uuid")
  Id: string;
  /**
   * JSON value that describes the script. For more information, see https://learn.microsoft.com/en-us/sharepoint/dev/declarative-customization/site-design-json-schema
   */
  Content: string;
  Description: string;
  Title: string;
  Version: int32;
}

model SiteScriptActionResult {
  ErrorCode: int32;

  /**
   *  Success=0,
   *  Failure=1,
   *  NoOp=2,
   *  SucceededWithException=3
   */
  Outcome: int32;
  OutcomeText: string;
  Title: string;
  Verb: string;
}

model GetSiteScriptsResponse {
  ...OkResponse;
  ...Body<CollectionResponse<SiteScriptMetadata>>;
}

model SiteScriptMetadataRequest {
  /**
   * The ID of the site script.
   */
  @format("uuid")
  id: string;
}

model SiteScriptMetadataResponse {
  ...OkResponse,
  ...Body<SiteScriptMetadata>;
}

model CreateSiteScriptRequest {
  $schema: "schema.json";
  version: int32;
  bindata: Record<unknown>;
  actions: unknown[];
}

model UpdateSiteScriptRequest {
  updateInfo: UpdateInfo;
}

model UpdateInfo {
  /**
   * The ID of the site script to update.
   */
  @format("uuid")
  Id: string;

  /**
   * The new display name of the site script.
   */
  Title?: string;

  /**
   * The new description of the site script.
   */
  Description?: string;

  /**
   * The new version number of the site script.
   */
  Version?: int32;

  /**
   * A new JSON script defining the script actions. For more information, see https://learn.microsoft.com/en-us/sharepoint/dev/declarative-customization/site-design-json-schema
   */
  Content?: string;
}