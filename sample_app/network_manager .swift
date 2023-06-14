//
//  network_manager .swift
//  sample_app
//
//  Created by Trisha Chandrasekar on 11/6/2023.
//

import Foundation

func getRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        DispatchQueue.main.async {
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            }
        }
    }
    task.resume()
}
