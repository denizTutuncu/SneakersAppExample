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
    
    var brand: String {
        return result.brand ?? "No Sneaker Brand"
    }
    
    var colorway: String {
        return result.colorway ?? "No Sneaker Colorway"
    }
    
    var gender: String {
        return result.gender ?? "No Sneaker Gender"
    }
    
    var name: String {
        return result.name ?? "No Sneaker Name"
    }
    
    var releaseDate: String {
        return result.releaseDate ?? "No Sneaker ReleaseDate"
    }
    
    var retailPrice: String {
        return "\(result.retailPrice ?? 0)"
    }
    
    var shoe: String {
        return result.shoe ?? "No Sneaker shoe"
    }
    
    var styleID: String {
        return result.styleID ?? "No Sneaker styleID"
    }
    
    var title: String {
        return result.title ?? "No Sneaker Title"
    }
    
    var year: String {
        return "\(result.year ?? 0)"
    }
    
    var media: Media {
        return result.media ?? Media(id: "", imageURL: "", smallImageURL: "", thumbURL: "")
    }
}
