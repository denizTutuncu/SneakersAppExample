//
//  GoatExampleApp.swift
//  GoatExample
//
//  Created by Deniz Tutuncu on 10/21/20.
//

import SwiftUI

@main
struct GoatExampleApp: App {
    
    let viewModel = ShoeListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: viewModel)
        }
    }
}
