//
//  ContentView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import SwiftUI

struct ContentView: View {
    
    let shoe = ShoeViewModel(shoe: Shoe(id: 777, brand: "Nike", name: "Dunk High x Slam Jam", color: "Clear Black", price: "120", description: "Since its foundation in 1989, Slam Jam has been dedicated to what they call the global underground. The powerhouse has long been a conduit for subculture expression, defined by a rebellious attitude and communicated through multidimensional innovation. For their most recent collaboration with Nike, Slam Jam chose the Dunk as its canvas. Long affiliated with street and underground culture, the Dunk proved a perfect fit with Slam Jam’s ethos. The Dunk had a strong impact for sure, acting as one of those elements helping global connections to shape and develop the now called street culture, says Slam Jam owner Luca Benini. On this design, the subversive tone of upside-down Swoosh on the tongue is reinforced by transparent, gummy Swooshes that touch at the heel for a unique branding element. Translucent soles tie naturally to the material makeup, while a playful reinterpretation of the Dunk's traditional perforation adds a subtle new ingredient.This Dunk expresses the values of simplicity and the attention to innovative details, which alongside our rebel attitude, define the Slam Jam DNA concludes Benini.", imageNames: ["DunkHighxSlamJam1", "DunkHighxSlamJam2", "DunkHighxSlamJam3", "DunkHighxSlamJam4", "DunkHighxSlamJam5", "DunkHighxSlamJam6"], releaseDate: "Oct 30", relaseDateNumber: "10-30-20", sku: "DA1630-101", nickname: "Clear Black", colorway: "White/Clear/Black", mainColor: "Black", silhouette: "Dunk", designer: "Peter Moore"))
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 0) {                    
                    ShoePhotoListView(shoe: shoe)
                        .padding()
                    
                    Divider()
                        .frame(width: 375, height: 1, alignment: .center)
                        .padding()
                    
                    ShoeReleaseView(shoe: shoe)
                    
                    Divider()
                        .frame(width: 375, height: 1, alignment: .center)
                        .padding()
                    
                    ShoeAdvancedDetailView(shoe: shoe)
                        .padding()
                    
                    Divider()
                        .frame(width: 375, height: 1, alignment: .center)
                        .padding()
                    
                    ShoeDetailView(shoe: shoe)
                }
            }
            .navigationTitle("")
            .navigationBarItems(leading: Button(action: {}) {
                Image("left-arrow")
                    .resizable()
                    .frame(width: 24, height: 24)
            }, trailing: Button(action: {}){
                Text("Want")
                    .frame(width: 75, height: 36, alignment: .center)
                    .foregroundColor(Color.black)
                    .border(Color.primary, width: 0.5)
                    .cornerRadius(2)
                    .font(.caption)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
