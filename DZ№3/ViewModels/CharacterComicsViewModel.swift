//
//  CharacterComicsViewModel.swift
//  DZ№4
//
//  Created by Egor Malyshev on 10.10.2021.
//

import Foundation
import DZCoreServices

final class CharacterComicsViewModel: ObservableObject {
    
    @Injected var characterApi: CharacterApi?
    @Injected var dbService: MockDatabaseService?
    
    @Published var comicsList: [Comic] = .init()
    @Published var areComicsLoading: Bool = false
    
    func loadComics(byId id: Int) {
        areComicsLoading = true
        characterApi?.getComics(byCharacterId: id) { [weak self] response in
            self?.areComicsLoading = false
            guard let response = response else { return }
            print(response)
            self?.comicsList.append(contentsOf: response.data.results)
            self?.dbService?.test()
        }
    }
}
