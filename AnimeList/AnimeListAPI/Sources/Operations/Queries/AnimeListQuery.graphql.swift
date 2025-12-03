// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct AnimeListQuery: GraphQLQuery {
  public static let operationName: String = "AnimeListQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query AnimeListQuery { Page { __typename media { __typename siteUrl title { __typename english native } description bannerImage coverImage { __typename large } } } }"#
    ))

  public init() {}

  public struct Data: AnimeListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self),
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
        .field("media", [Medium?]?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        AnimeListQuery.Data.Page.self
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AnimeListAPI.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Media }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("siteUrl", String?.self),
          .field("title", Title?.self),
          .field("description", String?.self),
          .field("bannerImage", String?.self),
          .field("coverImage", CoverImage?.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          AnimeListQuery.Data.Page.Medium.self
        ] }

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

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AnimeListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.MediaTitle }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("english", String?.self),
            .field("native", String?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AnimeListQuery.Data.Page.Medium.Title.self
          ] }

          /// The official english title
          public var english: String? { __data["english"] }
          /// Official title in it's native language
          public var native: String? { __data["native"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: AnimeListAPI.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.MediaCoverImage }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("large", String?.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            AnimeListQuery.Data.Page.Medium.CoverImage.self
          ] }

          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
        }
      }
    }
  }
}
