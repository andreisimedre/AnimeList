// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct AnimeListQuery: GraphQLQuery {
  public static let operationName: String = "AnimeListQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AnimeListQuery($perPage: Int, $page: Int) { Page(perPage: $perPage, page: $page) { __typename pageInfo { __typename currentPage hasNextPage } media { __typename ...AnimeDetails } } }"#,
      fragments: [AnimeDetails.self]
    ))

  public var perPage: GraphQLNullable<Int32>
  public var page: GraphQLNullable<Int32>

  public init(
    perPage: GraphQLNullable<Int32>,
    page: GraphQLNullable<Int32>
  ) {
    self.perPage = perPage
    self.page = page
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "perPage": perPage,
    "page": page
  ] }

  public struct Data: AnimeListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "perPage": .variable("perPage"),
        "page": .variable("page")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      AnimeListQuery.Data.self
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AnimeListAPI.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Page }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pageInfo", PageInfo?.self),
        .field("media", [Medium?]?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        AnimeListQuery.Data.Page.self
      ] }

      /// The pagination information
      public var pageInfo: PageInfo? { __data["pageInfo"] }
      public var media: [Medium?]? { __data["media"] }

      /// Page.PageInfo
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
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AnimeListQuery.Data.Page.PageInfo.self
        ] }

        /// The current page
        public var currentPage: Int? { __data["currentPage"] }
        /// If there is another page
        public var hasNextPage: Bool? { __data["hasNextPage"] }
      }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AnimeListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Media }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(AnimeDetails.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AnimeListQuery.Data.Page.Medium.self,
          AnimeDetails.self
        ] }

        /// The id of the media
        public var id: Int { __data["id"] }
        /// A weighted average score of all the user's scores of the media
        public var averageScore: Int? { __data["averageScore"] }
        /// The url for the media page on the AniList website
        public var siteUrl: String? { __data["siteUrl"] }
        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// Short description of the media's story and characters
        public var description: String? { __data["description"] }
        /// The banner image of the media
        public var bannerImage: String? { __data["bannerImage"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var animeDetails: AnimeDetails { _toFragment() }
        }

        public typealias Title = AnimeDetails.Title

        public typealias CoverImage = AnimeDetails.CoverImage
      }
    }
  }
}
