//
//  ShoeCellView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

struct ShoeCellView: View {
    
    let shoe: SneakerViewModel
    
    func fixSneakerName(brand: String?, name: String?) -> String {
        var returnString = ""
        
        guard let sneakerBrand = brand, let sneakerName = name else { return returnString}
        
        let replaceSneakerName = sneakerName.replacingOccurrences(of: "\(sneakerBrand) ", with: "")
        returnString = replaceSneakerName
        return returnString
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .center) {
                VStack(alignment: .center) {
                    URLImage(url: shoe.media.imageURL ??  shoe.media.thumbURL ??  shoe.media.smallImageURL ?? "")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                }
                .frame(width: 100)
                
                VStack(alignment: .center) {
                    Text("\(shoe.title)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    Text(shoe.retailPrice == "0" ? "$ n/a" : "$\(shoe.retailPrice)")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.red)
                    
                    VStack(alignment: .center) {
                        Text("Release Date: \(shoe.releaseDate)")
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
            Divider()
            Spacer()
        }
    }
}

struct ShoeCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        ShoeCellView(shoe: SneakerViewModel(result: Result(id: "1c6d7f01-6e6b-4c96-96d9-892273f2d763", brand: "Jordan", colorway: "White/University Blue-Black", gender: "child", name: "White University Blue Black (GS)", releaseDate: "2021-02-20", retailPrice: 130, shoe: "Jordan 1 Retro High", styleID: "575441-134", title: "Jordan 1 Retro High White University Blue Black (GS)", year: 2021, media: Media(id: "", imageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", smallImageURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0", thumbURL: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0"))))
    }
}

