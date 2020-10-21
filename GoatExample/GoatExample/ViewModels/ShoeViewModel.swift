//
//  ShoeViewModel.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import Foundation

struct ShoeViewModel: Identifiable {
    
    let shoe: Shoe
    
    var id: Int {
        self.shoe.id ?? 0
    }
    
    var brand: String {
        self.shoe.brand?.uppercased() ?? "No brand Provided"
    }
    
    var name: String {
        self.shoe.name ?? "No Name Provided"
    }
    
    var color: String {
        self.shoe.color ?? "No Color Provided"
    }
    
    var price: String {
        "$\(self.shoe.price ?? "NO Price Provided")"
    }
    
    var description: String {
        self.shoe.description ?? "No Description Provided"
    }
    
    var imageNames: [String] {
        self.shoe.imageNames ?? []
    }
    
    var releaseDate: String {
        self.shoe.releaseDate ?? "No Release Date Provided"
    }
    
    var relaseDateNumber: String {
        self.shoe.relaseDateNumber ?? "No Release Date Number Provided"
    }
    
    var sku: String {
        self.shoe.sku ?? "No SKU Provided"
    }
    
    var nickname: String {
        self.shoe.nickname ?? "No Nickname Provided"
    }
    
    var colorway: String {
        self.shoe.colorway ?? "No Colorway Provided"
    }
    
    var mainColor: String {
        self.shoe.mainColor ?? "No Main Color Provided"
    }
    
    var silhouette: String {
        self.shoe.silhouette ?? "No Silhouette Provided"
    }
    
    var designer: String {
        self.shoe.designer ?? "No Designer Provided"
    }
}
