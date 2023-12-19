import Foundation

struct AppsResponse: Codable {
    let feed: Feed
}

    // MARK: - Feed
struct Feed: Codable {
    let results: [App]
}

    // MARK: - Result
public struct App: Codable {
    let artistName, id, name, releaseDate: String
    let artworkUrl100: String
    let url: String
}
