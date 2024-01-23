//
//  URLProvider.swift
//  setDelegate
//
//  Created by Rafael Loggiodice on 20/1/24.
//

import Foundation

class URLProvider {
    static func urlForLabel(_ label: String) -> URL? {
        switch label {
        case "Github":
            return URL(string: "https://www.github.com/rafaelglg")
        case "Linkedin":
            return URL(string: "https://www.linkedin.com/in/rafaelglg")
        // Agrega más casos según sea necesario para otras etiquetas
        default:
            return nil
        }
    }
}

