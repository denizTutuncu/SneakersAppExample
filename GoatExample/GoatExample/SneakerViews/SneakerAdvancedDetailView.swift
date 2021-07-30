//
//  ShoeAdvancedDetailView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

import SwiftUI

struct SneakerAdvancedDetailView: View {
    
    let shoe: SneakerViewModel
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                SneakerAdvancedDetailSubView1(shoe: shoe)
                SneakerAdvancedDetailSubView2(shoe: shoe)
            }
            .padding()
        }
    }
}

struct SneakerAdvancedDetailSubView1: View {
    
    let shoe: SneakerViewModel
    
    func getColorway(color: String?) -> String {
        var returnString = ""
        
        guard let color = color else { return returnString }
        
        let str = color.components(separatedBy: "/")
        if let last = str.last {
            returnString = last
        }
        return returnString
    }
    
    var body: some View {
        
        HStack(spacing: 8) {
            
            VStack(spacing: 2) {
                Text("BRAND")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(shoe.brand)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("RELEASE DATE")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                
                Text(shoe.releaseDate)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("SKU")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(shoe.sku == "" ? "No SKU" : shoe.sku)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("NICKNAME")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(shoe.name)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("COLORWAY")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text("\(getColorway(color: shoe.colorway))")
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
        }
    }
}

struct SneakerAdvancedDetailSubView2: View {
    
    let shoe: SneakerViewModel
    
    func getMainColor(color: String?) -> String {
        var returnString = ""
        
        guard let color = color else { return returnString }
        
        for character in color {
            if character == "/" {
                break
            } else {
                returnString += "\(character)"
            }
        }
        return returnString
    }
    
    var body: some View {
        
        return HStack(spacing: 8) {
            
            VStack(spacing: 2) {
                Text("MAIN COLOR")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text("\(getMainColor(color: shoe.colorway))")
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("YEAR")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text("\(shoe.releaseYear.description)")
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("SILHOUTTE")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(shoe.silhouette)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("DESIGNER")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(" ")
                    .font(.footnote)
            }
        }
        .padding()
    }
}

struct ShoeAdvancedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        SneakerAdvancedDetailView(shoe: SneakerViewModel(result:  Result(id: "823c30ba-8e15-4e72-ad53-f5f22280a83c", sku: "DC7501-300", brand: "Air Jordan", name: "Air Jordan 5 Retro 'Jade Horizon'", colorway: "Jade Horizon/Light Silver/Anthracite/Pink Glaze", gender: "men", silhouette: "Air Jordan 5", releaseYear: 2021, releaseDate: "2021-12-04", retailPrice: 190, estimatedMarketValue: 190, story: "The Air Jordan 5 Retro ‘Jade Horizon’ delivers a pastel colorway of Tinker Hatfield’s 1990 design. A soft green hue is applied to the suede upper, equipped with clear quarter-panel netting and tonal TPU eyelets. Contrasting pink accents make their way to the Jumpman logo atop the silver reflective tongue, as well as the signature shark tooth detailing that decorates the black polyurethane midsole. Encapsulated Nike Air in the forefoot is joined by a visible Air sole unit in the heel, both of which are supported underfoot by an icy translucent outsole.", image: ResultImage(id: "", original: "", small: "", thumbnail: ""), links: Links(id: "", stockx: "", goat: "https://goat.com/sneakers/air-jordan-5-retro-jade-horizon-dc7501-300", flightClub: "https://flightclub.com/air-jordan-5-retro-jade-horizon-dc7501-300"))))
    }
}
