//
//  Album.swift
//  groupProj
//
//  Created by Julie Connors on 8/26/21.
//

import Foundation

struct AlbumList: Codable {
    let results: [Album]
}

struct Album: Codable {
    let collectionName: String
    let artworkUrl100: String
    let collectionPrice: Double
}
