// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

public struct AnimeDetails: AnimeListAPI.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment AnimeDetails on Media { __typename id isAdult averageScore siteUrl duration genres trailer { __typename id site thumbnail } title { __typename english native } description coverImage { __typename large extraLarge } }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.Media }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("isAdult", Bool?.self),
    .field("averageScore", Int?.self),
    .field("siteUrl", String?.self),
    .field("duration", Int?.self),
    .field("genres", [String?]?.self),
    .field("trailer", Trailer?.self),
    .field("title", Title?.self),
    .field("description", String?.self),
    .field("coverImage", CoverImage?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    AnimeDetails.self
  ] }

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
  /// Media trailer or advertisement
  public var trailer: Trailer? { __data["trailer"] }
  /// The official titles of the media in various languages
  public var title: Title? { __data["title"] }
  /// Short description of the media's story and characters
  public var description: String? { __data["description"] }
  /// The cover images of the media
  public var coverImage: CoverImage? { __data["coverImage"] }

  /// Trailer
  ///
  /// Parent Type: `MediaTrailer`
  public struct Trailer: AnimeListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.MediaTrailer }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("id", String?.self),
      .field("site", String?.self),
      .field("thumbnail", String?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      AnimeDetails.Trailer.self
    ] }

    /// The trailer video id
    public var id: String? { __data["id"] }
    /// The site the video is hosted by (Currently either youtube or dailymotion)
    public var site: String? { __data["site"] }
    /// The url for the thumbnail image of the video
    public var thumbnail: String? { __data["thumbnail"] }
  }

  /// Title
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
      AnimeDetails.Title.self
    ] }

    /// The official english title
    public var english: String? { __data["english"] }
    /// Official title in it's native language
    public var native: String? { __data["native"] }
  }

  /// CoverImage
  ///
  /// Parent Type: `MediaCoverImage`
  public struct CoverImage: AnimeListAPI.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { AnimeListAPI.Objects.MediaCoverImage }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("large", String?.self),
      .field("extraLarge", String?.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      AnimeDetails.CoverImage.self
    ] }

    /// The cover image url of the media at a large size
    public var large: String? { __data["large"] }
    /// The cover image url of the media at its largest size. If this size isn't available, large will be provided instead.
    public var extraLarge: String? { __data["extraLarge"] }
  }
}
