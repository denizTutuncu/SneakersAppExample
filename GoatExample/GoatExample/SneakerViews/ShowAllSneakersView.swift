//
//  ShowAllView.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 11/25/20.
//

import SwiftUI

struct ShowAllSneakersView: View {
    
    @ObservedObject var model: ShoeListViewModel
    @Binding var sneakerBrand: String
    @State private var searchText = ""
    private let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(model: ShoeListViewModel, sneakerBrand: Binding<String>) {
        self.model = model
        self._sneakerBrand = sneakerBrand
    }
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        NavigationView {
            ScrollView {
                SearchBarView(text: $searchText)
                    .padding()
                LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 8, content: {
                    ForEach(model.sneakers.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }) , id: \.id) { sneaker in
                        NavigationLink(destination: SneakerMainDetailView(shoe: sneaker)) {
                            
                            VStack {
                                
                                HStack {
                                    Text("\(sneaker.releaseYear.description)")
                                        .font(.footnote)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    Spacer()
                                    
                                    
                                    Text(sneaker.gender)
                                        .font(.footnote)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                                
                                VStack(alignment: .center) {
                                    URLImage(url: sneaker.image.original ??  sneaker.image.small ??  sneaker.image.thumbnail ?? "")
                                        .aspectRatio(contentMode: .fit)
                                }
                                
                                VStack(alignment: .center) {
                                    
                                    Text("\(sneaker.name)")
                                        .font(.callout)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(nil)
                                        .minimumScaleFactor(0.5)
                                    
                                    Text("$\(sneaker.retailPrice)")
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                }
                            }
                            .padding()
                            .frame(width: screenSize.width / 2, height: screenSize.height / 3, alignment: .center)
                            .border(Color.gray, width: 0.2)
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
        ShowAllSneakersView(model: ShoeListViewModel(), sneakerBrand: $sneakerBrand)
    }
}
