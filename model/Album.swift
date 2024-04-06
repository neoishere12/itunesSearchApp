//
//  Album.swift
//  itunesSearchApp
//
//  Created by Nitin Singh Manhas on 06/04/24.
//

import Foundation


// MARK: - Result
struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

// MARK: - Result
struct Album: Codable,Identifiable {
    let wrapperType, collectionType: String
    let id: Int
    let artistID: Int
    let amgArtistID: Int?
    let artistName, collectionName, collectionCensoredName: String
    let artistViewURL, collectionViewURL: String
    let artworkUrl60, artworkUrl100: String
    let collectionPrice: Double
    let collectionExplicitness: String
    let trackCount: Int
    let copyright, country, currency: String
    let releaseDate: String
    let primaryGenreName: String
    let contentAdvisoryRating: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName, collectionCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100, collectionPrice, collectionExplicitness, trackCount, copyright, country, currency, releaseDate, primaryGenreName, contentAdvisoryRating
    }
}
