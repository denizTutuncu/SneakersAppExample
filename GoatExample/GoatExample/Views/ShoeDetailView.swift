//
//  ShoeDetailView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import SwiftUI

struct ShoeDetailView: View {
    
    let shoe: ShoeViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Product Detail")
                Spacer()
            }
            .padding()
            
            Text(shoe.description)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .font(.footnote)
                .padding()
        }.padding()
    }
}

struct ShoeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let shoe = ShoeViewModel(shoe: Shoe(id: 777, brand: "Nike", name: "Dunk High X Slam Jam", color: "Clear Black", price: "120", description: "Since its foundation in 1989, Slam Jam has been dedicated to what they call the global underground. The powerhouse has long been a conduit for subculture expression, defined by a rebellious attitude and communicated through multidimensional innovation. For their most recent collaboration with Nike, Slam Jam chose the Dunk as its canvas. Long affiliated with street and underground culture, the Dunk proved a perfect fit with Slam Jam’s ethos. The Dunk had a strong impact for sure, acting as one of those elements helping global connections to shape and develop the now called street culture, says Slam Jam owner Luca Benini. On this design, the subversive tone of upside-down Swoosh on the tongue is reinforced by transparent, gummy Swooshes that touch at the heel for a unique branding element. Translucent soles tie naturally to the material makeup, while a playful reinterpretation of the Dunk's traditional perforation adds a subtle new ingredient.This Dunk expresses the values of simplicity and the attention to innovative details, which alongside our rebel attitude, define the Slam Jam DNA concludes Benini.", imageNames: ["DunkHighxSlamJam1", "DunkHighxSlamJam2", "DunkHighxSlamJam3", "DunkHighxSlamJam4", "DunkHighxSlamJam5", "DunkHighxSlamJam6"], releaseDate: "Oct 30", relaseDateNumber: "10-30-20", sku: "DA1630-101", nickname: "Clear Black", colorway: "White/Clear/Black", mainColor: "Black", silhouette: "Dunk", designer: "Peter Moore"))
        ShoeDetailView(shoe: shoe)
    }
}
