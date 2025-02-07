import "@typespec/http";
import "./common.tsp";
import "./siteScripts.tsp";

using TypeSpec.Http;

namespace Graph.Community;

model SiteDesignMetadata {
  @format("uuid")
  Id: string;

  Description: string;
  IsDefault: boolean;
  PreviewImageAltText: string;
  PreviewImageUrl: string;
  SiteScriptIds: string[];
  ThumbnailUrl: url;
  Title: string;
  WebTemplate: string;
  Version: int32;
}

model SiteDesignRun {
  @format("uuid")
  SiteDesignID: string;

  SiteDesignTitle: string;
  SiteDesignVersion: int32;

  @format("uuid")
  SiteID: string;

  @format("uuid")
  WebID: string;

  /**
   * Appears to be the Unix Epoch timestamp
   */
  StartTime: int64;
}

model ListSiteDesignsResponse {
  ...OkResponse;
  ...Body<CollectionResponse<SiteDesignMetadata>>;
}

model SiteDesignMetadataRequest {
  /**
   * The ID of the site design.
   */
  @format("uuid")
  id: string;
}

model SiteDesignMetadataResponse {
  ...OkResponse;
  ...Body<SiteDesignMetadata>;
}

model ApplySiteDesignRequest {
  /**
   * The ID of the site design to apply.
   */
  @format("uuid")
  siteDesignId: string;

  /**
   * The URL of the site collection where you want to apply the site design.
   */
  @format("uri")
  webUrl: string;
}

model ApplySiteDesignResponse {
  ...OkResponse;
  ...Body<CollectionResponse<SiteScriptActionResult>>;
}

model GetSiteDesignRunsResponse {
  ...OkResponse;
  ...Body<CollectionResponse<SiteDesignRun>>;
}

model CreateSiteDesignRequestInfo {
  /**
   * The display name of the site design.
   */
  Title: string;

  /**
   * Identifies which base template to add the design to. Use the value 64 for the Team site template, and the value 68 for the Communication site template.
   */
  WebTemplate: string;

  /**
   * An array of one or more site scripts. Each is identified by an ID. The scripts will run in the order listed.
   */
  SiteScriptIds: string[];

  /**
   * The display description of site design.
   */
  Description?: string;

  /**
   * The URL of a preview image. If none is specified, SharePoint uses a generic image.
   */
  PreviewImageUrl?: string;

  /**
   * The alt text description of the preview image for accessibility.
   */
  PreviewImageAltText?: string;
}

model CreateSiteDesignRequest {
  info: CreateSiteDesignRequestInfo;
}

model UpdateSiteDesignRequest {
  updateInfo: UpdateSiteDesignInfo;
}

model UpdateSiteDesignInfo {
  /**
   * The ID of the site design to update.
   */
  @format("uuid")
  Id: string;

  /**
   * The new display name of the updated site design.
   */
  Title?: string;

  /**
   *  The new template to add the site design to. Use the value 64 for the Team site template, and the value 68 for the Communication site template.
   */
  WebTemplate?: string;

  /**
   * A new array of one or more site scripts. Each is identified by an ID. The scripts run in the order listed.
   */
  SiteScripts?: string[];

  /**
   * The new description of the site script.
   */
  Description?: string;

  /**
   * The new URL of a preview image.
   */
  PreviewImageUrl?: string;

  /**
   * The new alt text description of the preview image for accessibility.
   */
  PreviewImageAltText?: string;

  /**
   * The new version number of the site script.
   */
  Version?: int32;
}
