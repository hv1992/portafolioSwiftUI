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
    
    /// Nos permite hacer llamadas de API utilizando la clase URLSession
    /// - Parameters:
    ///   - urlString: la url en el cual se va a llamar al api
    ///   - parametersBody: parametros que se van a ir en el body
    ///   - parametersHeaders: parametros que se van a ir en el header
    ///   - httpMethod: el tipo de llamada http que se va hacer (GET, POST, ...)
    /// - Returns: retorna un objeto que hereda de Codable.
    func requestCodable<T : Codable>(urlString : String,parametersBody : JSON?,parametersHeaders : [String : String]?,httpMethod : TypeHttpEnum = TypeHttpEnum.get) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            
            // Aca preguntamos que la cargo la url de forma correcta, sino, lanzará un error de url invalida
            guard let url = URL(string: urlString) else {
                continuation.resume(throwing: URLError(.badURL))
                return
            }
            
            //Preparamos el objeto que administra las configuraciones del request para hacer la llamada
            var request = URLRequest(url: url)
            
            //Pregunta si se van a enviar parametros en el body
            if parametersBody != nil{
                //Convierte el parametro de [String:Any] a tipo data, y lo carga en el request
                let body = try? JSONSerialization.data(withJSONObject: parametersBody!)
                request.httpBody = body
            }
            
            //Pregunta si es que existe parametros para el header
            if let headerParameters = parametersHeaders {
                for headerParameter in headerParameters{
                    request.setValue(headerParameter.value, forHTTPHeaderField: headerParameter.key)
                }
                //Por defecto, el content-type debe existir
                if !headerParameters.keys.contains("Content-Type") {
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
            } else {
                //Por defecto, el content-type debe existir
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            request.httpMethod = httpMethod.value
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data else { return }
                do{
                    let json = try JSONDecoder().decode(T.self, from: data)
                    print("Resultado llamada:")
                    print(String.codableToString(value: json) ?? "")
                    print("******************************")
                    continuation.resume(returning: json)
                } catch let error as NSError{
                    print("Error en el json", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            }.resume()
            
        }
    }
}
