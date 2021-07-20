//
//  ShoeMainDetailView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/24/20.
//

import SwiftUI

struct ShoeMainDetailView: View {
    
    let shoe: SneakerViewModel
    
    var body: some View {
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
    }
}

struct  ShoeMainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ShoeMainDetailView(shoe: SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0"))))
    }
}
