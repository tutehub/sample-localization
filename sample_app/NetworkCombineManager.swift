//
//  NetworkCombineManager.swift
//  sample_app
//
//  Created by Work Mac on 15/6/2023.
//

import Foundation


struct Response: Codable {
    let code: String
    let information: String
    let object: Int
}

class NetworkCombineManager {
    static let shared = NetworkCombineManager()

    
    let url = URL(string: "https://cowpte.com:8702/api/v1/questions/count/asq")!
    
    func getRequest() {
        print("Shark-NetworkCombineManager-getRequest")
        
        _ = URLSession.shared.dataTaskPublisher(for: url)
            .print("1-dataTask")
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                    print("Shark-error")
                        throw URLError(.badServerResponse)
                    }
                print("Shark:", element.data)
                return element.data
                }
            .decode(type: Response.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { print ("Shark-url-completion: \($0).") },
                  receiveValue: { user in print ("Shark-url-user: \(user).")})
        }
    
    
    
    
    
    /// Example for tryMap
    struct ParseError: Error {}
        
    func romanNumeral(from:Int) throws -> String {
        let romanNumeralDict: [Int : String] =  [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]
        guard let numeral = romanNumeralDict[from] else {
            throw ParseError()
        }
        return numeral
    }
    
    let numbers = [5, 4, 3, 2, 1, 0]
    
    func test() {
        _ = numbers.publisher
            .tryMap { try self.romanNumeral(from: $0) }
            .sink(
                receiveCompletion: { print ("Shark-completion: \($0)") },
                receiveValue: { print ("Shark-value:\($0)", terminator: " ") }
             )
    }
     
    
    
    
    

  
}
