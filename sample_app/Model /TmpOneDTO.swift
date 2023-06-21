//
//  TmpDTO.swift
//  sample_app
//
//  Created by Work Mac on 21/6/2023.
//

import Foundation


struct TmpOneDTO: Decodable {
    let code: String
    let information: String
    let object: TmpOneObjectDTO
    
    enum RootKeys: String, CodingKey {
        case code, information, object
    }
    
    enum ObjectKeys: CodingKey {
        case content
    }
}


struct TmpOneObjectDTO: Decodable {
    let content: String
}


extension TmpOneDTO {
    init(from decoder: Decoder) throws {
        // 1 - id (layer 1)
        let container = try decoder.container(keyedBy: RootKeys.self)
        code = try container.decode(String.self, forKey: .code)
        information = try container.decode(String.self, forKey: .information)
        
        let objectContainer = try container.nestedContainer(keyedBy: ObjectKeys.self, forKey: .object)
        let content = try objectContainer.decode(String.self, forKey: .content)
        object = TmpOneObjectDTO(content: content)

    }
}
