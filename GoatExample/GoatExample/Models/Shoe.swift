//
//  Shoe.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import Foundation
import SwiftUI

struct Shoe: Identifiable, Codable, Hashable {
    var id: Int?
    let brand: String?
    let name: String?
    let color: String?
    let price: String?
    let description: String?
    let imageNames: [String]?
    let releaseDate: String?
    let relaseDateNumber: String?
    let sku: String?
    let nickname: String?
    let colorway: String?
    let mainColor: String?
    let silhouette: String?
    let designer: String?
}


