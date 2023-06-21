//
//  TmpDTO.swift
//  sample_app
//
//  Created by Work Mac on 21/6/2023.
//

import Foundation


struct TmpTwoDTO: Decodable {
    let code: String
    let information: String
    let object: [TmpTwoObjectDTO]
    
    enum RootKeys: String, CodingKey {
        case code, information, object
    }
    
    enum ObjectKeys: CodingKey {
        case content
    }
    
    enum ContentKeys: CodingKey {
        case id, title
    }
}


struct TmpTwoObjectDTO: Decodable {
    let id: Int
    let title: String
}


extension TmpTwoDTO {
    init(from decoder: Decoder) throws {
        // 1 - id (layer 1)
        let container = try decoder.container(keyedBy: RootKeys.self)
        code = try container.decode(String.self, forKey: .code)
        information = try container.decode(String.self, forKey: .information)
        
        // 3 - object
        let objectContainer = try container.nestedContainer(keyedBy: ObjectKeys.self, forKey: .object)
        var contentUnkeyedContainer = try objectContainer.nestedUnkeyedContainer(forKey: .content)
        var objectValues = [TmpTwoObjectDTO]()

        while !contentUnkeyedContainer.isAtEnd {
            let contentContainer = try contentUnkeyedContainer.nestedContainer(keyedBy: ContentKeys.self)
            let _id = try contentContainer.decode(Int.self, forKey: .id)
            let _title = try contentContainer.decode(String.self, forKey: .title)
            objectValues.append(TmpTwoObjectDTO(id: _id, title: _title ))
        }

        
        object = objectValues

    }
}
