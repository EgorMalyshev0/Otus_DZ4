//
//  CharacterSearchScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 27.09.2021.
//

import SwiftUI

struct CharacterSearchScreen: View {
    
    @ObservedObject var charactersListViewModel: CharactersScreenViewModel = .init()
    
    var body: some View {
        CharactersList().environmentObject(charactersListViewModel)
            .onAppear {
                if charactersListViewModel.characterList.isEmpty {
                    charactersListViewModel.loadPage()
                }
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
    }
}

