//
//  URLImage.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/23/20.
//

import SwiftUI

struct URLImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
        } else {
            return Image("placeholder").renderingMode(.original).resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://stockx-assets.imgix.net/media/New-Product-Placeholder-Default.jpg?fit=fill&bg=FFFFFF&w=700&h=500&auto=format,compress&trim=color&q=90&dpr=2&updated_at=0")
    }
}
