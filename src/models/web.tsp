import "@typespec/http";

import "./userCustomAction.tsp";
import "./regionalSettings.tsp";
import "./securityPrincipals.tsp";

using TypeSpec.Http;

namespace Graph.Community;

model SPWeb {
  /**
   * The site identifier for the site.
   */
  Id:string;

  /**
   * The title for the website.
   */
  Title: string;

  /**
   * The change token that is used when the next change is logged to the website.
   */
  CurrentChangeToken?:ChangeToken;

  FooterEnabled?:boolean;

  /**
   * Footer layout type:
   *   Simple = 0,
   *   Extended = 1,
   *   Stacked = 2
   */
  FooterLayout: int32;

  AssociatedMemberGroup?: SPGroup;

  AssociatedOwnerGroup?: SPGroup;

  AssociatedVisitorGroup?: SPGroup;

  /**
   * The name of the site definition or site template that was used to create the site.
   */
  WebTemplate: string;

  WelcomePage: string;

  RegionalSettings?: RegionalSettings;

  SiteUsers: SPUser[];

  UserCustomActions: UserCustomAction[];
}

model ChangeToken {
  StringValue?: string;
}

model SPWebResponse {
  ...OkResponse;
  ...Body<SPWeb>;
}

model EnsureUserRequest {
  /**
   * User principal name (UPN) or email address of the user.
   */
  logonName: string;
}
