import "@typespec/http";
import "./common.tsp";

using TypeSpec.Http;

namespace Graph.Community;

model SiteDesign {
  @format("uuid")
  DesignPackageId: string;

  DesignType: int32;
  IsOutOfBoxTemplate: boolean;
  IsTenantAdminOnly: boolean;
  ListColor: int32;
  ListIcon: int32;
  PreviewImageAltText: string;
  PreviewImageUrl: string;
  RequiresGroupConnected: boolean;
  RequiresTeamsConnected: boolean;
  RequiresYammerConnected: boolean;
  SiteScriptIds: string[];
  SupportedWebTemplates: string[];
  TemplateFeatures: string[];
  ThumbnailUrl: string;
  Title: string;
  WebTemplate: string;
  Order: string;
}

model SiteDesignCollection {
  ...OkResponse;
  ...Body<CollectionResponse<SiteDesign>>;
}

model SiteDesignMetadataRequest {
  /**
   * The ID of the site design.
   */
  @format("uuid")
  id: string;
}
