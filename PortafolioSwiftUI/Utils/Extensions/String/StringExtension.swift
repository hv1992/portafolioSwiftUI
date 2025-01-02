//
//  StringExtension.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-01.
//

import Foundation

extension String {
    static func codableToString(value : Codable) -> String? {
        // Encode the user object to JSON data
        let jsonData = try? JSONEncoder().encode(value)
        
        // Convert JSON data to a string
        if let jsonData = jsonData,let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        } else {
            print("Error codificacion")
            return nil
        }
    }
}
