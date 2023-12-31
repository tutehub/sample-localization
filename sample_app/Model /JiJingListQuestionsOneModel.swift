//
//  JiJingListQuestionsOneModel.swift
//  sample_app
//
//  Created by Work Mac on 20/6/2023.
//

import Foundation


struct JiJingListQuestionsOneDTO: Decodable{
    let code: String
    let information: String
    let object: [JiJingListQuestionsOneModel]
    
    
    enum RootKeys: String, CodingKey {
        case code, information, object
    }
    
    enum ObjectKeys: CodingKey {
        case content
    }
    
    enum ContentKeys: CodingKey {
        case id, title, content, postDate, modifiedDate, author, status, questionId, level, testedDates, lessonPath, tags, qid, qtype
    }
}


struct JiJingListQuestionsOneModel: Decodable {
    var slug: String
    var title: String
    var isCollected: Bool
    var star: Int
    var hasCourse: Bool
}

extension JiJingListQuestionsOneDTO {
    init(from decoder: Decoder) throws {
        // 1 - code & information
        let container = try decoder.container(keyedBy: RootKeys.self)
        code = try container.decode(String.self, forKey: .code)
        information = try container.decode(String.self, forKey: .information)
                
        
        // 3 - object
        let objectContainer = try container.nestedContainer(keyedBy: ObjectKeys.self, forKey: .object)
        var contentUnkeyedContainer = try objectContainer.nestedUnkeyedContainer(forKey: .content)
        var objectValues = [JiJingListQuestionsOneModel]()

        while !contentUnkeyedContainer.isAtEnd {
            let contentContainer = try contentUnkeyedContainer.nestedContainer(keyedBy: ContentKeys.self)
            let _id = try contentContainer.decode(Int.self, forKey: .id)
            let _title = try contentContainer.decode(String.self, forKey: .title)
            let _questionId = try contentContainer.decode(String.self, forKey: .questionId)

            objectValues.append(JiJingListQuestionsOneModel(slug: _questionId, title: _title, isCollected: true, star: 1, hasCourse: false))
        }

        
        
        self.object = objectValues

    }
}
