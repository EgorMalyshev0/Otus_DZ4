//
//  CharacterListCell.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI
import DZNavigation

struct CharacterListCell: View {
    
    @EnvironmentObject var charactersListViewModel: CharactersViewModel
    
    var character: Character

    var body: some View {
        NavPushButton(destination: CharacterScreen(character: character)) {
            Text(character.name.asStringOrEmpty)
                .onAppear() {
                    if self.charactersListViewModel.characterList.isLast(character) {
                        charactersListViewModel.loadPage()
                    }
                }
            if self.charactersListViewModel.characterList.isLast(character) && charactersListViewModel.isPageLoading {
                VStack(alignment: .center) {
                    Divider()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
    
}
