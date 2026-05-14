import "@typespec/http";

using TypeSpec.Http;

namespace Graph.Community;

model SearchQueryRequest {
  request: SearchQuery;
}

model SearchQuery {
  Querytext: string;
  RowLimit?: int32;
  RowsPerPage?: int32;
  StartRow?: int32;
  SelectProperties?: SelectProperties;
  SortList?: SortList;
  Refiners?: string;
  TrimDuplicates?: boolean;
}

model SelectProperties {
  results: string[];
}

model SortList {
  results: Sort[];
}

model Sort {
  Property: string;
  direction: string;
}

enum SortDirection {
  Ascending: "0",
  Descending: "1",
}

model SearchQueryResponse {
  ...OkResponse;
  ...Body<SearchResult>;
}

model SearchResult {
  ElapsedTime: int32;
  PrimaryQueryResult: QueryResult;
}

model QueryResult {
  CustomResults: CustomResult[];
  QueryId: string;
  QueryRuleId: string;
  RefinementResults: RefinementResults | null;
  RelevantResults: RelevantResults;
}

model CustomResult {}

model RefinementResults {
  GroupTemplateId: string | null;
  ItemTemplateId: string | null;
  Properties: ResultKeyValuePair[];
  Refiners: Refiner[];
  ResultTitle: string | null;
  ResultTitleUrl: string | null;
}

model Refiner {
  Entries: RefinerEntry[];
  Name: string;
}

model RefinerEntry {
  RefinementCount: string;
  RefinementName: string;
  RefinementToken: string;
  RefinementValue: string;
}

model RelevantResults {
  GroupTemplateId: string | null;
  ItemTemplateId: string | null;
  Properties: ResultKeyValuePair[];
  ResultTitle: string | null;
  ResultTitleUrl: string | null;
  RowCount: int32;
  Table: SearchResultTable;
}

model SearchResultTable {
  Rows: SearchResultRow[];
}

model SearchResultRow {
  Cells: ResultKeyValuePair[];
}

model ResultKeyValuePair {
  Key: string;
  Value: string | null;
  ValueType: string;
}
