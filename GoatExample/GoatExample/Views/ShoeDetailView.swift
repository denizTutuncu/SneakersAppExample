//
//  ShoeDetailView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

struct ShoeDetailView: View {
    
    
    let shoe: SneakerViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Product Detail")
                Spacer()
            }
            .padding()
            
            Text(shoe.title)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .font(.footnote)
                .padding()
        }.padding()
    }
}


struct ShoeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShoeDetailView(shoe: SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0"))))
    }
}
