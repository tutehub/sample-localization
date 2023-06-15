//
//  myApiViewModel.swift
//  sample_app
//
//  Created by Trisha Chandrasekar on 11/6/2023.
//

import Foundation
import Network

class ContentViewModel: ObservableObject {
    @Published var resultText: String = ""
    @Published var questionNumber: String = ""

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
    }
}
