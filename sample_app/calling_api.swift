//
//  calling_api.swift
//  sample_app
//
//  Created by Trisha Chandrasekar on 11/6/2023.
//

import Foundation

func callAPI(){
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else{
        return
    }


    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        if let data = data, let string = String(data: data, encoding: .utf8){
            print(string)
        }
    }

    task.resume()
}

callAPI()
