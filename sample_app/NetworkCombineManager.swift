//
//  NetworkCombineManager.swift
//  sample_app
//
//  Created by Work Mac on 15/6/2023.
//

import Foundation
import Combine





class NetworkCombineManager {
    static let shared = NetworkCombineManager()
    private var cancellables = Set<AnyCancellable>()
    
    
    let url = URL(string: "https://cowpte.com:8702/api/v1/questions/count/asq")!
    
    func getRequest() {
        print("Shark-NetworkCombineManager-getRequest")
        
        URLSession.shared.dataTaskPublisher(for: url)
            .print("1-dataTask")
            .tryMap() { element -> Data in
                print("shark-tryMap", element)
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                    print("Shark-error")
                        throw URLError(.badServerResponse)
                    }
                print("Shark:", element.data)
                return element.data
                }
//            .decode(type: ResponseDTO.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print ("Shark-url-completion: \($0).") },
                  receiveValue: { user in print ("Shark-url-user: \(user).")})
            .store(in: &cancellables)
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
     
    
    
    
    
    /// Example from Richard
    
    //func fetchObjects(completion: @escaping ([RAObject]?, Error?) -> Void) {
    //  // Create a URL object with the API endpoint
    //  let url = URL(string: "https://cowpte.com:8702/api/v1/questions/ra?pageNum=1&pageSize=20&sortType=questionId&sortDirection=asc")!
    //
    //  // Create a URLSession task to fetch the data
    //  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    //    if let error = error {
    //      completion(nil, error)
    //      return
    //    }
    //
    //    guard let data = data else {
    //      completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received from server"]))
    //      return
    //    }
    //
    //    let decoder = JSONDecoder()
    //    do {
    //      let response = try decoder.decode(ApiResponse.self, from: data)
    //      completion(response.object.content, nil)
    //    } catch {
    //      completion(nil, error)
    //    }
    //  }
    //
    //  // Start the task
    //  task.resume()
    //}
    func fetchObjects() -> AnyPublisher<[MyObject], Error> {
      let url = URL(string: "https://cowpte.com:8702/api/v1/questions/ra?pageNum=1&pageSize=20&sortType=questionId&sortDirection=asc")!
      return URLSession.shared.dataTaskPublisher(for: url)
        .tryMap { element -> Data in
            print("shark-tryMap", element)
            guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                  throw URLError(.badServerResponse)
            }
            return element.data
        }
        .decode(type: APIResponse.self, decoder: JSONDecoder())
        .map { $0.object.content }
        .eraseToAnyPublisher()
    }
    
    
}
