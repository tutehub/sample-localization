//
//  NetworkDTO.swift
//  sample_app
//
//  Created by Work Mac on 19/6/2023.
//

import Foundation


struct APIResponse: Codable {
  let code: String
  let information: String
  let object: ContentObject
}
struct ContentObject: Codable {
  let content: [MyObject]
}
struct MyObject: Codable {
  let id: Int
  let title: String
  let content: String
}




struct ResponseDTO: Codable {
    let code: String
    let information: String
    let object: Int
}
