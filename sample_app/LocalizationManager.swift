//
//  LocalizationManager.swift
//  sample_app
//
//  Created by Trisha Chandrasekar on 14/6/2023.
import SwiftUI

final class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()
    
    var languageBundle: Bundle?
    
    init() {
        switchLanguage()
    }
    
    func switchLanguage() {
        // change language
        if let languageCode = UserDefaults.standard.string(forKey: "language") {
            UserDefaults.standard.set(languageCode == "zh-HK" ? "en" : "zh-HK", forKey: "language")
        } else {
            
            // default language is English
            UserDefaults.standard.set("en", forKey: "language")
        }

        let path = Bundle.main.path(forResource: language(), ofType: "lproj") ?? Bundle.main.path(forResource: "en", ofType: "lproj")!
        languageBundle = Bundle(path: path)
        objectWillChange.send()
    }


    func language() -> String {
        return UserDefaults.standard.string(forKey: "language") ?? "en"
    }

    func localizedString(_ key: String) -> String {
        let str = languageBundle?.localizedString(forKey: key, value: nil, table: nil) ?? ""
//        print("Localized string for key '\(key)' is '\(str)'")
        return str
    }
}
