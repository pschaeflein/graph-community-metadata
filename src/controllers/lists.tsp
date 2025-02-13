import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "../models/list.tsp";

using TypeSpec.Http;

@tag("Lists")
namespace Graph.Community.Lists;

@route("/{serverRelativeSiteUrl}/_api/web/lists")
/**
 * Returns basic information about all lists in the site. (To get complete information, use the Microsoft Graph endpoint.)
 */
op List(
  ...CommonParameters,
  ...ODataSelectParameter,
): SPListCollectionResponse;

@route("/{serverRelativeSiteUrl}/_api/web/lists/{id}")
/**
 * Returns specific information about the list. (To get complete information, use the Microsoft Graph endpoint.)
 */
op Get(
  /**
   * The Id of the list.
   */
  @path
  @format("uuid")
  id: string,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
  ...CommonParameters,
): SPListResponse;

@route("/{serverRelativeSiteUrl}/_api/web/lists/GetByTitle('{title}')")
/**
 * Returns specific information about the list. (To get complete information, use the Microsoft Graph endpoint.)
 */
op GetByTitle(
  /**
   * The Title of the list.
   */
  @path
  title: string,
  ...ODataSelectParameter,
  ...ODataExpandParameter,
  ...CommonParameters,
): SPListResponse;

