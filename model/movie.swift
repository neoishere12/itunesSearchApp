//
//  movie.swift
//  itunesSearchApp
//
//  Created by Nitin Singh Manhas on 06/04/24.
//

import Foundation

struct movieResult: Codable {
    let resultCount: Int
    let results: [movie]
}

// MARK: - Result
struct movie: Codable {
    let wrapperType, kind: String
    let collectionID: Int?
    let trackID: Int
    let artistName: String
    let collectionName: String?
    let trackName: String
    let collectionCensoredName: String?
    let trackCensoredName: String
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL: String?
    let trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Double
    let trackHDPrice, trackHDRentalPrice: Double
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: String
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int
    let country, currency, primaryGenreName, contentAdvisoryRating: String
    let shortDescription: String?
    let longDescription: String
    let hasITunesExtras: Bool?

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionArtistID = "collectionArtistId"
        case collectionArtistViewURL = "collectionArtistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
        case collectionHDPrice = "collectionHdPrice"
        case trackHDPrice = "trackHdPrice"
        case trackHDRentalPrice = "trackHdRentalPrice"
        case releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, shortDescription, longDescription, hasITunesExtras
    }
}
