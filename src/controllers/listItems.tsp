import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/listItems.tsp";

using TypeSpec.Http;

@tag("List Items")
namespace Graph.Community.ListItems;

@route("/{serverRelativeSiteUrl}/_api/web/lists/{id}/items")
/**
 * Returns all items in the specified list.
 */
op List(
  /**
   * The Id of the list.
   */
  @path
  @format("uuid")
  id: string,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
  ...CommonParameters,
): SPListItemCollectionResponse;

@route("/{serverRelativeSiteUrl}/_api/web/lists/{id}/items/{itemId}")
/**
 * Returns a specific item from the specified list.
 */
op Get(
  /**
   * The Id of the list.
   */
  @path
  @format("uuid")
  id: string,

  /**
   * The integer Id of the list item.
   */
  @path
  itemId: int32,

  ...ODataSelectParameter,
  ...ODataExpandParameter,
  ...CommonParameters,
): SPListItemResponse;
