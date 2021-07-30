//
//  ShoeListViewModel.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import UIKit
import Combine
import SwiftUI

class ShoeListViewModel: ObservableObject {
    
    private let api = API()
    private var subscriptions = Set<AnyCancellable>()
    
    @Published private var allSneakers = [SneakerViewModel]()
    @Published private var allResultCategories = [SneakerCategory]()
    @Published var error: API.Error? = nil
    
    var sneakers: [SneakerViewModel] {
        return self.allSneakers
    }
    
    var resultCategories: [SneakerCategory] {
        return self.allResultCategories
    }
    
    private func createCategories(results: [Result]) -> [SneakerCategory] {
        
        var returnResultCategories = [SneakerCategory]()
        let dict = Dictionary(grouping: results, by: { (result: Result) in
            return result.brand
        })
        
        for key in dict.keys {
            if let key = key, let results = dict[key] {
                let vm = results.map(SneakerViewModel.init)
                let category = SneakerCategory(title: key, sneakers: vm)
                returnResultCategories.append(category)
            }
        }
        return returnResultCategories
    }
        
    func fetchResults() {
        api
            .getTopLevelJSON()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { topLevelJSON in
                let returnValues = self.createCategories(results: topLevelJSON.results)
                self.allResultCategories = returnValues
                self.error = nil
            })
            .store(in: &subscriptions)
    }
    
    func nextPage(page: String, brand: String) {
        
        api
            .nextPage(page: page, brand: brand)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print("Complation \(completion)")
                if case .failure(let error) = completion {
                    self.error = error
                } else {
                    print("\(completion)")
                }
            }, receiveValue: { topLevelJSON in
                print("topLevelJSON nextPage func ->\(topLevelJSON)")
                let newTopLevelJSON = topLevelJSON
                let results = newTopLevelJSON.results
                let sneakers = results.map(SneakerViewModel.init)
                self.allSneakers = sneakers
                self.error = nil
            })
            .store(in: &subscriptions)
        
    }
}
