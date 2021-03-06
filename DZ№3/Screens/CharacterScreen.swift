//
//  CharacterScreen.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import SwiftUI
import SDWebImageSwiftUI
import DZNavigation

struct CharacterScreen: View {
    
    var character: Character
    
    var imageURL: String {
        if let path = character.thumbnail?.path, let ext = character.thumbnail?.imageExtension {
            return path + "." + ext
        } else {
            return ""
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                NavPopButton(destination: .previous) {
                    Image(systemName: "arrow.left")
                        .font(.title)
                }
                
                Text(character.name.asStringOrEmpty)
                
                WebImage(url: URL(string: imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                Text(character.description.asStringOrEmpty)
                    .font(.caption)
                    .padding()

                NavPushButton(destination: CharacterComicsScreen(character: character)) {
                    Text("Show list of comics containing \(character.name.asStringOrEmpty)")
                }
                .font(.caption2)
                .foregroundColor(Color.blue)
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
        }
    }
    
}
