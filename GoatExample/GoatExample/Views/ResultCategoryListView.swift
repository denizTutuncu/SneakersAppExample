//
//  ResultCategoryListView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 12/3/20.
//

import SwiftUI

struct ResultCategoryListView: View {
    
    @Binding var showAll: Bool
    @Binding var sneakerBrand: String
    
    let screenSize: CGSize
    let resultCategories: [ResultCategory]
  
    var body: some View {
        
        return VStack {
            List {
                ForEach(self.resultCategories, id: \.id) { resultCategory in
                    ResultCategoryCell(scrennSize: screenSize, showAll: $showAll, sneakerBrand: $sneakerBrand, resultCategoryVM: resultCategory)
                }
            }
        }.listStyle(GroupedListStyle())
    }
}


struct ResultCategoryListView_Previews: PreviewProvider {
    @State static var showAll = true
    @State static var sneakerBrand = "Nike"
    
    static var previews: some View {
        
        ResultCategoryListView(showAll: $showAll, sneakerBrand: $sneakerBrand, screenSize: UIScreen.main.bounds.size, resultCategories: [ResultCategory(title: "Jordan", sneakers: [SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0")))])])
    }
}
