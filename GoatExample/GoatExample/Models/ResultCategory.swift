//
//  ResultCategory.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/24/20.
//

import Foundation

extension ResultCategory: Equatable {
    static func == (lhs: ResultCategory, rhs: ResultCategory) -> Bool {
        return lhs.id == rhs.id
    }
}

class ResultCategory: Identifiable {
    var id: String
    var title: String
    var sneakers: [SneakerViewModel]
    
    init(id: String = UUID().uuidString, title: String, sneakers: [SneakerViewModel] ) {
        self.id = id
        self.title = title
        self.sneakers = sneakers
    }
}
