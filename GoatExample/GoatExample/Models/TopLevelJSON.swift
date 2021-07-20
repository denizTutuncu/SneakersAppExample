//
//  Shoe.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import Foundation

// MARK: - TopLevelJSON
public struct TopLevelJSON: Codable {
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
public struct Result: Codable, Identifiable, Equatable {
    public let id: String?
    let brand: String?
    let colorway, gender, name, releaseDate: String?
    let retailPrice: Int?
    let shoe: String?
    let styleID, title: String?
    let year: Int?
    let media: Media?
    
    enum CodingKeys: String, CodingKey {
        case id, brand, colorway, gender, name, releaseDate, retailPrice, shoe
        case styleID = "styleId"
        case title, year, media
    }
    
    public init(id: String, brand: String, colorway: String, gender: String, name: String, releaseDate: String, retailPrice: Int, shoe: String, styleID: String, title: String, year: Int, media: Media) {
        self.id = id
        self.brand = brand
        self.colorway = colorway
        self.gender = gender
        self.name = name
        self.releaseDate = releaseDate
        self.retailPrice = retailPrice
        self.shoe = shoe
        self.styleID = styleID
        self.title = title
        self.year = year
        self.media = media
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        brand = try container.decodeIfPresent(String.self, forKey: .brand) ?? ""
        colorway = try container.decodeIfPresent(String.self, forKey: .colorway) ?? ""
        gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        retailPrice = try container.decodeIfPresent(Int.self, forKey: .retailPrice) ?? 0
        shoe = try container.decodeIfPresent(String.self, forKey: .shoe) ?? ""
        styleID = try container.decodeIfPresent(String.self, forKey: .styleID) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        year = try container.decodeIfPresent(Int.self, forKey: .year) ?? 0
        media = try container.decodeIfPresent(Media.self, forKey: .media) ?? Media(id: "", imageURL: "", smallImageURL: "", thumbURL: "")
    }
}

// MARK: - Media
public struct Media: Codable, Identifiable, Equatable {
    public var id: String? = UUID().uuidString
    let imageURL, smallImageURL, thumbURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case smallImageURL = "smallImageUrl"
        case thumbURL = "thumbUrl"
    }
    
    public init(id: String, imageURL: String, smallImageURL: String, thumbURL: String) {
        self.id = id
        self.imageURL = imageURL
        self.smallImageURL = smallImageURL
        self.thumbURL = thumbURL
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL) ?? ""
        smallImageURL = try container.decodeIfPresent(String.self, forKey: .smallImageURL) ?? ""
        thumbURL = try container.decodeIfPresent(String.self, forKey: .smallImageURL) ?? ""
 
    }
}
