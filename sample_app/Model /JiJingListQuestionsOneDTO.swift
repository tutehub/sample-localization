//
//  JiJingListQuestionsOneDTO.swift
//  sample_app
//
//  Created by Work Mac on 20/6/2023.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - JiJingListQuestionsOneDTO
//struct JiJingListQuestionsOneDTO: Codable {
//    let code, information: String
//    let object: Object
//}
//
//// MARK: - Object
//struct Object: Codable {
//    let content: [Content]
//    let pageable: Pageable
//    let number: Int
//    let sort: Sort
//    let size, numberOfElements: Int
//    let first, last, empty: Bool
//}
//
//// MARK: - Content
//struct Content: Codable {
//    let id: Int
//    let title, content: String
//    let postDate: PostDate
//    let modifiedDate, author, status: JSONNull?
//    let questionID: String
//    let level, testedDates, lessonPath: JSONNull?
//    let tags: Tags
//    let qid: Int
//    let qtype: Qtype
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, content, postDate, modifiedDate, author, status
//        case questionID = "questionId"
//        case level, testedDates, lessonPath, tags, qid, qtype
//    }
//}
//
//enum PostDate: String, Codable {
//    case the29052023 = "29/05/2023"
//}
//
//enum Qtype: String, Codable {
//    case ra = "ra"
//}
//
//// MARK: - Tags
//struct Tags: Codable {
//    let memory, verified: Bool
//    let predicted: JSONNull?
//    let updated, add: Bool
//    let frequency: Int
//    let source, customTags: JSONNull?
//}
//
//// MARK: - Pageable
//struct Pageable: Codable {
//    let sort: Sort
//    let offset, pageNumber, pageSize: Int
//    let paged, unpaged: Bool
//}
//
//// MARK: - Sort
//struct Sort: Codable {
//    let empty, sorted, unsorted: Bool
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
