//
//  ShoeReleaseView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

struct SneakerShortDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let shoe: SneakerViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 2) {
                    Text(shoe.name)
                    Text("\(shoe.colorway)")
                    HStack {
                        VStack {
                            Text("Retail Price").foregroundColor(.blue)
                            Text("$\(shoe.retailPrice)")
                        }.padding()
                        Spacer()
                        VStack {
                            Text("Estimated Market Value").foregroundColor(.red)
                            Text("$\(shoe.estimatedMarketValue)")
                        }.padding()
                    }
                }
            }
        }
    }
}

struct ShoeReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        
        SneakerShortDetailView(shoe: SneakerViewModel(result: Result(id: "823c30ba-8e15-4e72-ad53-f5f22280a83c", sku: "DC7501-300", brand: "Air Jordan", name: "Air Jordan 5 Retro 'Jade Horizon'", colorway: "Jade Horizon/Light Silver/Anthracite/Pink Glaze", gender: "men", silhouette: "Air Jordan 5", releaseYear: 2021, releaseDate: "2021-12-04", retailPrice: 190, estimatedMarketValue: 190, story: "The Air Jordan 5 Retro ‘Jade Horizon’ delivers a pastel colorway of Tinker Hatfield’s 1990 design. A soft green hue is applied to the suede upper, equipped with clear quarter-panel netting and tonal TPU eyelets. Contrasting pink accents make their way to the Jumpman logo atop the silver reflective tongue, as well as the signature shark tooth detailing that decorates the black polyurethane midsole. Encapsulated Nike Air in the forefoot is joined by a visible Air sole unit in the heel, both of which are supported underfoot by an icy translucent outsole.", image: ResultImage(id: "", original: "", small: "", thumbnail: ""), links: Links(id: "", stockx: "", goat: "https://goat.com/sneakers/air-jordan-5-retro-jade-horizon-dc7501-300", flightClub: "https://flightclub.com/air-jordan-5-retro-jade-horizon-dc7501-300"))))
    }
}
