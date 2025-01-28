//
//  StringExtension.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-01.
//

import Foundation

extension String {
    
    /// Obtiene un objeto de tipo Codable (que se usa para mapear las llamadas) y retorna la información del mismo en un string de formato json.
    /// - Parameter value: el objeto Codable que vamos a procesar
    /// - Returns: el contenido del objeto Codable, en un string con el formato json.
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
