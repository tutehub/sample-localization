//
//  ReviewDTO.swift
//  sample_app
//
//  Created by Work Mac on 20/6/2023.
//

import Foundation


struct ReviewDTO {

    enum RootKeys: String, CodingKey {
        case id, user, reviewCount = "reviews_count"
    }

    enum UserKeys: String, CodingKey {
        case userName = "user_name", realInfo = "real_info"
    }

    enum RealInfoKeys: String, CodingKey {
        case fullName = "full_name"
    }

    enum ReviewCountKeys: String, CodingKey {
        case count
    }

    let id: Int
    let userName: String
    let fullName: String
    let reviewCount: Int

}


extension ReviewDTO: Decodable {

    init(from decoder: Decoder) throws {
        // 1 - id (layer 1)
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        
        
        // 2 - userName (layer 2)
        let userContainer = try container.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        userName = try userContainer.decode(String.self, forKey: .userName)
        
        
        // 3 - fullName (layer 3)
        let realInfoKeysContainer = try userContainer.nestedContainer(keyedBy: RealInfoKeys.self, forKey: .realInfo)
        fullName = try realInfoKeysContainer.decode(String.self, forKey: .fullName)

        
        // 4 - reviewCount
         var reviewUnkeyedContainer = try container.nestedUnkeyedContainer(forKey: .reviewCount)
         var reviewCountArray = [Int]()
         while !reviewUnkeyedContainer.isAtEnd {
             let reviewCountContainer = try reviewUnkeyedContainer.nestedContainer(keyedBy: ReviewCountKeys.self)
             reviewCountArray.append(try reviewCountContainer.decode(Int.self, forKey: .count))
         }
         guard let reviewCount = reviewCountArray.first else {
             throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath + [RootKeys.reviewCount], debugDescription: "reviews_count cannot be empty"))
         }
         self.reviewCount = reviewCount
    }

}
