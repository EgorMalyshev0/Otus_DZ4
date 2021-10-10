//
//  CharacterComicsScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI
import DZNavigation

struct CharacterComicsScreen: View {
        
    @ObservedObject var characterComicsViewModel: CharacterComicsViewModel = .init()
    
    var character: Character
    
    var body: some View {
        VStack {
            NavPopButton(destination: .previous) {
                Image(systemName: "arrow.left")
                    .font(.title)
            }
            
            if characterComicsViewModel.areComicsLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
            List(characterComicsViewModel.comicsList) { comic in
                CharacterComicListCell(comic: comic)
            }
        }
        .onAppear {
            characterComicsViewModel.loadComics(byId: character.id.asIntOrZero)
        }
    }
}

