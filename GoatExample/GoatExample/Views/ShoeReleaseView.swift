//
//  ShoeReleaseView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

struct ShoeReleaseView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let shoe: SneakerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("\(shoe.releaseDate)")
                    .foregroundColor(Color.primary)
                    .font(.body)
                    .frame(width: 100)
                    .padding(10)
                    .background(colorScheme == .light ? Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                    .cornerRadius(6)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            
            VStack(spacing: 2) {
                Text(shoe.name)
                Text("\(shoe.colorway)")
                Text(shoe.retailPrice == "0" ? "$ n/a" : "$\(shoe.retailPrice)")
            }
        }
    }
}

struct ShoeReleaseView_Previews: PreviewProvider {
    static var previews: some View {
     
        ShoeReleaseView(shoe: SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0"))))
    }
}
