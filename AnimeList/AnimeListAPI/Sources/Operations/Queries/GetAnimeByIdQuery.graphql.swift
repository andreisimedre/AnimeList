// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct GetAnimeByIdQuery: GraphQLQuery {
  public static let operationName: String = "GetAnimeById"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAnimeById($id: Int, $page: Int, $perPage: Int) { Media(id: $id) { __typename ...AnimeDetails characters(page: $page, sort: [ROLE], perPage: $perPage) { __typename pageInfo { __typename currentPage hasNextPage total } nodes { __typename id name { __typename full } image { __typename medium } } } } }"#,
      fragments: [AnimeDetails.self]
    ))

  public var id: GraphQLNullable<Int32>
  public var page: GraphQLNullable<Int32>
  public var perPage: GraphQLNullable<Int32>

  public init(
    id: GraphQLNullable<Int32>,
    page: GraphQLNullable<Int32>,
    perPage: GraphQLNullable<Int32>
  ) {
    self.id = id
    self.page = page
    self.perPage = perPage
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "id": id,
    "page": page,
    "perPage": perPage
  ] }

  public struct Data: AnimeListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Media", Media?.self, arguments: ["id": .variable("id")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetAnimeByIdQuery.Data.self
    ] }

    /// Media query
    public var media: Media? { __data["Media"] }

    /// Media
    ///
    /// Parent Type: `Media`
    public struct Media: AnimeListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Media }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("characters", Characters?.self, arguments: [
          "page": .variable("page"),
          "sort": ["ROLE"],
          "perPage": .variable("perPage")
        ]),
        .fragment(AnimeDetails.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetAnimeByIdQuery.Data.Media.self,
        AnimeDetails.self
      ] }

      /// The characters in the media
      public var characters: Characters? { __data["characters"] }
      /// The id of the media
      public var id: Int { __data["id"] }
      /// If the media is intended only for 18+ adult audiences
      public var isAdult: Bool? { __data["isAdult"] }
      /// A weighted average score of all the user's scores of the media
      public var averageScore: Int? { __data["averageScore"] }
      /// The url for the media page on the AniList website
      public var siteUrl: String? { __data["siteUrl"] }
      /// The general length of each anime episode in minutes
      public var duration: Int? { __data["duration"] }
      /// The genres of the media
      public var genres: [String?]? { __data["genres"] }
      /// The official titles of the media in various languages
      public var title: Title? { __data["title"] }
      /// Short description of the media's story and characters
      public var description: String? { __data["description"] }
      /// The cover images of the media
      public var coverImage: CoverImage? { __data["coverImage"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var animeDetails: AnimeDetails { _toFragment() }
      }

      /// Media.Characters
      ///
      /// Parent Type: `CharacterConnection`
      public struct Characters: AnimeListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.CharacterConnection }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pageInfo", PageInfo?.self),
          .field("nodes", [Node?]?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetAnimeByIdQuery.Data.Media.Characters.self
        ] }

        /// The pagination information
        public var pageInfo: PageInfo? { __data["pageInfo"] }
        public var nodes: [Node?]? { __data["nodes"] }

        /// Media.Characters.PageInfo
        ///
        /// Parent Type: `PageInfo`
        public struct PageInfo: AnimeListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.PageInfo }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("currentPage", Int?.self),
            .field("hasNextPage", Bool?.self),
            .field("total", Int?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetAnimeByIdQuery.Data.Media.Characters.PageInfo.self
          ] }

          /// The current page
          public var currentPage: Int? { __data["currentPage"] }
          /// If there is another page
          public var hasNextPage: Bool? { __data["hasNextPage"] }
          /// The total number of items. Note: This value is not guaranteed to be accurate, do not rely on this for logic
          public var total: Int? { __data["total"] }
        }

        /// Media.Characters.Node
        ///
        /// Parent Type: `Character`
        public struct Node: AnimeListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Character }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("name", Name?.self),
            .field("image", Image?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetAnimeByIdQuery.Data.Media.Characters.Node.self
          ] }

          /// The id of the character
          public var id: Int { __data["id"] }
          /// The names of the character
          public var name: Name? { __data["name"] }
          /// Character images
          public var image: Image? { __data["image"] }

          /// Media.Characters.Node.Name
          ///
          /// Parent Type: `CharacterName`
          public struct Name: AnimeListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.CharacterName }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("full", String?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeByIdQuery.Data.Media.Characters.Node.Name.self
            ] }

            /// The character's first and last name
            public var full: String? { __data["full"] }
          }

          /// Media.Characters.Node.Image
          ///
          /// Parent Type: `CharacterImage`
          public struct Image: AnimeListAPI.SelectionSet {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.CharacterImage }
            @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("medium", String?.self),
            ] }
            @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetAnimeByIdQuery.Data.Media.Characters.Node.Image.self
            ] }

            /// The character's image of media at medium size
            public var medium: String? { __data["medium"] }
          }
        }
      }

      public typealias Title = AnimeDetails.Title

      public typealias CoverImage = AnimeDetails.CoverImage
    }
  }
}
