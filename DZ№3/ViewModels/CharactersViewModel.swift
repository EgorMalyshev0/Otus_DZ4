//
//  CharactersViewModel.swift
//  DZ№2
//
//  Created by Egor Malyshev on 26.09.2021.
//

import Foundation
import DZCoreServices

final class CharactersViewModel: ObservableObject {
    
    @Injected var characterApi: CharacterApi?
    
    @Published var characterList: [Character] = .init()
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    @Published var totalResults: Int = 50000
    @Published var pageLoadCount: Int = 0
    
    var nameStartsWith = "a"
    
    init() {
        ServiceLocator.shared.register(service: CharacterApi.init())
    }
    
    func loadPage() {
        guard isPageLoading == false, characterList.count < totalResults else {
            return
        }
        isPageLoading = true
        page += 1
        let request = CharactersRequest(nameStartsWith: nameStartsWith, limit: 20, offset: characterList.count)
        characterApi?.getCharacters(request: request) { response in
            self.isPageLoading = false
            guard let response = response else { return }
            print(response)
            self.pageLoadCount += 1
            let list = response.data.results
            let filteredList = list.filter { character in
                if let path = character.thumbnail?.path {
                    return path.hasSuffix("image_not_available") ? false : true
                } else {
                    return false
                }
            }
            self.characterList.append(contentsOf: filteredList)
            self.totalResults = response.data.total
        }
    }
    
}
