[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimTransportMode csv_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"DimTransportMode csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimTransportMode.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"TransportModeKey", Int64.Type}, {"Transport_Mode", type text}, {"ModeGroup", type text}})
in
  #"Changed column type";
shared #"DimTransportMode csv_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  TableNavigation = Navigation_2{[Id = "Transport Mode", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimProductCategory csv_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"DimProductCategory csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimProductCategory.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"ProductCategoryKey", Int64.Type}, {"Product_Category", type text}, {"CategoryGroup", type text}}),
  #"Trimmed text" = Table.TransformColumns(#"Changed column type", {{"Product_Category", each Text.Trim(_), type nullable text}}),
  #"Uppercased text" = Table.TransformColumns(#"Trimmed text", {{"CategoryGroup", each Text.Upper(_), type nullable text}})
in
  #"Uppercased text";
shared #"DimProductCategory csv_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  TableNavigation = Navigation_2{[Id = "Dim Product Category", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimPort csv_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"DimPort csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimPort.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 3, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"PortKey", Int64.Type}, {"PortName", type text}, {"PortRegion", type text}})
in
  #"Changed column type";
shared #"DimPort csv_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  TableNavigation = Navigation_2{[Id = "DimPort", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DimDate csv_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared #"DimDate csv" = let
  Source = Lakehouse.Contents(null),
  Navigation = Source{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  #"Navigation 1" = Navigation{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Id = "Files", ItemKind = "Folder"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DimDate.csv"]}[Content],
  #"Imported CSV" = Csv.Document(#"Navigation 3", [Delimiter = ",", Columns = 10, QuoteStyle = QuoteStyle.None]),
  #"Promoted headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars = true]),
  #"Changed column type" = Table.TransformColumnTypes(#"Promoted headers", {{"DateKey", Int64.Type}, {"Date", type date}, {"Year", Int64.Type}, {"Quarter", type text}, {"MonthNo", Int64.Type}, {"MonthName", type text}, {"YearMonth", type date}, {"WeekNo", Int64.Type}, {"Day", Int64.Type}, {"DayName", type text}})
in
  #"Changed column type";
shared #"DimDate csv_DataDestination" = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false, EnableFolding = false, HierarchicalNavigation = null, EnableVorder = true, OutputMetadataRefresh = true]),
  Navigation_1 = Pattern{[workspaceId = "f7750814-3e39-485b-ac87-6b7d059fdeb1"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "83edc301-a168-4d6b-b1ce-8280621e913a"]}[Data],
  TableNavigation = Navigation_2{[Id = "DimDate", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
