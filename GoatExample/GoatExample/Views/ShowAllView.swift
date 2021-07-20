//
//  ShowAllView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/25/20.
//

import SwiftUI

struct ShowAllView: View {
    
    @ObservedObject var model: ShoeListViewModel
    @Binding var sneakerBrand: String
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(model: ShoeListViewModel, sneakerBrand: Binding<String>) {
        self.model = model
        self._sneakerBrand = sneakerBrand
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 8, content: {
                    ForEach(model.sneakers, id: \.id) { sneaker in
                        NavigationLink(destination: ShoeMainDetailView(shoe: sneaker)) {
                            
                            VStack {
                                
                                VStack(alignment: .center) {
                                    URLImage(url: sneaker.media.imageURL ??  sneaker.media.thumbURL ??  sneaker.media.smallImageURL ?? "")
                                        .aspectRatio(contentMode: .fit)
                                }
                                
                                VStack(alignment: .center) {
                                    
                                    Text("\(sneaker.shoe)")
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text("\(sneaker.name)")
                                        .font(.title3)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text("\(sneaker.releaseDate)")
                                        .font(.footnote)
                                        .foregroundColor(.primary)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                            .padding()
                        }.buttonStyle(PlainButtonStyle())
                        .navigationBarTitle("All \(sneaker.brand) Sneakers", displayMode: .inline)
                    }
                })
            }
            .navigationTitle("")
        }
        .onAppear(perform: {
            self.model.nextPage(page: "1", brand: sneakerBrand)
        })
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ShowAllView_Previews: PreviewProvider {
    
    @State static var showAll = true
    @State static var sneakerBrand  = "Nike"
    
    static var previews: some View {
        ShowAllView(model: ShoeListViewModel(), sneakerBrand: $sneakerBrand)
    }
}
