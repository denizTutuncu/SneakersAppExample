//
//  ShoeAdvancedDetailView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

import SwiftUI

struct ShoeAdvancedDetailView: View {
    
    let shoe: SneakerViewModel
    
    var body: some View {
        
        ScrollView(.horizontal) {
            HStack {
                ShoeAdvancedDetailSubView1(shoe: shoe)
                ShoeAdvancedDetailSubView2(shoe: shoe)
            }
            .padding()
        }
    }
}

struct ShoeAdvancedDetailSubView1: View {
    
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
                
                Text(shoe.styleID == "" ? "No SKU" : shoe.styleID)
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

struct ShoeAdvancedDetailSubView2: View {
    
    let shoe: SneakerViewModel
    
    func correctYear(year: String?) -> String {
        guard let year = year else {
            return ""
        }
        return year.replacingOccurrences(of: ",", with: "")
    }
    
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
                
                Text("\(correctYear(year: shoe.year))")
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("SILHOUTTE")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
                
                Text(shoe.name)
                    .font(.footnote)
            }
            
            Divider()
                .frame(width: 1, height: 75)
            
            VStack(spacing: 2) {
                Text("DESIGNER")
                    .foregroundColor(.secondary)
                    .font(.caption2)
                    .padding()
            }
        }
        .padding()
    }
}

struct ShoeAdvancedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ShoeAdvancedDetailView(shoe: SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0"))))
    }
}
