// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AnimeListAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AnimeListAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AnimeListAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AnimeListAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Character": return AnimeListAPI.Objects.Character
    case "CharacterConnection": return AnimeListAPI.Objects.CharacterConnection
    case "CharacterImage": return AnimeListAPI.Objects.CharacterImage
    case "CharacterName": return AnimeListAPI.Objects.CharacterName
    case "Media": return AnimeListAPI.Objects.Media
    case "MediaCoverImage": return AnimeListAPI.Objects.MediaCoverImage
    case "MediaTitle": return AnimeListAPI.Objects.MediaTitle
    case "MediaTrailer": return AnimeListAPI.Objects.MediaTrailer
    case "Page": return AnimeListAPI.Objects.Page
    case "PageInfo": return AnimeListAPI.Objects.PageInfo
    case "Query": return AnimeListAPI.Objects.Query
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
