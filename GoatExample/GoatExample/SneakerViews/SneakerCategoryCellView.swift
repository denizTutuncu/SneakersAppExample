//
//  ResultCategoryCell.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 12/3/20.
//

import SwiftUI

struct SneakerCategoryCellView: View {
    let scrennSize: CGSize
    @State private var navBarHidden = false
    @Binding var showAll: Bool
    @Binding var sneakerBrand: String
    
    let resultCategoryVM: SneakerCategory
    
    var body: some View {
        VStack {
            Section(header:
                        HStack {
                            Text(resultCategoryVM.title).font(.title).foregroundColor(Color.primary)
                            Spacer()
                            Button("Show all", action: {
                                self.sneakerBrand = resultCategoryVM.title
                                self.showAll.toggle()
                            })
                            .foregroundColor(.blue)
                        }) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(resultCategoryVM.sneakers, id: \.id) { shoe in
                            NavigationLink(destination: SneakerMainDetailView(shoe: shoe)) {
                                SneakerCellView(shoe: shoe)
                                    .padding()
                                
                            }.buttonStyle(PlainButtonStyle())
                        }
                        .frame(width: scrennSize.width / 2, height: scrennSize.height / 4)
                    }
                }
            }
        }
    }
}


struct ResultCategoryCell_Previews: PreviewProvider {
    @State static var showAll = true
    @State static var sneakerBrand = "Nike"
    static var previews: some View {
        
        SneakerCategoryCellView(scrennSize: UIScreen.main.bounds.size, showAll: $showAll, sneakerBrand: $sneakerBrand, resultCategoryVM: SneakerCategory(title: "Nike", sneakers: [SneakerViewModel(result: Result(id: "823c30ba-8e15-4e72-ad53-f5f22280a83c", sku: "DC7501-300", brand: "Air Jordan", name: "Air Jordan 5 Retro 'Jade Horizon'", colorway: "Jade Horizon/Light Silver/Anthracite/Pink Glaze", gender: "men", silhouette: "Air Jordan 5", releaseYear: 2021, releaseDate: "2021-12-04", retailPrice: 190, estimatedMarketValue: 190, story: "The Air Jordan 5 Retro ‘Jade Horizon’ delivers a pastel colorway of Tinker Hatfield’s 1990 design. A soft green hue is applied to the suede upper, equipped with clear quarter-panel netting and tonal TPU eyelets. Contrasting pink accents make their way to the Jumpman logo atop the silver reflective tongue, as well as the signature shark tooth detailing that decorates the black polyurethane midsole. Encapsulated Nike Air in the forefoot is joined by a visible Air sole unit in the heel, both of which are supported underfoot by an icy translucent outsole.", image: ResultImage(id: "", original: "", small: "", thumbnail: ""), links: Links(id: "", stockx: "", goat: "https://goat.com/sneakers/air-jordan-5-retro-jade-horizon-dc7501-300", flightClub: "https://flightclub.com/air-jordan-5-retro-jade-horizon-dc7501-300")))]))
    }
}
