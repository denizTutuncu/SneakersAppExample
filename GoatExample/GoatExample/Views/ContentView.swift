//
//  ContentView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: ShoeListViewModel
    @State private var showAll: Bool = false
    @State private var sneakerBrand: String = ""
    
    init(model: ShoeListViewModel) {
        self.model = model
        self.model.fetchResults()
    }
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return NavigationView {
            VStack {
                ResultCategoryListView(showAll: $showAll, sneakerBrand: $sneakerBrand, screenSize: screenSize, resultCategories: model.resultCategories)
            }
            .sheet(isPresented: $showAll, content: {
                ShowAllView(model: model, sneakerBrand: self.$sneakerBrand)
            })
            .alert(item: self.$model.error) { error in
                Alert(
                    title: Text("Network error"),
                    message: Text(error.localizedDescription),
                    dismissButton: .cancel()
                )
            }
            .navigationTitle("Sneakers")
            .navigationBarTitle("", displayMode: .automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(model: ShoeListViewModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
        
    }
}
