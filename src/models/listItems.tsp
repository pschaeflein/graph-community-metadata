import "@typespec/http";
import "./common.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Graph.Community;

model SPContentType {
  /**
   * The name of the content type.
   */
  Name: string;

  /**
   * The string identifier of the content type.
   */
  StringId: string;
}

model SPListItem {
  /**
   * The integer identifier of the list item.
   */
  Id: int32;

  /**
   * The title of the list item.
   */
  Title: string;

  /**
   * Field values rendered as HTML.
   * Requires $expand=FieldValuesAsHtml.
   */
  @extension("x-odata-expand", "FieldValuesAsHtml")
  FieldValuesAsHtml?: Record<string>;

  /**
   * Field values rendered as plain text.
   * Requires $expand=FieldValuesAsText.
   */
  @extension("x-odata-expand", "FieldValuesAsText")
  FieldValuesAsText?: Record<string>;

  /**
   * Field values for use in edit forms.
   * Requires $expand=FieldValuesForEdit.
   */
  @extension("x-odata-expand", "FieldValuesForEdit")
  FieldValuesForEdit?: Record<string>;

  /**
   * The content type of the list item.
   * Requires $expand=ContentType.
   */
  @extension("x-odata-expand", "ContentType")
  ContentType?: SPContentType;

  ContentTypeId: string;
}

model SPListItemResponse {
  ...OkResponse;
  ...Body<SPListItem>;
}

model SPListItemCollectionResponse {
  ...OkResponse;
  ...Body<CollectionResponse<SPListItem>>;
}
