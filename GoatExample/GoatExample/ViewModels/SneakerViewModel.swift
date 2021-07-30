//
//  SneakerViewModel.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/28/20.
//

import Foundation

class SneakerViewModel {
    
    var result: Result
    
    init(result: Result) {
        self.result = result
    }
    
    var id: String {
        return result.id ?? "No Sneaker ID"
    }
    
    var sku: String {
        return result.sku ?? "No Sneaker SKU"
    }
    
    var brand: String {
        return result.brand ?? "No Sneaker Brand"
    }
    
    var name: String {
        return result.name ?? "No Sneaker Name"
    }
    
    var colorway: String {
        return result.colorway ?? "No Sneaker Colorway"
    }
    
    var gender: String {
        return result.gender ?? "No Sneaker Gender"
    }
    
    var silhouette: String {
        return result.silhouette ?? "No Sneaker silhouette"
    }
    
    var releaseDate: String {
        return result.releaseDate ?? "No Sneaker ReleaseDate"
    }
    
    var story: String {
        return result.story ?? "No Sneaker story"
    }
    
    var releaseYear: Int {
        return result.releaseYear ?? 0000
    }
    
    var retailPrice: Int {
        return result.retailPrice ?? 0000
    }
    
    var estimatedMarketValue: String {
        return "\(result.estimatedMarketValue ?? 0000)"
    }
    
    var image: ResultImage {
        return result.image ?? ResultImage(id: "", original: "", small: "", thumbnail: "")
    }
    
    var links: Links {
        return result.links ?? Links(id: "", stockx: "", goat: "", flightClub: "")
    }
}
