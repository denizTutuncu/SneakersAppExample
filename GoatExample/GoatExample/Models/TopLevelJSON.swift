//
//  Shoe.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import Foundation

// MARK: - TopLevel
struct TopLevelJSON: Codable {
    let count: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count, results
    }
    
    public init(count: Int, results: [Result]) {
        self.count = count
        self.results = results
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        results = try container.decode([Result].self, forKey: .results)
    }
}

// MARK: - Result
struct Result: Codable, Identifiable, Equatable {
    
    let id, sku, brand, name, colorway, gender, silhouette, releaseDate, story: String?
    let releaseYear, retailPrice, estimatedMarketValue: Int?
    let image: ResultImage?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, sku, brand, name, colorway, gender, silhouette, releaseDate, story
        case releaseYear, retailPrice, estimatedMarketValue
        case links
        case image
    }
    public init(id: String, sku: String, brand: String, name: String, colorway: String, gender: String, silhouette: String, releaseYear: Int, releaseDate: String, retailPrice: Int, estimatedMarketValue: Int, story: String, image: ResultImage, links: Links) {
        self.id = id
        self.sku = sku
        self.brand = brand
        self.name = name
        self.colorway = colorway
        self.gender = gender
        self.silhouette = silhouette
        self.releaseDate = releaseDate
        self.releaseYear = releaseYear
        self.retailPrice = retailPrice
        self.estimatedMarketValue = estimatedMarketValue
        self.story = story
        self.image = image
        self.links = links
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        sku = try container.decodeIfPresent(String.self, forKey: .sku) ?? ""
        brand = try container.decodeIfPresent(String.self, forKey: .brand) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        colorway = try container.decodeIfPresent(String.self, forKey: .colorway) ?? ""
        gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? ""
        silhouette = try container.decodeIfPresent(String.self, forKey: .silhouette) ?? ""
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        releaseYear = try container.decodeIfPresent(Int.self, forKey: .releaseYear) ?? 0000
        retailPrice = try container.decodeIfPresent(Int.self, forKey: .retailPrice) ?? 0000
        estimatedMarketValue = try container.decodeIfPresent(Int.self, forKey: .estimatedMarketValue) ?? 0000
        story = try container.decodeIfPresent(String.self, forKey: .story) ?? "Unknown Story"
        image = try container.decodeIfPresent(ResultImage.self, forKey: .image) ?? ResultImage(id: "", original: "", small: "", thumbnail: "")
        links = try container.decodeIfPresent(Links.self, forKey: .links) ?? Links(id: "", stockx: "", goat: "", flightClub: "")
    }
}

// MARK: - Image
struct ResultImage: Codable, Identifiable, Equatable {
    public var id: String? = UUID().uuidString
    let original, small, thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case id, original, small, thumbnail
    }
    
    public init(id: String, original: String, small: String, thumbnail: String) {
        self.id = id
        self.original = original
        self.small = small
        self.thumbnail = thumbnail
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        original = try container.decodeIfPresent(String.self, forKey: .original) ?? ""
        small = try container.decodeIfPresent(String.self, forKey: .small) ?? ""
        thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
        
    }
}

// MARK: - Links
struct Links: Codable, Identifiable, Equatable {
    public var id: String? = UUID().uuidString
    let stockx, goat, flightClub: String?
    
    enum CodingKeys: String, CodingKey {
        case id, stockx, goat, flightClub
    }
    
    public init(id: String, stockx: String, goat: String, flightClub: String) {
        self.id = id
        self.stockx = stockx
        self.goat = goat
        self.flightClub = flightClub
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        stockx = try container.decodeIfPresent(String.self, forKey: .stockx) ?? ""
        goat = try container.decodeIfPresent(String.self, forKey: .goat) ?? ""
        flightClub = try container.decodeIfPresent(String.self, forKey: .flightClub) ?? ""
    }
}
