//
//  CharacterAPI.swift
//  DZ№2
//
//  Created by Egor Malyshev on 25.09.2021.
//

import Foundation
import DZCoreServices

class CharacterApi: NSObject {
    
    @Injected var networkService: NetworkService?
    
    public func getCharacters(request: CharactersRequest, completion: @escaping (BaseResponse<Character>?) -> Void) {
        let route = CharacterRouter.characters(request)
        networkService?.performRequest(route: route) { (result: Result<BaseResponse<Character>, Error>) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    public func getComics(byCharacterId id: Int, completion: @escaping (BaseResponse<Comic>?) -> Void) {
        let route = CharacterRouter.characterComics(id)
        networkService?.performRequest(route: route) { (result: Result<BaseResponse<Comic>, Error>) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
