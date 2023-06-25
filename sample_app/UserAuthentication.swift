//
//  UserAuthentication.swift
//  sample_app
//
//  Created by Work Mac on 25/6/2023.
//

import Foundation


class UserAuthentication: ObservableObject {
    var username = "Taylor" {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var published: String = ""
    var non_published: String = ""
}
