import "@typespec/http";
import "../models/web.tsp";

using TypeSpec.Http;

namespace Graph.Community;

model Site {
  Id: string;
  HubSiteId: string;
  IsHubSite: boolean;
  GroupId: string;
  ServerRelativeUrl: string;

  /**
   * Represents the unique sequential location of a change within the change log.
   */
  CurrentChangeToken?: ChangeToken;

  GeoLocation?: string;
  PrimaryUri: url;
}

model SPSiteResponse {
  ...OkResponse;
  ...Body<Site>;
}