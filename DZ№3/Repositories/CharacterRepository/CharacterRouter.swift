//
//  CharacterRouter.swift
//  DZ№3
//
//  Created by Egor Malyshev on 02.10.2021.
//

import Foundation
import DZCoreServices

enum CharacterRouter: APIRouter {
    
    case characters(CharactersRequest), characterComics(Int)
    
    var parameters: [String : CustomStringConvertible]? {
        switch self {
        case .characters(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["offset"] = data.offset
            parameters["limit"] = data.limit
            if let nameStartsWith = data.nameStartsWith {
                parameters["nameStartsWith"] = nameStartsWith
            }
            
            return parameters
        case .characterComics(let data):
            var parameters: [String : CustomStringConvertible] = DefaultParameters.get()
            parameters["characterId"] = data
            return parameters
        }
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .characterComics(let data):
            return "/v1/public/characters/\(data)/comics"
        }
    }
    
}
