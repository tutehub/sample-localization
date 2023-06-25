//
//  myApiViewModel.swift
//  sample_app
//
//  Created by Trisha Chandrasekar on 11/6/2023.
//

import Foundation
import Combine


class ContentViewModel: ObservableObject {
    @Published var resultText: String = ""
    @Published var questionNumber: String = ""

    
    /// Example from Richard
    @Published var objects: [MyObject] = []
    @Published var error: Error?
    private var cancellables = Set<AnyCancellable>()
    
    
    
    
    func makeGetRequest() {
        guard let questionNumber = Int(questionNumber) else {
            resultText = NSLocalizedString("Invalid number", comment: "")
            return
        }

        let urlString = "https://cowpte.com:8702/api/v1/questions/wfd/\(questionNumber)"
        guard let url = URL(string: urlString) else {
            resultText = NSLocalizedString("Invalid URL", comment: "")
            return
        }

        
        NetworkManager.shared.getRequest(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let object = json["object"] as? [String: Any],
                       let title = object["title"] as? String {
                        DispatchQueue.main.async {
                            self.resultText = title
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.resultText = NSLocalizedString("Parsing error", comment: "")
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.resultText = String(format: NSLocalizedString("Error: %@ - Unknown", comment: ""), error.localizedDescription)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.resultText = String(format: NSLocalizedString("Error: %@ - Unknown", comment: ""), error.localizedDescription)
                }
            }
        }
        NetworkCombineManager.shared.getRequest()
        
        
        
        
        /// Example from Richard
//        self.error = nil
//        NetworkCombineManager.shared.fetchObjects()
//          .receive(on: DispatchQueue.main)
//          .sink(
//            receiveCompletion: { completion in
//                print("shark-receiveCompletion")
//                switch completion {
//                    case .failure(let error):
//                        self.error = error
//                    case .finished:
//                        break
//                }
//            },
//            receiveValue: { objects in
//                print("shark-receiveValue", objects)
//                self.objects = objects
//            }
//          )
//          .store(in: &cancellables)
        
        
        
        /// Example for ObservableObject
        let john = Contact(name: "John Appleseed", age: 24)
        _ = john.objectWillChange
            .sink { _ in
                print("\(john.age) will change")
        }
        print(john.haveBirthday())
        // Prints "24 will change"
        // Prints "25"

    }
    

}
