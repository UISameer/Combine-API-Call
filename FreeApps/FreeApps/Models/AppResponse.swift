import Foundation

struct AppsResponse: Codable {
    let feed: Feed
}

    // MARK: - Feed
struct Feed: Codable {
    let results: [Applications]
}

    // MARK: - Result
public struct Applications: Codable {
    let id: String
    var artistName, name, releaseDate: String
    let artworkUrl100: String
    let url: String
    
    static func createEmptyApp() -> Applications {
        return Applications(id: "", artistName: "", name: "", releaseDate: "", artworkUrl100: "", url: "")
    }
}
