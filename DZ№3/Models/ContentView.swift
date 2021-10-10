//
//  ContentView.swift
//  DZ№3
//
//  Created by Egor Malyshev on 02.10.2021.
//

import SwiftUI
import DZCoreServices

struct ContentView: View {
    
    init() {
        ServiceLocator.shared.register(service: NetworkService())
        ServiceLocator.shared.register(service: MockDatabaseService())
    }
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            CharacterSearchScreen()
            
        }
        
    }
}
