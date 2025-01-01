//
//  HttpRequest2.swift
//  PortafolioSwiftUI
//
//  Created by Hugo Villagra on 2025-01-01.
//

import Foundation

actor HttpRequest2 : GlobalActor{
    
    //Esto es obligatorio agregar cuando se va a hacer un global actor
    static public let shared = HttpRequest2()
    
    func requestCodable<T : Codable>(urlString : String,parametersBody : JSON?,headers : JSON?) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            
            var headerParameters : JSON = [:]
            
            guard let url = URL(string: urlString) else {
                print("URL Invalida")
                return
            }
            
            if let headersTemp = headers {
                headerParameters = headersTemp
            }
            
            if !headerParameters.keys.contains("Content-Type"){
                headerParameters["Content-Type"] = "application/json"
            }
            
            
            URLSession.shared.dataTask(with: url) { data, response,error in
                
                guard let data = data else { return }
                do{
                    let json = try JSONDecoder().decode(T.self, from: data)
                    continuation.resume(returning: json)
                }catch let error as NSError{
                    print("Error en el json", error.localizedDescription)
                }
                
            }.resume()
            
        }
    }
}
